SELECT
  p.ProductTopCategory,
  ROUND(SUM(f.OrderLineTotal), 2) AS Revenue
FROM BI_OLAP_4.DM_FactSales f
  JOIN BI_OLAP_4.DM_Time t ON f.OrderDate = t.Date
  JOIN BI_OLAP_4.DM_Product p ON f.ProductID = p.ProductID
WHERE t.CalendarYear = 2014
GROUP BY p.ProductTopCategory
ORDER BY p.ProductTopCategory