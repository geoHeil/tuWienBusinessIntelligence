INSERT INTO BI_OLAP_4.DM_Product
  SELECT
    ProductID,
    ProductNumber,
    Name,
    ProductModelName,
    StandardCost,
    ListPrice,
    (SELECT Name
     FROM BI_OLTP_4.TB_ProductCategory
     WHERE ProductCategoryID = p.ProductCategoryID)                                            AS ProductSubCategory,
    (SELECT p3.Name
     FROM BI_OLTP_4.TB_ProductCategory p2
       JOIN BI_OLTP_4.TB_ProductCategory p3 ON p2.ParentProductCategoryID = p3.ProductCategoryID
     WHERE p2.ProductCategoryID = p.ProductCategoryID)
                                                                                               AS ProductTopCategory,
    SellStartDate,
    SellEndDate,
    DiscontinuedDate,
    Size,
    Weight,
    ((SELECT ParentProductCategoryID
      FROM BI_OLTP_4.TB_ProductCategory
      WHERE ProductCategoryID = p.ProductCategoryID) = 1 OR ProductCategoryID IN (16, 18, 20)) AS IsBulkyItem
  FROM BI_OLTP_4.TB_Product p
