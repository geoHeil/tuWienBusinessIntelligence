CREATE TABLE BI_OLTP_4.TB_Customer
(
  Title        VARCHAR(25),
  CustomerID   INT AUTO_INCREMENT,
  FirstName    VARCHAR(200) NOT NULL,
  LastName     VARCHAR(200) NOT NULL,
  MiddleName   VARCHAR(200),
  Suffix       VARCHAR(200),
  EmailAddress VARCHAR(200),
  Phone        VARCHAR(100),
  Gender       CHAR         NOT NULL CHECK (Gender IN ('M', 'F')),
  Birthdate    DATE         NOT NULL,
  CONSTRAINT PK_Customer PRIMARY KEY (CustomerID)
);