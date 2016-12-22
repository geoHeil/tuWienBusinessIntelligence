SELECT
  t.CalendarYear                AS Year,
  t.MonthNumberOf               AS Month,
  p.ProductTopCategory          AS TopProductCategory,
  ROUND(SUM(f.OrderLineProfit)) AS MonthlyProfit
FROM BI_OLAP_4.DM_FactSales f
  JOIN BI_OLAP_4.DM_Time t ON f.OrderDate = t.Date
  JOIN BI_OLAP_4.DM_Product p ON f.ProductID = p.ProductID
WHERE concat(t.CalendarYear, '.', t.MonthNumberOf) IN (
  SELECT concat(CalendarYear, '.', MonthNumberOf)
  FROM (
         SELECT DISTINCT
           CalendarYear,
           MonthNumberOf
         FROM DM_Time
         ORDER BY CalendarYear DESC, MonthNumberOf DESC
         LIMIT 24) x
)
GROUP BY t.CalendarYear, t.MonthNumberOf, p.ProductTopCategory
ORDER BY t.CalendarYear, t.MonthNumberOf, p.ProductTopCategory