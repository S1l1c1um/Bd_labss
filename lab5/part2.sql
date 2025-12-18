--через ALTER COLUMN
-- маскируем телефоны клиентов
ALTER TABLE Client
ALTER COLUMN telephone ADD MASKED WITH (FUNCTION = 'partial(2,"xxxx-xx",5)');

-- маскируем адреса клиентов
ALTER TABLE Client  
ALTER COLUMN address ADD MASKED WITH (FUNCTION = 'partial(3,"xxxxxxxx",0)');

-- руководителю реальные данные
GRANT UNMASK TO Role_JeweleryManager;

-- проверка маскирования через ALTER COLUMN
EXECUTE AS USER = 'User_JeweleryManager'
SELECT TOP 3 full_name, telephone, address FROM Client
REVERT

EXECUTE AS USER = 'User_JeweleryEmployee'  
SELECT TOP 3 full_name, telephone, address FROM Client
REVERT
GO

--через функции и представления

-- Функция для маскирования ФИО
CREATE FUNCTION MaskClientName (
    @full_name NVARCHAR(100)
)
RETURNS NVARCHAR(100)
AS
BEGIN
    IF IS_MEMBER('Role_JeweleryManager') = 1
        RETURN @full_name
    
    DECLARE @parts TABLE (part NVARCHAR(50), idx INT IDENTITY(1,1));
    DECLARE @result NVARCHAR(100) = '';
    
    INSERT INTO @parts (part)
    SELECT value FROM STRING_SPLIT(@full_name, ' ');
    
    IF (SELECT COUNT(*) FROM @parts) >= 3
        SELECT @result = 
            (SELECT part FROM @parts WHERE idx = 1) + ' ' +
            LEFT((SELECT part FROM @parts WHERE idx = 2), 1) + '. ' +
            LEFT((SELECT part FROM @parts WHERE idx = 3), 1) + '.';
    ELSE
        SET @result = @full_name;
    
    RETURN @result;
END
GO

-- функция для маскирования телефона
CREATE FUNCTION MaskClientPhoneFunc (
    @phone NVARCHAR(20)
)
RETURNS NVARCHAR(20)
AS
BEGIN
    IF IS_MEMBER('Role_JeweleryManager') = 1
        RETURN @phone
    RETURN '+7(XXX)XXX-XX-XX'
END
GO

--функция для маскирования адреса
CREATE FUNCTION MaskClientAddressFunc (
    @address NVARCHAR(100)
)
RETURNS NVARCHAR(100)
AS
BEGIN
    IF IS_MEMBER('Role_JeweleryManager') = 1
        RETURN @address
    
    IF @address LIKE '%ул.%' RETURN 'ул. [скрыто]'
    IF @address LIKE '%пр.%' RETURN 'пр. [скрыто]'
    IF @address LIKE '%пер.%' RETURN 'пер. [скрыто]'
    
    RETURN 'адрес [скрыт]'
END
GO

--защищенное представление для клиентов
CREATE VIEW vw_Clients_Protected
AS
SELECT 
    ID,
    dbo.MaskClientName(full_name) AS full_name,
    dbo.MaskClientAddressFunc(address) AS address,
    dbo.MaskClientPhoneFunc(telephone) AS telephone
FROM Client
GO

-- доступ к защищенному представлению
GRANT SELECT ON vw_Clients_Protected TO Role_JeweleryEmployee

-- проверка для руководителя
EXECUTE AS USER = 'User_JeweleryManager'
SELECT TOP 3 * FROM Client
REVERT

-- проверка для сотрудника
EXECUTE AS USER = 'User_JeweleryEmployee'
SELECT TOP 3 * FROM Client
SELECT TOP 3 * FROM vw_Clients_Protected as telephone_full
REVERT

