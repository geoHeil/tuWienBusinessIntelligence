INSERT INTO BI_OLAP_4.DM_FactSales
  SELECT
    SalesOrderNumber,
    CONCAT('SOL', d.SalesOrderID, '-', SalesOrderDetailID)                                     AS SalesOrderLineNumber,
    CustomerID,
    ProductID,
    ShipToAddressID,
    BillToAddressID,
    (SELECT name
     FROM BI_OLTP_4.TB_ShipMethod
     WHERE ShipMethodID = h.ShipMethodID)                                                      AS ShipmentMethod,
    UnitPrice,
    (OrderQty * UnitPrice * DiscountRate)                                                      AS Discount,
    OrderQty                                                                                   AS OrderQuantity,
    (OrderQty * UnitPrice - (OrderQty * UnitPrice * DiscountRate))                             AS OrderLineTotal,
    ((OrderQty * UnitPrice - (OrderQty * UnitPrice * DiscountRate)) - OrderQty * StandardCost) AS OrderLineProfit,
    ((OrderQty * UnitPrice - (OrderQty * UnitPrice * DiscountRate)) * (CASE WHEN a.CountryRegion = 'United States'
      THEN 0.08
                                                                       ELSE (CASE WHEN a.countryregion = 'Canada'
                                                                         THEN 0.13
                                                                             ELSE (CASE WHEN a.CountryRegion =
                                                                                             'United Kingdom'
                                                                               THEN 0.175
                                                                                   ELSE (CASE WHEN a.CountryRegion =
                                                                                                   'Australia'
                                                                                     THEN 0.1
                                                                                         ELSE 0 END) END) END) END)) AS TaxAmount,
    (OrderQty * s.CostPerUnit + s.BulkyItemSurcharge) as OrderLineFreightCost,
    Status AS OrderStatus,
    OrderDate,
    DueDate,
    ShipDate,
    (ShipDate > DueDate) as IsLateShipment
  FROM BI_OLTP_4.TB_SalesOrderHeader h
    INNER JOIN BI_OLTP_4.TB_Address a ON h.BillToAddressId = a.AddressId
    INNER JOIN BI_OLTP_4.TB_ShipMethod s ON h.ShipMethodID = s.ShipMethodID
    INNER JOIN (SELECT
                  d2.*,
                  p.StandardCost,
                  (CASE WHEN ParentProductCategoryID NOT IN (3, 4) OR OrderQty < 5
                    THEN 0
                   ELSE (CASE WHEN ParentProductCategoryID = 3
                     THEN (CASE WHEN OrderQty BETWEEN 5 AND 9
                       THEN 0.05
                           ELSE 0.1 END)
                         ELSE (CASE WHEN OrderQty BETWEEN 5 AND 9
                           THEN 0.04
                               ELSE 0.11 END) END) END) AS DiscountRate
                FROM BI_OLTP_4.TB_SalesOrderDetail d2 INNER JOIN
                  BI_OLTP_4.TB_Product p ON d2.ProductId = p.ProductId
                  INNER JOIN BI_OLTP_4.TB_ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID)
               d ON h.SalesOrderID = d.SalesOrderID
