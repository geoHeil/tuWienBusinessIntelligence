CREATE TABLE BI_OLTP_4.TB_SalesOrderHeader
(
    SalesORderID INT PRIMARY KEY AUTO_INCREMENT,
    RevisionNumber INT NOT NULL,
    OrderDate TIMESTAMP NOT NULL,
    DueDate TIMESTAMP NOT NULL,
    ShipDate TIMESTAMP,
    Status INT NOT NULL,
    SalesOrderNumber String NOT NULL,
    Status CustomerID NOT NULL,
    Status ShipToAddressID NOT NULL,
    Status BillToAddressID NOT NULL,
    Status ShipMethodID NOT NULL,
    CONSTRAINT FK_Customer FOREIGN KEY (CustomerID) REFERENCES TB_Customer (CustomerID),
    --- TODO keys
    ---CONSTRAINT FK_Address FOREIGN KEY (ShipToAddressID) REFERENCES TB_Address (ShipToAddressID),
    ---CONSTRAINT FK_Address FOREIGN KEY (BillToAddressID) REFERENCES TB_Address (BillToAddressID),
    ---CONSTRAINT FK_Address FOREIGN KEY (ShipMethodID) REFERENCES TB_Address (ShipMethodID)
);