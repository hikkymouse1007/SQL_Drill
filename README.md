# メモ

## 正誤表

https://gihyo.jp/book/2007/978-4-7741-3085-9/support

## Postres 環境構築

https://dev.classmethod.jp/articles/how-to-master-sql-tora-no-maki-1/

```shell
# build image
docker pull postgres

# run container
docker run --name postgres -d -e POSTGRES_PASSWORD=test  postgres

# login to container
docker exec -it postgres bash

# create db user
createuser -U postgres user1
psql -U postgres -c '\du'

# create database
createdb -U postgres -O user1 -E UTF8 --locale=C -T template0 testdb1
psql -U postgres -l

# login to postgres
root@e5ff2207fca4:/# psql -U user1 testdb1
psql (14.2 (Debian 14.2-1.pgdg110+1))
Type "help" for help.

testdb1=> help
You are using psql, the command-line interface to PostgreSQL.
Type:  \copyright for distribution terms
       \h for help with SQL commands
       \? for help with psql commands
       \g or terminate with semicolon to execute query
       \q to quit

# copy files into docker
docker cp sql postgres:/
docker exec -it postgres psql -f /sql/create_for_postgres.sql -U user1 -d testdb1
CREATE TABLE
ALTER TABLE
CREATE TABLE
ALTER TABLE
CREATE TABLE
ALTER TABLE
CREATE TABLE
ALTER TABLE
CREATE TABLE
ALTER TABLE
CREATE TABLE
ALTER TABLE
CREATE TABLE
ALTER TABLE
CREATE TABLE
ALTER TABLE
CREATE TABLE
ALTER TABLE
CREATE TABLE
ALTER TABLE

docker exec -it postgres psql -f /sql/data.sql -U user1 -d testdb1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1

```

SQL コマンド

```sql
testdb1=> SELECT * FROM Employees;
 employeeid | employeename | height |        email        | weight | hirefiscalyear |  birthday  | bloodtype
------------+--------------+--------+---------------------+--------+----------------+------------+-----------
          1 | シマゴロー   |    168 | simagoro@nekoyasudo |     72 |           1987 | 1956-10-01 | A
          2 | ゴッチン     |    161 | gochin@nekoyasudo   |     60 |           1987 | 1953-12-25 | B
          3 | マキ子       |    155 | maki@nekoyasudo     |     52 |           1987 | 1958-08-16 | O
          4 | マル         |    158 | maru@nekoyasudo     |     45 |           1987 | 1954-01-12 | AB
          5 | ミチロー     |    170 | michiro@nekoyasudo  |     70 |           1987 | 1965-02-14 | A
```

### LIKE のパターン

```
'羽生%'（「羽生」のあとに任意の文字列）
'羽%生%'（「羽」のあとに任意の文字列、「生」のあとにも任意の文字列）
'羽_生%'（「羽」のあとに任意の1文字、「生」のあとに任意の文字列）
'___生'（3文字の文字列の後に「生」という文字があるもの、つまり4文字の文字列で末尾が生という文字があるもの）
```

### Chapter 2 Part 14

Postgres の y/m/d のキャストについて
https://www.postgresqltutorial.com/postgresql-extract/

```sql
EXTRACT(year from Date)
```

### SQL のパフォーマンス

```sql
testdb1=> explain SELECT
ProductID,
ProductName
FROM
Products AS A
WHERE
 EXISTS
 (
   SELECT
   ProductID
   FROM
   Sales AS B
   WHERE
   A.ProductID = B.ProductID
 )
ORDER BY ProductID
;
                                             QUERY PLAN
----------------------------------------------------------------------------------------------------
 Sort  (cost=26.95..27.07 rows=48 width=222)
   Sort Key: a.productid
   ->  Nested Loop  (cost=20.66..25.61 rows=48 width=222)
         ->  HashAggregate  (cost=20.50..20.98 rows=48 width=4)
               Group Key: b.productid
               ->  Seq Scan on sales b  (cost=0.00..18.00 rows=1000 width=4)
         ->  Memoize  (cost=0.16..1.18 rows=1 width=222)
               Cache Key: b.productid
               Cache Mode: logical
               ->  Index Scan using products_pkey on products a  (cost=0.15..1.17 rows=1 width=222)
                     Index Cond: (productid = b.productid)
(11 rows)
```
