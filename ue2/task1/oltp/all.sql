CREATE TABLE BI_OLTP_4.TB_Address
(
  AddressID     INT AUTO_INCREMENT,
  AddressLine   VARCHAR(200) NOT NULL,
  City          VARCHAR(200) NOT NULL,
  StateProvince VARCHAR(200),
  Suffix        VARCHAR(200),
  EmailAddress  VARCHAR(200),
  PostalCode    VARCHAR(100) NOT NULL,
  CountryRegion VARCHAR(200),
  CONSTRAINT PK_Address PRIMARY KEY (AddressID)
);

CREATE TABLE BI_OLTP_4.TB_Customer
(
  Title        VARCHAR(25),
  CustomerID   INT AUTO_INCREMENT,
  FirstName    VARCHAR(200) NOT NULL,
  LastName     VARCHAR(200) NOT NULL,
  MiddleName   VARCHAR(200),
  Suffix       VARCHAR(200),
  EmailAddress VARCHAR(200),
  Phone        VARCHAR(100),
  Gender       CHAR         NOT NULL CHECK (Gender IN ('M', 'F')),
  Birthdate    DATE         NOT NULL,
  CONSTRAINT PK_Customer PRIMARY KEY (CustomerID)
);

CREATE TABLE BI_OLTP_4.TB_CustomerAddress
(
  CustomerID  INT,
  AddressID   INT,
  AddressType VARCHAR(100),
  CONSTRAINT FK_Customer FOREIGN KEY (CustomerID) REFERENCES TB_Customer (CustomerID),
  CONSTRAINT FK_Address FOREIGN KEY (AddressID) REFERENCES TB_Address (AddressID),
  CONSTRAINT PK_CustomerAddress PRIMARY KEY (CustomerID, AddressID)
);

CREATE TABLE BI_OLTP_4.TB_ProductCategory (
  ProductCategoryID       INT AUTO_INCREMENT,
  ParentProductCategoryID INT,
  Name                    VARCHAR(200) NOT NULL,

  FOREIGN KEY FK_ParentProductCategory (ParentProductCategoryID) REFERENCES TB_ProductCategory (ProductCategoryID),
  PRIMARY KEY PK_ProductCategory (ProductCategoryID)
);

CREATE TABLE BI_OLTP_4.TB_Product (
  ProductID         INT AUTO_INCREMENT,
  Name              VARCHAR(200)   NOT NULL,
  ProductNumber     VARCHAR(200)   NOT NULL UNIQUE,
  StandardCost      NUMERIC(12, 2) NOT NULL,
  ListPrice         NUMERIC(12, 2) NOT NULL,
  Size              VARCHAR(100),
  Weight            NUMERIC(12, 2),
  ProductCategoryID INT            NOT NULL,
  ProductModelName  VARCHAR(200),
  SellStartDate     TIMESTAMP      NOT NULL,
  SellEndDate       TIMESTAMP,
  DiscontinuedDate  TIMESTAMP      NOT NULL,

  FOREIGN KEY FK_ProductCategory (ProductCategoryID) REFERENCES TB.ProductCategory (ProductCategoryID),
  PRIMARY KEY PK_Product (ProductID)
);

CREATE TABLE BI_OLTP_4.TB_SalesOrderDetail (
  SalesOrderID       INT,
  SalesOrderDetailID INT AUTO_INCREMENT,
  OrderQty           INT            NOT NULL,
  ProductID          INT            NOT NULL,
  UnitPrice          NUMERIC(12, 2) NOT NULL,

  FOREIGN KEY FK_SalesOrder (SalesOrderID) REFERENCES TB_SalesOrderHeader (SalesOrderID),
  FOREIGN KEY FK_Product (ProductID) REFERENCES TB_Product (ProductID),
  PRIMARY KEY PK_SalesOrderDetail (SalesOrderID, SalesOrderDetailID)
);

CREATE TABLE BI_OLTP_4.TB_ShipMethod (
  ShipMethodID       INT AUTO_INCREMENT,
  Name               VARCHAR(200)   NOT NULL,
  CostPerShipment    NUMERIC(12, 2) NOT NULL,
  CostPerUnit        NUMERIC(12, 2) NOT NULL,
  BulkyItemSurcharge NUMERIC(12, 2) NOT NULL,

  PRIMARY KEY PK_ShipMethod (ShipMethodID)
);


CREATE TABLE BI_OLTP_4.TB_SalesOrderHeader
(
  SalesORderID     INT PRIMARY KEY AUTO_INCREMENT,
  RevisionNumber   INT          NOT NULL,
  OrderDate        TIMESTAMP    NOT NULL,
  DueDate          TIMESTAMP    NOT NULL,
  ShipDate         TIMESTAMP,
  Status           INT          NOT NULL CHECK (Status >= 1 & Status <= 6),
  SalesOrderNumber VARCHAR(200) NOT NULL UNIQUE,
  CustomerID       INT          NOT NULL,
  ShipToAddressID  INT          NOT NULL,
  BillToAddressID  INT          NOT NULL,
  ShipMethodID     INT          NOT NULL,
  CONSTRAINT FK_Customer FOREIGN KEY (CustomerID) REFERENCES TB_Customer (CustomerID),
  CONSTRAINT FK_ShipToAddress FOREIGN KEY (ShipToAddressID) REFERENCES TB_Address (AddressID),
  CONSTRAINT FK_BillToAddress FOREIGN KEY (BillToAddressID) REFERENCES TB_Address (AddressID),
  CONSTRAINT FK_ShipMethod FOREIGN KEY (ShipMethodID) REFERENCES TB_ShipMethod (ShipMethodID)
);