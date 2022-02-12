# メモ

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
