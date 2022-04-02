-- 月別・カテゴリ別の合計販売額を一覧にして出しなさい。
-- なお、各月ごとに1行にまとめて、カテゴリは1から10までIDごとに集計して横に並べて表示しなさい。
-- （出力項目：年月、Ct1、Ct2、Ct3、Ct4、Ct5、Ct6、Ct7、Ct8、Ct9、Ct10；出力順：年月）
-- ❶クロス集計を使います
-- ❷グループ化を使います
-- ❸結合を使います
-- ❹並べ替えを使います

-- -- Sales
-- saleid | quantity | customerid | productid | employeeid | saledate

-- -- Products
-- productid | productcode | productname | price | categoryid
-- ------------+--------------

SELECT
  年月,
  Ct1,
  Ct2,
  Ct3,
  Ct4,
  Ct5,
  Ct6,
  Ct7,
  Ct8,
  Ct9,
  Ct10,
FROM


SELECT
年月,
SUM(
  CASE
    WHEN categoryid = 1 THEN s.quantity * p.price
    ELSE 0
  END
) AS Ct1,
SUM(
  CASE
    WHEN categoryid = 2 THEN s.quantity * p.price
    ELSE 0
  END
) AS Ct2,
SUM(
  CASE
    WHEN categoryid = 3 THEN s.quantity * p.price
    ELSE 0
  END
) AS Ct3,
SUM(
  CASE
    WHEN categoryid = 4 THEN s.quantity * p.price
    ELSE 0
  END
) AS Ct4,
SUM(
  CASE
    WHEN categoryid = 5 THEN s.quantity * p.price
    ELSE 0
  END
) AS Ct5,
SUM(
  CASE
    WHEN categoryid = 6 THEN s.quantity * p.price
    ELSE 0
  END
) AS Ct6,
SUM(
  CASE
    WHEN categoryid = 7 THEN s.quantity * p.price
    ELSE 0
  END
) AS Ct7,
SUM(
  CASE
    WHEN categoryid = 8 THEN s.quantity * p.price
    ELSE 0
  END
) AS Ct8,
SUM(
  CASE
    WHEN categoryid = 9 THEN s.quantity * p.price
    ELSE 0
  END
) AS Ct9,
SUM(
  CASE
    WHEN categoryid = 10 THEN s.quantity * p.price
    ELSE 0
  END
) AS Ct10
FROM
(
  SELECT
    productid
    ,quantity
    ,SUBSTR(CAST( SaleDate AS VARCHAR ), 1, 7) AS 年月
  FROM
    Sales
) AS s
JOIN
  Products AS p
ON
  s.ProductID = p.ProductID
GROUP BY
年月
ORDER BY
年月
;

-- productid |  年月   | productid | productcode |     productname      | price | categoryid 
-- -----------+---------+-----------+-------------+----------------------+-------+------------
--         21 | 2006-09 |        21 |        5021 | 鰹節                 |   200 |          5
--         14 | 2006-09 |        14 |        3014 | じゃがいも           |   300 |          3




-- saleid | quantity | customerid | productid | employeeid |  saledate
-- --------+----------+------------+-----------+------------+------------
--       1 |        5 |          3 |        21 |         19 | 2006-09-01
--       2 |        1 |         20 |        14 |          4 | 2006-09-01
