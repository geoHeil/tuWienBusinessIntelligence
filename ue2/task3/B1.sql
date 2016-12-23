SELECT
  BI_OLAP_4.ProductTopCategory AS "Top Product Category",
  RANK() OVER (PARTITION BY BI_OLAP_4.ProductTopCategory ORDER BY sum(OrderQuantity) DESC) AS "Product Rank",
  BI_OLAP_4.Name AS "Product Name"
FROM
  DW_FactSales
JOIN
  BI_OLAP_4 ON DW_FactSales.FK_ProductID = BI_OLAP_4.ProductID
QUALIFY
  "Product Rank" <= 3 AND "Product Rank" >= 1
GROUP BY
  BI_OLAP_4.ProductTopCategory,
  BI_OLAP_4.ProductID,
  BI_OLAP_4.Name;