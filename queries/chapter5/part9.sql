-- 商品別に、2007年6月から8月までのそれぞれの月の販売額の推移を出しなさい。
-- なお、7月と8月は前月に対して、増加・変化なし・減少のそれぞれについて、↑・→・↓でそれぞれ表現しなさい。
-- （出力項目：ProductID、ProductName、6月販売金額、7月販売金額、対6月増減、8月販売金額、対7月増減；出力順：

-- ❶クロス集計を使います
-- ❷グループ化を使います
-- ❸外部結合を使います
-- ❹副問い合わせを使います
-- ❺並び替えを使います

-- productid |  年月   | productid | productcode |     productname      | price | categoryid
-- -----------+---------+-----------+-------------+----------------------+-------+------------
--         21 | 2006-09 |        21 |        5021 | 鰹節                 |   200 |          5
--         14 | 2006-09 |        14 |        3014 | じゃがいも           |   300 |          3


-- saleid | quantity | customerid | productid | employeeid |  saledate
-- --------+----------+------------+-----------+------------+------------
--       1 |        5 |          3 |        21 |         19 | 2006-09-01
--       2 |        1 |         20 |        14 |          4 | 2006-09-01

SELECT
  ProductID
, ProductName
, "6月販売金額"
, "7月販売金額"
, CASE WHEN "6月販売金額" < "7月販売金額"
THEN '↑' WHEN "6月販売金額" = "7月販売金額" THEN '→'
ELSE '↓' END AS 対6月増減
, "8月販売金額"
, CASE WHEN "7月販売金額" < "8月販売金額" THEN '↑' WHEN "7月販売金額" = "8月販売金額" THEN '→'
ELSE '↓' END AS 対7月増減
FROM (
SELECT
  p.ProductID
  , p.ProductName
  , SUM(
    CASE
      WHEN s.SaleDate IS NULL
        THEN 0
      WHEN SUBSTR( CAST( s.SaleDate AS VARCHAR), 1, 7) = '2007-06'
        THEN s.Quantity * p.Price
      ELSE 0
    END
) AS "6月販売金額" , SUM(
    CASE
      WHEN s.Quantity IS NULL
        THEN 0
      WHEN SUBSTR( CAST( s.SaleDate AS VARCHAR), 1, 7) = '2007-07'
        THEN s.Quantity * p.Price
      ELSE 0
    END
) AS "7月販売金額" , SUM(
    CASE
      WHEN s.Quantity IS NULL
        THEN 0
      WHEN SUBSTR( CAST( s.SaleDate AS VARCHAR), 1, 7) = '2007-08'
        THEN s.Quantity * p.Price
      ELSE 0
    END
) AS "8月販売金額"
FROM
  Products AS p
LEFT OUTER JOIN
  Sales s
ON
  p.ProductID = s.ProductID
GROUP BY
  p.ProductID
, p.ProductName
)
ORDER BY
  ProductID
;


-- 解説
---- STEP1
SELECT
  p.ProductID
  , p.ProductName
  , SUM(
    CASE
      WHEN s.SaleDate IS NULL
        THEN 0
      WHEN SUBSTR( CAST( s.SaleDate AS VARCHAR), 1, 7) = '2007-06'
        THEN s.Quantity * p.Price
      ELSE 0
    END
) AS "6月販売金額" , SUM(
    CASE
      WHEN s.Quantity IS NULL
        THEN 0
      WHEN SUBSTR( CAST( s.SaleDate AS VARCHAR), 1, 7) = '2007-07'
        THEN s.Quantity * p.Price
      ELSE 0
    END
) AS "7月販売金額" , SUM(
    CASE
      WHEN s.Quantity IS NULL
        THEN 0
      WHEN SUBSTR( CAST( s.SaleDate AS VARCHAR), 1, 7) = '2007-08'
        THEN s.Quantity * p.Price
      ELSE 0
    END
) AS "8月販売金額"
FROM
  Products AS p
LEFT OUTER JOIN
  Sales s
ON
  p.ProductID = s.ProductID
GROUP BY
  p.ProductID
, p.ProductName
-- productid |     productname      | 6月販売金額 | 7月販売金額 | 8月販売金額
-- -----------+----------------------+-------------+-------------+-------------
--         41 | ネコジャラシ         |           0 |        8700 |           0
--         40 | マタタビドリンク     |         960 |         240 |       24480
--         43 | ボール               |         150 |           0 |         300
--         32 | トイレトレイ         |       42000 |        2400 |           0
--         10 | 蜘蛛肉               |         196 |        3038 |        3528
--          9 | バッタ肉             |         555 |       15355 |        5920
--          6 | ねずみ肉             |         720 |         600 |        3960
--         12 | 大根                 |         270 |        1080 |         135
