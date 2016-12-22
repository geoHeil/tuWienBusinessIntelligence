SELECT
  c.Name,
  ROUND(SUM(f.OrderLineProfit), 2) AS Profit
FROM BI_OLAP_4.DM_FactSales f
  JOIN BI_OLAP_4.DM_Time t ON f.OrderDate = t.Date
  JOIN BI_OLAP_4.DM_Customer c ON f.CustomerID = c.CustomerID
WHERE t.CalendarYear = 2014 AND t.MonthNumberOf <= 6
GROUP BY c.Name
ORDER BY SUM(f.OrderLineProfit) DESC
LIMIT 10