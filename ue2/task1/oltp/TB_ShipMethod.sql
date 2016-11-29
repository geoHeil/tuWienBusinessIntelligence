CREATE TABLE BI_OLTP_4.TB_ShipMethod (
  ShipMethodID       INT AUTO_INCREMENT,
  Name               VARCHAR(200)   NOT NULL,
  CostPerShipment    NUMERIC(12, 2) NOT NULL,
  CostPerUnit        NUMERIC(12, 2) NOT NULL,
  BulkyItemSurcharge NUMERIC(12, 2) NOT NULL,

  PRIMARY KEY PK_ShipMethod (ShipMethodID)
);