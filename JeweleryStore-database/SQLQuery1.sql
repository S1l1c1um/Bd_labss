CREATE TABLE Discount (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Denomination NVARCHAR(20) NOT NULL,
    size INT NOT NULL CHECK (size >= 0 AND size <= 100)
);

CREATE TABLE Client (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Full_name NVARCHAR(100) NOT NULL,
    Adres NVARCHAR(100),
    Telephone NVARCHAR(20)
);

CREATE TABLE Workshop (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Adres NVARCHAR(100) NOT NULL 
);

CREATE TABLE Material (
    ID INT IDENTITY(1,1) PRIMARY KEY
);

CREATE TABLE Jewelery (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Product_name NVARCHAR(100) NOT NULL,
    Type_of_product NVARCHAR(20) NOT NULL,
    Workshop_ID INT NOT NULL,
    FOREIGN KEY (Workshop_ID) REFERENCES Workshop(ID)
);

CREATE TABLE Contract (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    data DATE NOT NULL DEFAULT GETDATE(),
    statuse NVARCHAR(20) NOT NULL,
    Price MONEY NOT NULL CHECK (Price > 0),
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
