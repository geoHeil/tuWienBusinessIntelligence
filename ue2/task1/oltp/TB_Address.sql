CREATE TABLE BI_OLTP_4.TB_Address
(
  AddressID     INT AUTO_INCREMENT,
  AddressLine   VARCHAR(200) NOT NULL,
  City          VARCHAR(200) NOT NULL,
  StateProvince VARCHAR(200),
  Suffix        VARCHAR(200),
  EmailAddress  VARCHAR(200),
  PostalCode    VARCHAR(100) NOT NULL,
  CountryRegion VARCHAR(200),
  CONSTRAINT PK_Address PRIMARY KEY (AddressID)
);