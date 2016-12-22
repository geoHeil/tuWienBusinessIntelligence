SELECT
  l.CountryRegion,
  ROUND(SUM(f.OrderLineProfit)) AS Profit
FROM BI_OLAP_4.DM_FactSales f
  JOIN BI_OLAP_4.DM_Time t ON f.OrderDate = t.Date
  JOIN BI_OLAP_4.DM_Location l ON f.BillToAddressID = l.AddressID
WHERE t.CalendarYear = 2013
GROUP BY l.CountryRegion
ORDER BY l.CountryRegion