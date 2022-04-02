UPDATE
  Customers
SET
  CustomerCode = CustomerClassID * 1000000 + Prefecturalid * 10000 + customerid;

-- customerclassID
-- 1000000 FROM
-- 2000000 TO
-- PrefecturalID
--   10000 FROM
--  470000 TO
-- CustomerID
--       1 FROM
--      30 TO
