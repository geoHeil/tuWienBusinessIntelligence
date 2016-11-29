CREATE TABLE BI_OLTP_4.TB_SalesOrderDetail (
  SalesOrderID       INT,
  SalesOrderDetailID INT,
  OrderQty           INT            NOT NULL,
  ProductID          INT            NOT NULL,
  UnitPrice          NUMERIC(12, 2) NOT NULL,

  FOREIGN KEY FK_SalesOrder (SalesOrderID) REFERENCES TB_SalesOrderHeader (SalesOrderID),
  FOREIGN KEY FK_Product (ProductID) REFERENCES TB_Product (ProductID),
  PRIMARY KEY PK_SalesOrderDetail (SalesOrderID, SalesOrderDetailID)
);