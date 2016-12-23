SELECT
  MonthNumberOfYear AS "Month",
  sum(TaxAmount) AS "Tax Payments"
FROM
  BI_OLAP_4.DW_FactSales,
  DW_Time
WHERE
  BI_OLAP_4.DW_FactSales.FK_OrderDate = DW_Time."Date"
    AND BI_OLAP_4.DW_FactSales.FK_OrderDate between cast('2014-01-01' AS date) AND cast('2014-07-31' AS date)
ORDER BY
  MonthNumberOfYear
GROUP BY
  MonthNumberOfYear;