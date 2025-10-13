USE JaweleryStore;

CREATE TABLE Discount (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    denomination NVARCHAR(20) NOT NULL,
    size INT NOT NULL CHECK (size >= 0 AND size <= 100)
);

CREATE TABLE Client (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    full_name NVARCHAR(100) NOT NULL,
    adres NVARCHAR(100),
    telephone NVARCHAR(20)
);

CREATE TABLE Workshop (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    adres NVARCHAR(100) NOT NULL 
);

CREATE TABLE Material (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    [name] NVARCHAR(100) NOT NULL
);

CREATE TABLE Jewelery (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    product_name NVARCHAR(100) NOT NULL,
    type_of_product NVARCHAR(20) NOT NULL,
    workshop_ID INT NOT NULL,
    FOREIGN KEY (workshop_ID) REFERENCES workshop(ID)
);

CREATE TABLE Contract (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    data DATE NOT NULL DEFAULT GETDATE(),
    statuse NVARCHAR(20) NOT NULL,
    price MONEY NOT NULL CHECK (price > 0),
    client_ID INT NOT NULL,
    jewelery_ID INT NOT NULL UNIQUE,
    discount_ID INT NOT NULL,
    FOREIGN KEY (client_ID) REFERENCES client(ID),
    FOREIGN KEY (jewelery_ID) REFERENCES jewelery(ID),
    FOREIGN KEY (discount_ID) REFERENCES discount(ID)
);

CREATE TABLE client_discount (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    client_ID INT NOT NULL,
    discount_ID INT NOT NULL,
    FOREIGN KEY (client_ID) REFERENCES client(ID),
    FOREIGN KEY (discount_ID) REFERENCES discount(ID)
);

CREATE TABLE jewelery_material(
    material_ID INT NOT NULL,
    jewelery_ID INT NOT NULL,
    weight DECIMAL(10,2) NOT NULL CHECK (weight > 0),
    PRIMARY KEY (jewelery_ID, material_ID),
    FOREIGN KEY (material_ID) REFERENCES material(ID),
    FOREIGN KEY (jewelery_ID) REFERENCES jewelery(ID)
);

INSERT INTO Discount (������������, ������) VALUES
('�������', 5),
('����������', 10),
('VIP', 15),
('����������', 15),
('�������', 20),
('��������', 8),
('����������', 10),
('�������', 5),
('������������', 6),
('����������', 8);

INSERT INTO Client (���, �����, �������) VALUES
('������� ������ ��������', '��. ��������, �.3, ��.2', '+7(915)193-00-44'),
('��������� ������� ����������', '��. ������������, �.13', '+7(966)799-00-55'),
('���������� ������� ��������', '��. ���, �.3, ��.99', '+7(995)456-00-74'),
('������� ������� ����������', '��. �������, �.7', '+7(930)344-00-90'),
('��������� ������ ����������', '��. ������, �.15, ��.33', '+7(910)256-00-01'),
('����������� ����� ���������', '��. ������, �.42', '+7(999)678-00-87'),
('�� ����� ����������', '��. ������, �.5, ��.98', '+7(980)789-00-46'),
('������ ������� ����������', '��. ������, �.52', '+7(900)890-00-25'),
('���� ������ ������������', '��. ������, �.4, ��.7', '+7(950)985-00-45'),
('����� ������ ���������', '��. ��������, �.9', '+7(940)097-00-43');

INSERT INTO Workshop (�����) VALUES
('��. ���, �.3'),
('��. ����, �.75'),
('��. ����, �.76'),
('���. �����, �. 31'),
('��. ���, �.32');

INSERT INTO Material DEFAULT VALUES;
INSERT INTO Material DEFAULT VALUES;
INSERT INTO Material DEFAULT VALUES;
INSERT INTO Material DEFAULT VALUES;
INSERT INTO Material DEFAULT VALUES;
INSERT INTO Material DEFAULT VALUES;
INSERT INTO Material DEFAULT VALUES;
INSERT INTO Material DEFAULT VALUES;

INSERT INTO Jewelery (��������_�������, ���_�������, Workshop_ID) VALUES
('����������� ������ "�������"', '������', 1),
('������ "�������"', '������', 2),
('����� "������"', '�����', 3),
('�������� "����"', '��������', 1),
('������� "�����"', '�������', 4),
('�������� "�������"', '������', 2),
('������� "���������"', '�������', 5),
('�������� "�������"', '��������', 3),
('������ "����������"', '������', 4),
('�������� "�����"', '��������', 5),
('����� "����������"', '�����', 1),
('������� "��������"', '�������', 2);

INSERT INTO Contract (����, ������, ���������, Client_ID, Jewelery_ID, Discount_ID) VALUES
('2025-01-01', '��������', 45000, 1, 1, 1),
('2025-02-04', '� ������', 78000, 2, 2, 2),
('2025-03-05', '��������', 125000, 3, 3, 3),
('2025-04-07', '�������', 32000, 4, 4, 2),
('2025-05-08', '��������', 95600, 5, 5, 4),
('2025-06-09', '� ������', 45000, 6, 6, 3),
('2025-07-10', '��������', 28700, 7, 7, 1),
('2025-08-11', '��������', 189000, 8, 8, 5),
('2025-09-12', '��������', 54300, 9, 9, 2),
('2025-10-13', '� ������', 36700, 10, 10, 1),
('2025-11-14', '��������', 89200, 1, 11, 2), 
('2025-12-12', '��������', 67400, 3, 12, 3); 

INSERT INTO Klientskidka (Client_ID, Discount_ID) VALUES
(1, 1), 
(1, 2), 
(2, 2), 
(3, 3),  
(3, 6),  
(4, 2),  
(5, 4),  
(5, 7),  
(6, 3),  
(7, 1),  
(8, 5),  
(8, 8), 
(9, 2),  
(9, 9),  
(10, 1), 
(10, 10); 

INSERT INTO Materializdelie (Material_ID, Jewelery_ID) VALUES
(1, 1),  
(1, 2),   
(2, 3),  
(3, 4),  
(2, 5),   
(4, 6),   
(1, 7),  
(5, 8),   
(3, 9),  
(2, 10), 
(4, 11),  
(5, 12),  
(1, 3),  
(2, 8);   