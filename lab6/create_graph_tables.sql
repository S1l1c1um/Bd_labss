USE JaweleryStore;
GO

-- Создаем узлы 
CREATE TABLE ClientNode (
    ID INT PRIMARY KEY,
    full_name NVARCHAR(100) NOT NULL,
    address NVARCHAR(100),
    telephone NVARCHAR(20)
) AS NODE;

CREATE TABLE DiscountNode (
    ID INT PRIMARY KEY,
    denomination NVARCHAR(20) NOT NULL,
    size INT NOT NULL
) AS NODE;

CREATE TABLE WorkshopNode (
    ID INT PRIMARY KEY,
    address NVARCHAR(100) NOT NULL
) AS NODE;

CREATE TABLE MaterialNode (
    ID INT PRIMARY KEY,
    [name] NVARCHAR(100) NOT NULL
) AS NODE;

CREATE TABLE JeweleryNode (
    ID INT PRIMARY KEY,
    product_name NVARCHAR(100) NOT NULL,
    type_of_product NVARCHAR(20) NOT NULL
) AS NODE;

CREATE TABLE ContractNode (
    ID INT PRIMARY KEY,
    data DATE NOT NULL,
    status_ NVARCHAR(20) NOT NULL,
    price MONEY NOT NULL
) AS NODE;

-- Создаем ребра
CREATE TABLE HAS_DISCOUNT AS EDGE;

CREATE TABLE PRODUCED_IN AS EDGE;

CREATE TABLE MADE_OF (
    weight DECIMAL(10,2) NOT NULL
) AS EDGE;

CREATE TABLE HAS_CONTRACT AS EDGE;

CREATE TABLE IS_FOR AS EDGE;

CREATE TABLE USES_DISCOUNT AS EDGE;

-- Заполняем узлы данными из реляционных таблиц
INSERT INTO ClientNode (ID, full_name, address, telephone)
SELECT ID, full_name, address, telephone FROM Client;

INSERT INTO DiscountNode (ID, denomination, size)
SELECT ID, denomination, size FROM Discount;

INSERT INTO WorkshopNode (ID, address)
SELECT ID, address FROM Workshop;

INSERT INTO MaterialNode (ID, [name])
SELECT ID, [name] FROM Material;

INSERT INTO JeweleryNode (ID, product_name, type_of_product)
SELECT ID, product_name, type_of_product FROM Jewelery;

INSERT INTO ContractNode (ID, data, status_, price)
SELECT ID, data, status_, price FROM Contract;

-- Создаем связи между узлами

-- 1. Связь Client - HAS_DISCOUNT - Discount (из таблицы client_discount)
INSERT INTO HAS_DISCOUNT ($from_id, $to_id)
SELECT 
    cn.$node_id,
    dn.$node_id
FROM 
    client_discount cd
    JOIN ClientNode cn ON cd.client_ID = cn.ID
    JOIN DiscountNode dn ON cd.discount_ID = dn.ID;

-- 2. Связь Jewelery - PRODUCED_IN - Workshop
INSERT INTO PRODUCED_IN ($from_id, $to_id)
SELECT 
    jn.$node_id,
    wn.$node_id
FROM 
    Jewelery j
    JOIN JeweleryNode jn ON j.ID = jn.ID
    JOIN WorkshopNode wn ON j.workshop_ID = wn.ID;

-- 3. Связь Jewelery - MADE_OF - Material (с весом)
INSERT INTO MADE_OF ($from_id, $to_id, weight)
SELECT 
    jn.$node_id,
    mn.$node_id,
    jm.weight
FROM 
    jewelery_material jm
    JOIN JeweleryNode jn ON jm.jewelery_ID = jn.ID
    JOIN MaterialNode mn ON jm.material_ID = mn.ID;

-- 4. Связь Client - HAS_CONTRACT - Contract
INSERT INTO HAS_CONTRACT ($from_id, $to_id)
SELECT 
    cn.$node_id,
    contn.$node_id
FROM 
    Contract c
    JOIN ClientNode cn ON c.client_ID = cn.ID
    JOIN ContractNode contn ON c.ID = contn.ID;

-- 5. Связь Contract - IS_FOR - Jewelery
INSERT INTO IS_FOR ($from_id, $to_id)
SELECT 
    contn.$node_id,
    jn.$node_id
FROM 
    Contract c
    JOIN ContractNode contn ON c.ID = contn.ID
    JOIN JeweleryNode jn ON c.jewelery_ID = jn.ID;

-- 6. Связь Contract - USES_DISCOUNT - Discount
INSERT INTO USES_DISCOUNT ($from_id, $to_id)
SELECT 
    contn.$node_id,
    dn.$node_id
FROM 
    Contract c
    JOIN ContractNode contn ON c.ID = contn.ID
    JOIN DiscountNode dn ON c.discount_ID = dn.ID;
