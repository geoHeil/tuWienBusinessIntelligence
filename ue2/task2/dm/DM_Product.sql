CREATE TABLE BI_OLTP_4.DM_Product (
  ProductID          INT AUTO_INCREMENT,
  ProductNumber      VARCHAR(200)   NOT NULL UNIQUE,
  Name               VARCHAR(200)   NOT NULL,
  ModelName          VARCHAR(200)   NOT NULL,
  StandardCost       NUMERIC(12, 2) NOT NULL,
  ListPrice          NUMERIC(12, 2) NOT NULL,
  ProductSubCategory INT,
  ProductTopCategory INT,
  SellStartDate      DATETIME       NOT NULL,
  SellEndDate        DATETIME,
  DiscontinuedDate   DATETIME,
  Size               VARCHAR(100),
  Weight             NUMERIC(12, 2),
  IsBulkyItem        BOOLEAN

  FOREIGN KEY FK_ProductCategory (ProductCategoryID) REFERENCES TB_ProductCategory (ProductCategoryID),
  PRIMARY KEY PK_Product (ProductID)
);