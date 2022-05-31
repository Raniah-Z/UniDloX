-- e. To support database management process in Rika Mochi, Rika asked you 
-- to provide some query that resulting important data. Below query is the answer
-- (5. Query to answer the 10 cases):
USE UniDloX
GO

--Answer for case number 1
SELECT	PTN.StaffID,
		StaffName,
		StaffAddress,
		SupplierName,
		[Total Purchases] = COUNT(PTN.PurchaseID)
FROM MsInfoStaff AS MIF
	JOIN PurchaseTransaction AS PTN
		ON MIF.StaffID = PTN.StaffID
	JOIN MsInfoSupplier AS MIR
		ON MIR.SupplierID = PTN.SupplierID
WHERE MONTH(PurchaseTransactionDate) = 11
	AND CAST(RIGHT(PTN.StaffID, 1) AS INT) % 2 = 0
GROUP BY PTN.StaffID, StaffName, StaffAddress, SupplierName
GO

--Answer for case number 2
SELECT	STN.SalesID,
		CustomerName,
		[Total Sales Price] = SUM(CAST(ClothPrice AS INT) * QuantityCloth)
FROM MsInfoCustomer AS MIC
	JOIN SalesTransaction AS STN
		ON MIC.CustomerID = STN.CustomerID
	JOIN SpecificSalesTransaction AS SSN
		ON SSN.SalesID = STN.SalesID
	JOIN MsInfoCloth AS MIH
		ON MIH.ClothID = SSN.ClothID
WHERE CustomerName LIKE '%m%'
GROUP BY STN.SalesID, CustomerName
HAVING SUM(CAST(ClothPrice AS INT) * QuantityCloth) > 2000000
GO

--Answer for case number 3
SELECT	[Month] = DATENAME(MONTH, PurchaseTransactionDate),
		[Transaction Count] = COUNT(DISTINCT PTN.PurchaseID),
		[Material Sold Count] = SUM(QuantityMaterial)
FROM MsInfoStaff AS MIF
	JOIN PurchaseTransaction AS PTN
		ON MIF.StaffID = PTN.StaffID
	JOIN SpecificPurchaseTransaction AS SPN
		ON SPN.PurchaseID = PTN.PurchaseID
	JOIN MsInfoMaterial AS MIM
		ON MIM.MaterialID = SPN.MaterialID
WHERE StaffAge BETWEEN 25 AND 30 
	AND MaterialPrice > 150000
GROUP BY DATENAME(MONTH, PurchaseTransactionDate)
GO

--Answer for case number 4
SELECT	[CustomerName] = LOWER(CustomerName),
		CustomerEmail,
		CustomerAddress,
		[Cloth Bought Count] = COUNT(DISTINCT SSN.ClothID),
		[Total Price] = CONCAT('IDR ', SUM(QuantityCloth * CAST(ClothPrice AS INT)))
FROM MsInfoCustomer AS MIC
	JOIN SalesTransaction AS STN
		ON MIC.CustomerID = STN.CustomerID
	JOIN MsInfoPaymentType AS MPT
		ON MPT.PaymentTypeID = STN.PaymentTypeID
	JOIN SpecificSalesTransaction AS SSN
		ON SSN.SalesID = STN.SalesID
	JOIN MsInfoCloth AS MIH
		ON MIH.ClothID = SSN.ClothID
WHERE PaymentTypeName IN ('Cryptocurrency', 'Cash', 'Shopee-Pay')
GROUP BY LOWER(CustomerName), CustomerEmail, CustomerAddress
GO

--Answer for case number 5
SELECT	[PurchaseID] = RIGHT(PurchaseID, 3),
		[PurchaseDate] = PurchaseTransactionDate,
		StaffName,
		PaymentTypeName
FROM MsInfoStaff AS MIF
	JOIN PurchaseTransaction AS PTN
		ON MIF.StaffID = PTN.StaffID
	JOIN MsInfoPaymentType AS MPT
		ON MPT.PaymentTypeID = PTN.PaymentTypeID,
	(
		SELECT [Average_Staff_Salary] = AVG(MIF2.StaffSalary)
		FROM MsInfoStaff AS MIF2
		WHERE YEAR(MIF2.StaffBirthDate) < 1996
	) AS Average_Salary_Born_Before_Ninety_Six
WHERE StaffGender LIKE 'female' 
	AND	MIF.StaffSalary > Average_Salary_Born_Before_Ninety_Six.Average_Staff_Salary
GROUP BY RIGHT(PurchaseID, 3), PurchaseTransactionDate, StaffName, PaymentTypeName
GO

--Answer for case number 6
 SELECT	STN.SalesID,
		[SalesDate] = CONVERT(VARCHAR, SalesTransactionDate, 107),
		CustomerName,
		CustomerGender
 FROM MsInfoCustomer AS MIC
	JOIN SalesTransaction AS STN
		ON MIC.CustomerID = STN.CustomerID
	JOIN SpecificSalesTransaction AS SSN
		ON SSN.SalesID = STN.SalesID,
	(	
		SELECT [Minimum_of_All] = MIN(SSN2.QuantityCloth)
		FROM SpecificSalesTransaction AS SSN2 
			JOIN SalesTransaction AS STN2
				ON SSN2.SalesID = STN2.SalesID
		WHERE DAY(STN2.SalesTransactionDate) = 15
	) AS Minimum_All_Sales_Transaction
WHERE YEAR(SalesTransactionDate) = 2021 
	AND SSN.QuantityCloth < Minimum_All_Sales_Transaction.Minimum_of_All
GROUP BY STN.SalesID, CONVERT(VARCHAR, SalesTransactionDate, 107), CustomerName, CustomerGender
GO

--Answer for case number 7
SELECT	PTN.PurchaseID,
		SupplierName,
		[SupplierPhone] = STUFF(SupplierPhone, 1, 1, '+62'),
		[PurchaseDate] = DATENAME(WEEKDAY,PurchaseTransactionDate),
		[Quantity] = QuantityMaterial
FROM MsInfoSupplier AS MIR
	JOIN PurchaseTransaction AS PTN
		ON MIR.SupplierID = PTN.SupplierID
	JOIN SpecificPurchaseTransaction AS SPN
		ON SPN.PurchaseID = PTN.PurchaseID,
	(
		SELECT [Average_Qty] = AVG(Total_of_Quantity_Material.[Sum_of_Quantity])
		FROM 
		(
			SELECT [Sum_of_Quantity] = SUM(SPN2.QuantityMaterial)
			FROM SpecificPurchaseTransaction AS SPN2
			GROUP BY SPN2.PurchaseID
		) AS Total_of_Quantity_Material
	) AS Average_of_Total
WHERE DATENAME(WEEKDAY,PurchaseTransactionDate) IN ('Friday', 'Saturday', 'Sunday')
GROUP BY PTN.PurchaseID, SupplierName, STUFF(SupplierPhone, 1, 1, '+62') , DATENAME(WEEKDAY,PurchaseTransactionDate), QuantityMaterial, Average_of_Total.Average_Qty
HAVING QuantityMaterial > Average_of_Total.Average_Qty
GO

--Answer for case number 8
SELECT	[CustomerName] = CASE 
	WHEN CustomerGender LIKE 'Female' THEN 'Mrs. ' + CustomerName
	ELSE 'Mr. ' + CustomerName
	END,
		CustomerPhone,
		CustomerAddress,
		[CustomerDOB] = CONVERT(VARCHAR, CustomerBirthDate, 103),
		[Cloth Count] 
FROM MsInfoCustomer AS MIC
	JOIN SalesTransaction AS STN
		ON MIC.CustomerID = STN.CustomerID
	JOIN SpecificSalesTransaction AS SSN
		ON SSN.SalesID = STN.SalesID,
	(
		SELECT	STN2.CustomerID,
				[Cloth Count] = COUNT(DISTINCT ClothID)
		FROM SalesTransaction AS STN2
			JOIN SpecificSalesTransaction AS SSN2
				ON STN2.SalesID = SSN2.SalesID
		GROUP BY STN2.CustomerID
	) AS Each_Tr_Cloth_Count,
	(
		SELECT [Highest_Cloth_Count] = MAX(Candidate_Maximum.[Cloth Count])
		FROM 
		(
			SELECT	STN3.CustomerID,
					[Cloth Count] = COUNT(DISTINCT ClothID)
			FROM SalesTransaction AS STN3
				JOIN SpecificSalesTransaction AS SSN3
					ON STN3.SalesID = SSN3.SalesID
			GROUP BY STN3.CustomerID
		) AS Candidate_Maximum
	) AS The_Maximum_Result
WHERE Each_Tr_Cloth_Count.[Cloth Count] =  The_Maximum_Result.Highest_Cloth_Count
	AND Each_Tr_Cloth_Count.CustomerID = STN.CustomerID
	AND CustomerName LIKE '%o%'
GROUP BY CASE 
	WHEN CustomerGender LIKE 'Female' THEN 'Mrs. ' + CustomerName
	ELSE 'Mr. ' + CustomerName
	END, CustomerPhone, CustomerAddress,  CONVERT(VARCHAR, CustomerBirthDate, 103), Each_Tr_Cloth_Count.[Cloth Count]
GO

--Answer for case number 9
CREATE VIEW ViewCustomerTransaction
AS
SELECT	MIC.CustomerID,
		CustomerName,
		CustomerEmail,
		[CustomerDOB] = CustomerBirthDate,
		[Minimum Quantity] = MIN(QuantityCloth),
		[Maximum Quantity] = MAX(QuantityCloth)
FROM MsInfoCustomer AS MIC
	JOIN SalesTransaction AS STN
		ON MIC.CustomerID = STN.CustomerID
	JOIN SpecificSalesTransaction AS SSN
		ON SSN.SalesID = STN.SalesID
WHERE YEAR(CustomerBirthDate) >= 2000
	AND CustomerEmail LIKE '%@yahoo.com'
GROUP BY MIC.CustomerID, CustomerName, CustomerName, CustomerEmail, CustomerBirthDate
GO

--Answer for case number 10
CREATE VIEW ViewFemaleStaffTransaction
AS
SELECT	PTN.StaffID,
		[StaffName] = UPPER(StaffName),
		[StaffSalary] = CONCAT('Rp. ', CAST(StaffSalary AS INT), ',00'),
		[Material Bought Count] = CONCAT(COUNT(DISTINCT MaterialID), ' Pc(s)')
FROM MsInfoStaff AS MIF
	JOIN PurchaseTransaction AS PTN
		ON MIF.StaffID = PTN.StaffID
	JOIN SpecificPurchaseTransaction AS SPN
		ON SPN.PurchaseID = PTN.PurchaseID
WHERE StaffGender LIKE 'Female' 
	AND StaffSalary > (
		SELECT AVG(StaffSalary) 
		FROM MsInfoStaff
)
GROUP BY PTN.StaffID, UPPER(StaffName), CONCAT('Rp. ', CAST(StaffSalary AS INT), ',00')
GO

