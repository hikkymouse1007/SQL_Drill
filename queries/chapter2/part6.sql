-- e.g1
SELECT
CustomerName || '様' AS お名前
FROM
Customers
;

-- practice1
SELECT
EmployeeName || 'さん' AS 社員名
FROM
Employees;

-- practice2
SELECT
'E-MAIL:' || Email AS メールアドレス
FROM
Employees;

-- practice3
SELECT
(EmployeeName || 'さんの') || ('E-MAIL:'|| Email) AS Email
FROM
Employees;

-- practice4
SELECT
CustomerName || '様のお住まいは' || Address AS お得意様連絡先
FROM
Customers;

-- practice5
SELECT
'社員' || EmployeeName || 'さんの血液型は' || BloodType || '型' AS 社員血液型
FROM
Employees;
