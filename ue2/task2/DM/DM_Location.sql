CREATE TABLE BI_OLAP_4.DM_Location (
	AddressID INT,
	PostalCode VARCHAR(100) NOT NULL,
	City VARCHAR(200),
	StateProvince VARCHAR(200),
	CountryRegion VARCHAR(200),
	
	PRIMARY KEY PK_Location (AddressID)
);

