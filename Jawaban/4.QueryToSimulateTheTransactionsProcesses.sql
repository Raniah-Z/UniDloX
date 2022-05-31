-- d. query using DML syntax to simulate the transactions process for sales and purchase transactions. 
-- Below query is the answer (4. Query to simulate the transactions processes):
USE UniDloX
GO

-- PURCHASE TRANSACTION SIMULATION

-- Purcahse Transaction 1:
-- On 02 December 2021, a staff, name Susi Shinta (SF003) 
-- do a purchase with ID PU016 from a supplier RetivLIN (SU009) which buy 2 Satin (MA003) 
-- and 1 Silk (MA005) materials and using Credit Card (PA006) payment type to pay those materials.

-- For Purchase Transaction 1:
INSERT INTO PurchaseTransaction VALUES
('PU016','SF003','SU009', 'PA006', '2021-12-02')
GO

INSERT INTO SpecificPurchaseTransaction VALUES
('PU016', 'MA003', 2),
('PU016', 'MA005', 1)
GO


-- Purchase Transaction 2:
-- On 06 December  2021, a staff, name Sheris Sella (SF002) 
-- do a purchase with ID PU017 from a supplier CelluSilkvan (SU007) which  
-- buy 3 Wool (MA001) materials and using Go-Pay (PA005) payment type to pay those materials.

-- For Purchase Transaction 2:
INSERT INTO PurchaseTransaction VALUES
('PU017', 'SF002', 'SU007', 'PA005', '2021-12-06')
GO

INSERT INTO SpecificPurchaseTransaction VALUES
('PU017', 'MA001', 3)
GO


-- Purchase Transaction 3:
-- On 10 December 2021, a new staff, name "Budy Budiman" who just hired  by company UniDIox (we will 
-- give the next ID from the last ID that containts in the MsInfoStaff so, Budy Budiman will have an ID SF011) 
-- do purchase with ID PU018 from a supplier Textatoe (SU003) which buy 2 Satin (MA003) and 1 Cellulosic (MA004)
-- materials and using DANA (PA001) payment type to pay those materials.

--For Purchase Transaction 3:
INSERT INTO MsInfoStaff VALUES
('SF011', 'Budy Budiman', '085888886599', 'Uju St. 8A', 21, 'Male', 3800000, '2000-06-19')
GO

INSERT INTO PurchaseTransaction VALUES
('PU018', 'SF011', 'SU003', 'PA001', '2021-12-10')
GO

INSERT INTO SpecificPurchaseTransaction VALUES
('PU018', 'MA003', 2),
('PU018', 'MA004', 1)
GO


-- Purchase Transaction 4:
-- On 15 December 2021, company UniDIox have got a new supplier, name TacWool (we will give the next ID from the last ID 
-- that containts in the MsInfoSupplier so it will be SU011) and our staff, name Sanny Aminda (SF004)
-- do a purchase with purchase ID PU019 to the TacWool (SU011) supplier which buy 5 Silk (MA005) materials 
-- and use OVO (PA003) payment type to pay those materials.

-- For Purchase Transaction 4:
INSERT INTO MsInfoSupplier VALUES
('SU011', 'TacWool', '081200770088', 'Nadi St. 1C')
GO

INSERT INTO PurchaseTransaction VALUES
('PU019', 'SF004', 'SU011', 'PA003', '2021-12-15')
GO

INSERT INTO SpecificPurchaseTransaction VALUES
('PU019', 'MA005', 5)
GO

-- (Continue Sales Transaction 4), our supplier TacWool come and tell to us 
-- if they had typo when they were writing  address. So, They want to update
-- the correct one which is Nayi St. 2C
UPDATE MsInfoSupplier
SET SupplierAddress = 'Nayi St. 2c'
WHERE SupplierID LIKE 'SU011'
GO


-- Purchase Transaction 5:
-- On 20 December 2021, a staff, name Budy Budiman (SF011) 
-- do a purchase with ID PU020 from a supplier TacWool (SU011) which buy 2 Leather (MA002) 
-- and 3 Silk (MA005) materials and using OVO (PA003) payment type to pay those materials.

-- For Purchase Transaction 5:
INSERT INTO PurchaseTransaction VALUES
('PU020', 'SF011', 'SU011', 'PA003', '2021-12-20')
GO

INSERT INTO SpecificPurchaseTransaction VALUES
('PU020', 'MA002', 2),
('PU020', 'MA005', 3)
GO

-- Purchase Transaction 6:
-- On 22 December 2021, a staff, name Budy Budiman (SF011) 
-- do a purchase with ID PU021 from a supplier TacWool (SU011) which buy 2 Leather (MA002) 
-- materials and using OVO (PA003) payment type to pay those materials.

-- For Purchase Transaction 6:
INSERT INTO PurchaseTransaction VALUES
('PU021', 'SF011', 'SU011', 'PA003', '2021-12-22')
GO

INSERT INTO SpecificPurchaseTransaction VALUES
('PU021', 'MA002', 2)
GO

-- (Continue from the case Purchase Transaction 6) Company UniDIox want to delete the
-- purchase with ID PU021, because the purchase  has failed (not success) to do transaction
DELETE FROM PurchaseTransaction
WHERE PurchaseID LIKE 'PU021'
GO



-- SALES TRANSACTION SIMULATION

-- Sales Transaction 1:
-- On 12 October 2021, a customer, name Chandra Bastian (CU005) come to the UniDIox 
-- buy 1 Leather Jackets (CL003), 2 Chiffon Skirt (CL010), and 1 Satin Long-Sleeved Shirt (CL011)
-- which using DANA (PA001) payment type to pay those clothes and served by a staff, name Sherlis Sella (SF002)
-- with sales ID SA017.

-- For Sales Transaction 1:
INSERT INTO SalesTransaction VALUES
('SA017', 'SF002', 'CU005', 'PA001', '2021-10-12')
GO

INSERT INTO SpecificSalesTransaction VALUES
('SA017', 'CL003', 1),
('SA017', 'CL010', 2),
('SA017', 'CL011', 1)
GO


-- Sales Transaction 2:
-- On 22 October 2021, a customer, name Chinda Angelina (CU002) come to the UniDIox 
-- buy 2 Velvet Jackets (CL002), 1 Leather Jackets (CL003), 1 Linen Shirt (CL005),and 1 Chiffon Skirt (CL010)
-- which using Go-Pay (PA005) payment type to pay those clothes and served by a staff, name Johan Amigo (SF005)
-- with sales ID SA018.

-- For Sales Transaction 2:
INSERT INTO SalesTransaction VALUES
('SA018', 'SF005', 'CU002', 'PA005', '2021-10-22')
GO

INSERT INTO SpecificSalesTransaction VALUES
('SA018', 'CL002', 2),
('SA018', 'CL003', 1),
('SA018', 'CL005', 1),
('SA018', 'CL010', 1)
GO


-- Sales Transaction 3:
-- On 24 October 2021, a new customer, name Meinda Andani (we will give the next ID from the last ID 
-- that containts in the MsInfoCustomer so it will be CU017) come to the UniDIox
-- buy 1 Cotton Long Pants (CL008) and 2 Chiffon Skirt (CL010) which using Credit Card (PA006) payment type
-- to pay those clothes and served by a staff, name Konwaka Nakata (SF009)
-- with sales ID SA019.

-- For Sales Transaction 3:
INSERT INTO MsInfoCustomer VALUES
('CU017', 'Meinda Andani', '081221213131', 'Nini St. 2B', 'Female', 'Nini22@gmail.com', '2000-02-19')
GO

INSERT INTO SalesTransaction VALUES
('SA019', 'SF009', 'CU017', 'PA006', '2021-10-24')
GO

INSERT INTO SpecificSalesTransaction VALUES
('SA019', 'CL008', 1),
('SA019', 'CL010', 2)
GO

-- (Continue Sales Transaction 3), our customer Meinda Andani come and tell to us 
-- if she had typo when she was writing her address. So, she wants to update
-- the correct of her address which is Nina St. 2C
UPDATE MsInfoCustomer
SET CustomerAddress = 'Nina St. 2c'
WHERE CustomerID LIKE 'CU017'
GO


-- Sales Transaction 4:
-- On 25 October 2021, a customer, name Agana Nahaya (CU012) come to the UniDIox 
-- buy 2 Cotton T-Shirt (CL007) and 1 Crepe Shorts (CL009)
-- which using Debit Card (PA002) payment type to pay those clothes and served by a staff, name Budy Budiman (SF011)
-- with sales ID SA020.

-- For Sales Transaction 4:
INSERT INTO SalesTransaction VALUES
('SA020', 'SF011', 'CU012', 'PA002', '2021-10-25')
GO

INSERT INTO SpecificSalesTransaction VALUES
('SA020', 'CL007', 2),
('SA020', 'CL009', 1)
GO

-- Sales Transaction 5:
-- On  15 November 2021, a customer, name Vivi Varoin (CU004) come to the UniDIox 
-- buy 4 Velvet Jackets (CL002), 5 Silk Sweater (CL004), 2 Linen Shirt (CL005)
-- 3 Cellulosic Shirt (CL006) and 5 Cotton Long Pants (CL008)
-- which using OVO (PA003) payment type to pay those clothes and served by a staff, name Sheris Sella (SF002)
-- with sales ID SA021.
INSERT INTO SalesTransaction VALUES
('SA021', 'SF002', 'CU004', 'PA003', '2021-11-15')
GO

INSERT INTO SpecificSalesTransaction VALUES
('SA021', 'CL002', 4),
('SA021', 'CL004', 5),
('SA021', 'CL005', 2),
('SA021', 'CL006', 3),
('SA021', 'CL008', 5)
GO


