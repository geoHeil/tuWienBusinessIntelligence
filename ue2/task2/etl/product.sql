INSERT INTO BI_OLAP_4.DM_Product
    SELECT ProductID, ProductNumber, Name, ProductModelName, StandardCost, ListPrice, ProductCategoryID as ProductSubCategory,
      (SELECT ParentProductCategoryID from BI_OLTP_4.TB_ProductCategory WHERE ProductCategoryID = p.ProductCategoryID)
    as ProductTopCategory, SellStartDate, SellEndDate, DiscontinuedDate, Size, Weight, ((SELECT ParentProductCategoryID from BI_OLTP_4.TB_ProductCategory WHERE ProductCategoryID = p.ProductCategoryID) = 1 OR ProductCategoryID IN (16, 18, 20)) as IsBulkyItem
FROm BI_OLTP_4.TB_Product p
