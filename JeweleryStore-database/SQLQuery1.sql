USE JeweleryStore;

CREATE TABLE Discount (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ������������ NVARCHAR(20) NOT NULL,
    ������ INT NOT NULL CHECK (������ >= 0 AND ������ <= 100)
);

CREATE TABLE Client (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ��� NVARCHAR(100) NOT NULL,
    ����� NVARCHAR(100),
    ������� NVARCHAR(20)
);

CREATE TABLE Workshop (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ����� NVARCHAR(100) NOT NULL 
);

CREATE TABLE Material (
    ID INT IDENTITY(1,1) PRIMARY KEY
);

CREATE TABLE Jewelery (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ��������_������� NVARCHAR(100) NOT NULL,
    ���_������� NVARCHAR(20) NOT NULL,
    Workshop_ID INT NOT NULL,
    FOREIGN KEY (Workshop_ID) REFERENCES Workshop(ID)
);

CREATE TABLE Contract (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ���� DATE NOT NULL DEFAULT GETDATE(),
    ������ NVARCHAR(20) NOT NULL,
    ��������� MONEY NOT NULL CHECK (��������� > 0),
    Client_ID INT NOT NULL,
    Jewelery_ID INT NOT NULL UNIQUE,
    Discount_ID INT NOT NULL,
    FOREIGN KEY (Client_ID) REFERENCES Client(ID),
    FOREIGN KEY (Jewelery_ID) REFERENCES Jewelery(ID),
    FOREIGN KEY (Discount_ID) REFERENCES Discount(ID)
);

CREATE TABLE Klientskidka (
    Client_ID INT NOT NULL,
    Discount_ID INT NOT NULL,
    FOREIGN KEY (Client_ID) REFERENCES Client(ID),
    FOREIGN KEY (Discount_ID) REFERENCES Discount(ID)
);

CREATE TABLE Materializdelie(
    Material_ID INT NOT NULL,
    Jewelery_ID INT NOT NULL,
    FOREIGN KEY (Material_ID) REFERENCES Material(ID),
    FOREIGN KEY (Jewelery_ID) REFERENCES Jewelery(ID)
);