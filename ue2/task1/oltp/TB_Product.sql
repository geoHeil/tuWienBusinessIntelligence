CREATE TABLE BI_OLTP_4.TB_Product (
	ProductID INT AUTO_INCREMENT,
	Name VARCHAR(200) NOT NULL,
	ProductNumber VARCHAR(200) NOT NULL UNIQUE,
	StandardCost NUMERIC(12,2) NOT NULL,
	ListPrice NUMERIC(12,2) NOT NULL,
	Size VARCHAR(100),
	Weight NUMERIC(12,2),
	ProductCategoryID INT NOT NULL,
	ProductModelName VARCHAR(200),
	SellStartDate TIMESTAMP NOT NULL,
	SellEndDate TIMESTAMP,
	DiscontinuedDate TIMESTAMP NOT NULL,
	
	FOREIGN KEY FK_ProductCategory (ProductCategoryID) REFERENCES TB.ProductCategory (ProductCategoryID),
	PRIMARY KEY PK_Product (ProductID),
);
