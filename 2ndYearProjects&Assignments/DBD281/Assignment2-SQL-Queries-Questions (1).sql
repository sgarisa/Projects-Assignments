
--Q1 Assignment 2 
--USE AdventureWorks2019

/*SELECT  HumanResources.Employee.BusinessEntityID , HumanResources.Employee.NationalIDNumber , Person.Person.FirstName , Person.Person.LastName ,  HumanResources.Department.Name , HumanResources.Employee.JobTitle 
FROM Person.Person INNER JOIN HumanResources.Employee 
ON Person.Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID
INNER JOIN HumanResources.EmployeeDepartmentHistory 
ON HumanResources.Employee.BusinessEntityID = HumanResources.EmployeeDepartmentHistory.BusinessEntityID
INNER JOIN HumanResources.Department 
ON HumanResources.Department.DepartmentID = HumanResources.EmployeeDepartmentHistory.DepartmentID

WHERE HumanResources.Employee.OrganizationLevel = 1 AND EndDate IS NULL*/

--Q2 Assignment 2 
--USE AdventureWorks2019
/*; WITH CTETotalship( ShipID , Name , TotalPurchase )
AS
( SELECT [Purchasing].[ShipMethod].ShipMethodID , [Purchasing].[ShipMethod].Name , ROUND( SUM([Purchasing].[PurchaseOrderHeader].PurchaseOrderID) , 2 )
   FROM [Purchasing].[PurchaseOrderHeader] INNER JOIN [Purchasing].[ShipMethod]
   ON [Purchasing].[ShipMethod].ShipMethodID = [Purchasing].[PurchaseOrderHeader].ShipMethodID
    GROUP BY [Purchasing].[ShipMethod].ShipMethodID , [Purchasing].[ShipMethod].Name
) ,

CTETotalSales (ShipmentID,TotalSales)
AS
(SELECT ShipMethodID , ROUND ( SUM (Sales.SalesOrderHeader.TotalDue) , 2 )
FROM Sales.SalesOrderHeader 
GROUP BY ShipMethodID
) 

SELECT CTETotalship.ShipID , CTETotalship.Name , CTETotalSales.TotalSales , CTETotalship.TotalPurchase
FROM  CTETotalShip FULL OUTER JOIN  CTETotalSales  ON
CTETotalship.ShipID = CTETotalSales.ShipmentID*/


--Q3 Assignment 2 
--USE AdventureWorks2019


/*SELECT Title  , FirstName , LastName , CASE 
                                      
                                     WHEN PersonType = 'EM' THEN  'Employee'
									WHEN PersonType = 'SC' THEN   'Store Contact'
									WHEN PersonType =  'VC' THEN   'Vendor Contact'
                                     WHEN PersonType = 'IN' THEN  'Individual Customer'
									 ELSE 'No type'
									 END AS 'PersonType'
									
														
		FROM  Person.Person*/

--Q4 Assignment 2 


--USE AdventureWorks2019
/* DECLARE @Name nvarchar(50) , @ProdNo nvarchar(25) , @StartDate datetime , @EndDate datetime , @Description nvarchar(255) 
--Declare Cursor
DECLARE AdventureDB1_Cursor CURSOR
FOR
SELECT Production.Product.Name , Production.Product.ProductNumber , Sales.SpecialOffer.StartDate , Sales.SpecialOffer.EndDate , Sales.SpecialOffer.Description
FROM Production.Product 
INNER JOIN Production.ProductProductPhoto ON 
Production.Product.ProductID = Production.ProductProductPhoto.ProductID
INNER JOIN Sales.SpecialOfferProduct ON
Sales.SpecialOfferProduct.ProductID = Production.ProductProductPhoto.ProductID
INNER JOIN Sales.SpecialOffer ON
Sales.SpecialOffer.SpecialOfferID = Sales.SpecialOfferProduct.SpecialOfferID

WHERE Production.Product.ProductID = 707

OPEN AdventureDB1_Cursor

FETCH NEXT FROM AdventureDB1_Cursor INTO @Name , @ProdNo , @StartDate  , @EndDate  , @Description 

PRINT 'Product Number' + @ProdNo
PRINT 'Product Name' +  @Name 
PRINT  'Special Offers : '

WHILE @@FETCH_STATUS = 0 

BEGIN 
   PRINT CAST(@StartDate AS VARCHAR ) + ' to ' + CAST(@EndDate AS VARCHAR ) + ' ' + @Description
   FETCH NEXT FROM AdventureDB1_Cursor INTO @Name , @ProdNo , @StartDate  , @EndDate  , @Description 
END


CLOSE AdventureDB1_Cursor
DEALLOCATE AdventureDB1_Cursor*/

-- Q5 Assignment 2 

--USE AdventureWorks2019
/*GO
CREATE VIEW vwStoresales6( CustomerID , StoreName , OrderYear , YearSales ) 
AS

SELECT Sales.Customer.CustomerID , Sales.Store.Name , YEAR ( Sales.SalesOrderHeader.OrderDate)  , ROUND  ( SUM (Sales.SalesOrderHeader.TotalDue) , 2 )
FROM Sales.SalesOrderHeader INNER JOIN Sales.Customer
ON Sales.Customer.CustomerID = Sales.SalesOrderHeader.CustomerID
INNER JOIN Sales.Store ON
Sales.Customer.StoreID = Sales.Store.BusinessEntityID
GROUP BY Sales.Customer.CustomerID , Sales.Store.Name , YEAR ( Sales.SalesOrderHeader.OrderDate)
HAVING ROUND  ( SUM (Sales.SalesOrderHeader.TotalDue) , 2 ) > 100000

GO*/

--USE AdventureWorks2019
/*GO
SELECT *
FROM [dbo].[vwStoresales6]
ORDER BY [dbo].[vwStoresales6].CustomerID ASC , [dbo].[vwStoresales6].OrderYear DESC*/
























