INSERT INTO BI_OLAP_4.DM_Time
 SELECT Date, DAY(Date), MONTH(Date), YEAR(Date) FROM
   (
     SELECT SellStartDate AS 'Date'
     FROM BI_OLTP_4.TB_Product
     UNION
     SELECT SellEndDate
     FROM BI_OLTP_4.TB_Product
     UNION
     SELECT DiscontinuedDate
     FROM BI_OLTP_4.TB_Product
     UNION
     SELECT OrderDate
     FROM BI_OLTP_4.TB_SalesOrderHeader
     UNION
     SELECT DueDate
     FROM BI_OLTP_4.TB_SalesOrderHeader
     UNION
     SELECT ShipDate
     FROM BI_OLTP_4.TB_SalesOrderHeader
   ) Dates WHERE Date is not null;
