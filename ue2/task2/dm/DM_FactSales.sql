CREATE TABLE BI_OLTP_4.DM_FactSales
(
  SalesORderID     INT AUTO_INCREMENT,
  RevisionNumber   INT          NOT NULL,
  OrderDate        DATETIME     NOT NULL,
  DueDate          DATETIME     NOT NULL,
  ShipDate         DATETIME,
  Status           INT          NOT NULL CHECK (Status >= 1 & Status <= 6),
  SalesOrderNumber VARCHAR(200) NOT NULL UNIQUE,
  CustomerID       INT          NOT NULL,
  ShipToAddressID  INT          NOT NULL,
  BillToAddressID  INT          NOT NULL,
  ShipMethodID     INT          NOT NULL,
  OrderQty           INT            NOT NULL,
  ProductID          INT            NOT NULL,
  UnitPrice          NUMERIC(12, 2) NOT NULL,
  CONSTRAINT FK_Customer2 FOREIGN KEY (CustomerID) REFERENCES TB_Customer (CustomerID),
  CONSTRAINT FK_ShipToAddress FOREIGN KEY (ShipToAddressID) REFERENCES TB_Address (AddressID),
  CONSTRAINT FK_BillToAddress FOREIGN KEY (BillToAddressID) REFERENCES TB_Address (AddressID),
  CONSTRAINT FK_ShipMethod FOREIGN KEY (ShipMethodID) REFERENCES TB_ShipMethod (ShipMethodID)
  FOREIGN KEY FK_Product (ProductID) REFERENCES TB_Product (ProductID),
  PRIMARY KEY PK_FactSales (SalesOrderID, SalesOrderNumber)
);