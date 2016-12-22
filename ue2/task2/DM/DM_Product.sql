CREATE TABLE BI_OLAP_4.DM_Product (
  ProductID          INT AUTO_INCREMENT,
  ProductNumber      VARCHAR(200)   NOT NULL UNIQUE,
  Name               VARCHAR(200)   NOT NULL,
  ModelName          VARCHAR(200)   NOT NULL,
  StandardCost       NUMERIC(12, 2) NOT NULL,
  ListPrice          NUMERIC(12, 2) NOT NULL,
  ProductSubCategory VARCHAR(200),
  ProductTopCategory VARCHAR(200),
  SellStartDate      DATE       NOT NULL,
  SellEndDate        DATE,
  DiscontinuedDate   DATE,
  Size               VARCHAR(100),
  Weight             NUMERIC(12, 2),
  IsBulkyItem        BOOLEAN,

  FOREIGN KEY FK_SellStartDate (SellStartDate) REFERENCES DM_Time (Date),
  FOREIGN KEY FK_SellEndDate (SellEndDate) REFERENCES DM_Time (Date),
  FOREIGN KEY FK_SellDiscontinuedDate (DiscontinuedDate) REFERENCES DM_Time (Date),
  PRIMARY KEY PK_Product (ProductID)
);
