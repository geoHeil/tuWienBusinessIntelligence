CREATE TABLE BI_OLTP_4.TB_SalesOrderHeader
(
  SalesORderID     INT PRIMARY KEY AUTO_INCREMENT,
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
  CONSTRAINT FK_Customer2 FOREIGN KEY (CustomerID) REFERENCES TB_Customer (CustomerID),
  CONSTRAINT FK_ShipToAddress FOREIGN KEY (ShipToAddressID) REFERENCES TB_Address (AddressID),
  CONSTRAINT FK_BillToAddress FOREIGN KEY (BillToAddressID) REFERENCES TB_Address (AddressID),
  CONSTRAINT FK_ShipMethod FOREIGN KEY (ShipMethodID) REFERENCES TB_ShipMethod (ShipMethodID)
);