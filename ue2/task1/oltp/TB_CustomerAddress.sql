CREATE TABLE BI_OLTP_4.TB_CustomerAddress
(
  CustomerID  INT,
  AddressID   INT,
  AddressType VARCHAR(100),
  CONSTRAINT FK_Customer1 FOREIGN KEY (CustomerID) REFERENCES TB_Customer (CustomerID),
  CONSTRAINT FK_Address FOREIGN KEY (AddressID) REFERENCES TB_Address (AddressID),
  CONSTRAINT PK_CustomerAddress PRIMARY KEY (CustomerID, AddressID)
);