INSERT INTO BI_OLAP_4.DM_Location
  SELECT AddressID, PostalCode, City, StateProvince, CountryRegion
FROM BI_OLTP_4.TB_Address;
