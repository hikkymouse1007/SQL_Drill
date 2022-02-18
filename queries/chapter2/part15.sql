-- e.g1
SELECT
ProductName
FROM
Products
ORDER BY
Price;

-- practice1
SELECT
EmployeeID,
EmployeeName,
Birthday
FROM
Employees
ORDER BY 
Birthday;

-- practice2
SELECT
SaleID,
Quantity,
CustomerID,
ProductID,
SaleDate
FROM
Sales
ORDER BY
CustomerID,
ProductID,
SaleDate DESC
;

-- practice3
SELECT
CategoryID,
COUNT(*) AS 商品数
FROM
Products
WHERE
Price <= 1000
GROUP BY
CategoryID
HAVING
COUNT(*) < 5
ORDER BY
CategoryID
;

-- practice4
SELECT
EmployeeID,
SUM(Amount)
FROM
Salary
GROUP BY
EmployeeID
ORDER BY
SUM(Amount);


-- practice5
SELECT
DepartmentID AS 部署ID,
COUNT(*) AS レコード数
FROM
BelongTo
WHERE
EndDate IS NULL
GROUP BY
DepartmentID
ORDER BY
COUNT(EmployeeID) desc
;
