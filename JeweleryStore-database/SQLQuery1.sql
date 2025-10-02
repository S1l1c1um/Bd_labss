CREATE TABLE Discount (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    íàèìåíîâàíèå NVARCHAR(20) NOT NULL,
    ðàçìåð INT NOT NULL CHECK (ðàçìåð >= 0 AND ðàçìåð <= 100)
);

CREATE TABLE Client (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ÔÈÎ NVARCHAR(100) NOT NULL,
    Àäðåñ NVARCHAR(100),
    òåëåôîí NVARCHAR(20)
);

CREATE TABLE Workshop (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    àäðåñ NVARCHAR(100) NOT NULL 
);

CREATE TABLE Material (
    ID INT IDENTITY(1,1) PRIMARY KEY
);

CREATE TABLE Jewelery (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    íàçâàíèå_èçäåëèÿ NVARCHAR(100) NOT NULL,
    âèä_èçäåëèÿ NVARCHAR(20) NOT NULL,
    Workshop_ID INT NOT NULL,
    FOREIGN KEY (Workshop_ID) REFERENCES Workshop(ID)
);

CREATE TABLE Contract (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    äàòà DATE NOT NULL DEFAULT GETDATE(),
    ñòàòóñ NVARCHAR(20) NOT NULL,
    ñòîèìîñòü MONEY NOT NULL CHECK (ñòîèìîñòü > 0),
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
