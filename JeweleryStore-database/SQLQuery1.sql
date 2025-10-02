USE JeweleryStore;

CREATE TABLE Discount (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    наименование NVARCHAR(20) NOT NULL,
    размер INT NOT NULL CHECK (размер >= 0 AND размер <= 100)
);

CREATE TABLE Client (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ФИО NVARCHAR(100) NOT NULL,
    Адрес NVARCHAR(100),
    телефон NVARCHAR(20)
);

CREATE TABLE Workshop (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    адрес NVARCHAR(100) NOT NULL 
);

CREATE TABLE Material (
    ID INT IDENTITY(1,1) PRIMARY KEY
);

CREATE TABLE Jewelery (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    название_изделия NVARCHAR(100) NOT NULL,
    вид_изделия NVARCHAR(20) NOT NULL,
    Workshop_ID INT NOT NULL,
    FOREIGN KEY (Workshop_ID) REFERENCES Workshop(ID)
);

CREATE TABLE Contract (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    дата DATE NOT NULL DEFAULT GETDATE(),
    статус NVARCHAR(20) NOT NULL,
    стоимость MONEY NOT NULL CHECK (стоимость > 0),
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