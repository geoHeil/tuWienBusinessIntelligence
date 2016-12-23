SELECT
  ShipmentMethod as "Shipment Method",
  CountryRegion "Country Region",
  cast(sum(IsLateShipment) as Numeric(8,2))*100 / cast(count(IsLateShipment) as Numeric(8,2)) AS "Percentage of Late Shipments"
FROM
  BI_USER.DW_FactSales,
  BI_USER.DW_Location
WHERE
  BI_USER.DW_FactSales.FK_ShipToAddressID = AddressID
ORDER BY
  CountryRegion,
  ShipmentMethod ASC
GROUP BY
  ShipmentMethod,
  CountryRegion;