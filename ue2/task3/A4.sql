SELECT *
FROM (SELECT
        CustomerRank,
        d.Name AS    CustomerName,
        RANK()       OVER (PARTITION BY d.CustomerID ORDER BY COUNT(*) DESC) AS ProductRank,
        p.Name,
        ROW_NUMBER() OVER (PARTITION BY d.CustomerID ORDER BY COUNT(*) DESC) AS ProductRow,
        CustomerRow,
        COUNT(*)
      FROM (SELECT
              f.CustomerID,
              RANK()       OVER (ORDER BY SUM(f.OrderLineProfit) DESC) AS CustomerRank,
              ROW_NUMBER() OVER (ORDER BY SUM(f.OrderLineProfit) DESC) AS CustomerRow
            FROM BI_OLAP_4.DM_FactSales f
            GROUP BY f.CustomerID
            ORDER BY CustomerRow
            LIMIT 5
           ) c
        JOIN DM_FactSales f ON f.CustomerID = c.CustomerID
        JOIN DM_Product p ON f.ProductID = p.ProductID
        JOIN DM_Customer d ON f.CustomerID = d.CustomerID
      GROUP BY d.Name, d.CustomerID, p.Name, p.ProductID, c.CustomerRank, c.CustomerRow) iii
WHERE ProductRow <= 4
ORDER BY CustomerRow, ProductRow;