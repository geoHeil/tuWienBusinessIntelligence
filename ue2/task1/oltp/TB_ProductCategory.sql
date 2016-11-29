CREATE TABLE BI_OLTP_4.TB_ProductCategory (
  ProductCategoryID       INT AUTO_INCREMENT,
  ParentProductCategoryID INT,
  Name                    VARCHAR(200) NOT NULL,

  FOREIGN KEY FK_ParentProductCategory (ParentProductCategoryID) REFERENCES TB_ProductCategory (ProductCategoryID),
  PRIMARY KEY PK_ProductCategory (ProductCategoryID)
);