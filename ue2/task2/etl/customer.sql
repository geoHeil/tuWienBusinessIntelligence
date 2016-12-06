INSERT INTO BI_OLAP_4.DM_Customer
  SELECT
    customerid,
    concat(FirstName, ' ', (CASE WHEN MiddleName IS NOT NULL AND MiddleName <> ''
      THEN concat(MiddleName, (CASE WHEN MiddleName LIKE '%.'
        THEN ''
                               ELSE '.' END), ' ')
                            ELSE '' END), LastName, (CASE WHEN Suffix IS NOT NULL AND suffix <> ''
      THEN concat(', ', Suffix)
                                                     ELSE '' END)) AS Name,
    Birthdate         AS BirthDate,
    timestampdiff(YEAR, timestamp(Birthdate),
    STR_TO_DATE('2016-01-01', '%Y-%m-%d')) AS Age, ( CASE WHEN gender = 'M' THEN 'Male' ELSE 'Female' END ) AS Gender,
EmailAddress AS Email, Phone
FROM BI_OLTP_4.TB_Customer;
