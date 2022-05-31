-- c. query using DML syntax to fill the tables in database systems with data based on the following conditions
-- Below query is the answer (3. Query to insert data into tables):
USE UniDloX
GO

--Below query is insert into Table Master with minimum 10 data
INSERT INTO MsInfoStaff (StaffID, StaffName, StaffPhone, StaffAddress, StaffAge, StaffGender, StaffSalary, StaffBirthDate) VALUES 
('SF001', 'Asep Johan', '085264537856', 'Utama St. 8E', 29, 'Male', 4600000, '1992-10-25'),
('SF002', 'Sheris Sella', '081265788946', 'Binta St. 1C', 27, 'Female', 3800000, '1994-09-18'),
('SF003', 'Susi Shinta', '085267588743', 'Jambu St. 2A', 22, 'Female', 3800000, '1999-04-15'),
('SF004', 'Sanny Aminda', '081245667843', 'Mangga St. 2E', 26, 'Female', 4000000, '1995-10-11'),
('SF005', 'Johan Amigo', '081256446744', 'Utama St. 9E', 26, 'Male', 3800000, '1995-02-15'),
('SF006', 'Joseph Alexander', '081264738756', 'Bam St. 8B', 21, 'Male', 3800000, '2000-10-14'),
('SF007', 'Angelina Chandra', '081234567890', 'Sari St. 4A', 21, 'Female', 3800000, '2000-07-18'),
('SF008', 'Jocelina', '081250908787', 'Niaga St. 4A', 26, 'Female', 4200000, '1995-12-01'),
('SF009', 'Konwaka Nakata', '081234567654', 'Host St. 2F', 24, 'Female', 3800000, '1997-01-01'),
('SF010', 'Normi Aregata', '081234564321', 'Bgia St. 8C', 28, 'Female', 3800000, '1993-07-17')
GO

--Only has 9 payment type in the rules (which has 2 type same that is cash so it will be one type)
--so, for table payment type it will only has 9 data according to the rules.
INSERT INTO MsInfoPaymentType (PaymentTypeID, PaymentTypeName) VALUES
('PA001', 'DANA'),
('PA002', 'Debit Card'),
('PA003', 'OVO'),
('PA004', 'Cash'),
('PA005', 'Go-Pay'),
('PA006', 'Credit Card'),
('PA007', 'Shopee-Pay'),
('PA008', 'Cryptocurrency'),
('PA009', 'Flazz')
GO

INSERT INTO MsInfoMaterial (MaterialID, MaterialName, MaterialPrice) VALUES
('MA001', 'Wool', 130000),
('MA002', 'Leather', 72000),
('MA003', 'Satin', 175000),
('MA004', 'Cellulosic', 180000),
('MA005', 'Silk', 160000),
('MA006', 'Crepe', 152000),
('MA007', 'Velvet', 152000),
('MA008', 'Linen', 170000),
('MA009', 'Polyester', 162000),
('MA010', 'Viscose', 182000),
('MA011', 'Chiffon', 190000)
GO

INSERT INTO MsInfoCloth (ClothID, ClothName, ClothStock, ClothPrice) VALUES
('CL001','Wool Scarf', 120, 420000),
('CL002','Velvet Jackets', 80, 480000),
('CL003','Leather Jackets', 200, 480000),
('CL004','Silk Sweater', 220, 510000),
('CL005','Linen Shirt', 100, 415000),
('CL006','Cellulosic Shirt', 120, 440000),
('CL007','Cotton T-Shirt', 121, 400000),
('CL008','Cotton Long Pants', 50, 470000),
('CL009','Crepe Shorts', 250, 470000),
('CL010','Chiffon Skirt', 200, 400000),
('CL011','Satin Long-Sleeved Shirt', 150, 530000),
('CL012','Viscose Skirt', 240, 420000),
('CL013','Polyester Long-Sleeved Shirt', 100, 415000),
('CL014','Leather Long Pants', 230, 410000),
('CL015','Crepe Jackets', 130, 380000)
GO

INSERT INTO MsInfoCustomer (CustomerID, CustomerName, CustomerPhone, CustomerAddress, CustomerGender, CustomerEmail, CustomerBirthDate) VALUES
('CU001','Garem Suproso', '081245676545', 'Hola St. 3A', 'Male', 'geregere@gmail.com', '2001-05-12'),
('CU002','Chinda  Angelina', '085234567283', 'Noli St. 2C', 'Female', 'chacha@gmail.com', '1999-03-14'),
('CU003','Moshyos Santoso', '081230908754', 'Jojo St. 2B', 'Male', 'sohoy@yahoo.com', '2002-09-03'),
('CU004','Vivi Varoin', '084235446666', 'Tnto St. 9B', 'Female', 'varvivi@gmail.com', '1996-11-13'),
('CU005','Chandra Bastian', '081231314141', 'Honta St. 2A', 'Male', 'basbassuh@yahoo.com', '1999-10-23'),
('CU006','Antashya Tasyam', '089867688989', 'Kori St. 9A', 'Female', 'tasyaanashya@yahoo.com', '2002-12-12'),
('CU007','Jassim Ardi', '088976433434', 'Kena St. 5A', 'Female', 'jesskencanardi@gmail.com', '2002-08-23'),
('CU008','Venny Susanti', '081221213131', 'Jeru St. 8E', 'Female', 'kedissanny@yahoo.com', '1997-07-13'),
('CU009','Fredilina Mola', '081245456767', 'Pera St. 9C', 'Female', 'fredy009@gmail.com', '2000-11-23'),
('CU010','Alex Valentimo', '081238388989', 'Kiri St. 3A', 'Male', 'chandralexy2@gmail.com', '1997-05-03'),
('CU011','Novicelime Agaga', '0812321456767', 'Kuka St. 7B', 'Female', 'agaga24noice@yahoo.com', '1995-04-12'),
('CU012','Agana Nahaya', '081231678999', 'Lite St. 8A', 'Female', 'nyanana34@gmail.com', '2000-03-23'),
('CU013','Henrim Alvelina', '081234121312', 'Alvi St. 3B', 'Female', 'velinarin23@yahoo.com', '2000-07-18'),
('CU014','Antasya Meista', '081289899898', 'Kuma St. 8B', 'Female', 'neissya98@yahoo.com', '1995-10-02'),
('CU015','Alvindra Remata', '081234344343', 'Lion St. 8A', 'Female', 'lindra2872@gmail.com', '1999-07-22'),
('CU016','Dewi Agustina', '081256566565', 'Anta St. 2A', 'Female', 'gustina2424@yahoo.com', '2003-04-24')
GO

INSERT INTO MsInfoSupplier (SupplierID, SupplierName, SupplierPhone, SupplierAddress) VALUES
('SU001', 'Ratex Jaya', '085876899222', 'Mangga St. 2B'),
('SU002', 'Silkable', '081212903478', 'Munima St. 8A'),
('SU003', 'Textatoe', '085877776549', 'Aqera St. 7C'),
('SU004', 'Ratosilver', '085823234242', 'Anga St. 2C'),
('SU005', 'Greenin', '081224563232', 'Kemang St. 2A'),
('SU006', 'Gorvacrep', '082345671231', 'Sate St. 2B'),
('SU007', 'CelluSilkvan', '081223231999', 'Manta St. 5B'),
('SU008', 'Rotomton', '081245450198', 'Guda St. 2C'),
('SU009', 'RetivLin', '081277889992', 'Gon St. 1B'),
('SU010', 'Goringher', '081209099898', 'Kuri St. 8C')
GO

--Below query is insert into Table Transaction (Transaction Header) with minimum 15 data
INSERT INTO PurchaseTransaction (PurchaseID, StaffID, SupplierID, PaymentTypeID, PurchaseTransactionDate) VALUES
('PU001','SF001','SU002', 'PA003', '2021-03-02'),
('PU002','SF003','SU001', 'PA001', '2021-04-08'),
('PU003','SF004','SU005', 'PA005', '2021-05-10'),
('PU004','SF002','SU009', 'PA007', '2021-05-12'),
('PU005','SF006','SU006', 'PA002', '2021-05-15'),
('PU006','SF008','SU001', 'PA004', '2021-07-20'),
('PU007','SF002','SU010', 'PA005', '2021-11-02'),
('PU008','SF001','SU007', 'PA006', '2021-11-04'),
('PU009','SF007','SU003', 'PA007', '2021-11-09'),
('PU010','SF005','SU004', 'PA002', '2021-11-15'),
('PU011','SF009','SU008', 'PA009', '2021-11-22'),
('PU012','SF010','SU007', 'PA002', '2021-11-27'),
('PU013','SF004','SU006', 'PA001', '2021-11-28'),
('PU014','SF004','SU006', 'PA006', '2021-11-29'),
('PU015','SF001','SU010', 'PA004', '2021-11-30')
GO

INSERT INTO SalesTransaction (SalesID, StaffID, CustomerID, PaymentTypeID, SalesTransactionDate) VALUES
('SA001', 'SF002', 'CU001', 'PA006', '2021-01-12'),
('SA002', 'SF004', 'CU004', 'PA002', '2021-01-15'),
('SA003', 'SF001', 'CU005', 'PA001', '2021-03-24'),
('SA004', 'SF005', 'CU002', 'PA005', '2021-04-24'),
('SA005', 'SF003', 'CU003', 'PA008', '2021-04-25'),
('SA006', 'SF006', 'CU008', 'PA003', '2021-05-02'),
('SA007', 'SF009', 'CU007', 'PA007', '2021-05-12'),
('SA008', 'SF007', 'CU009', 'PA009', '2021-06-15'),
('SA009', 'SF008', 'CU006', 'PA006', '2021-06-18'),
('SA010', 'SF010', 'CU015', 'PA004', '2021-07-02'),
('SA011', 'SF003', 'CU012', 'PA008', '2021-07-06'),
('SA012', 'SF004', 'CU014', 'PA005', '2021-07-12'),
('SA013', 'SF002', 'CU011', 'PA007', '2021-07-14'),
('SA014', 'SF005', 'CU013', 'PA008', '2021-07-15'),
('SA015', 'SF007', 'CU010', 'PA004', '2021-08-18'),
('SA016', 'SF007', 'CU016', 'PA002', '2021-09-20')
GO


--Below query is insert into Table Detail Transaction (Transaction Detail) with minimum 25 data
INSERT INTO SpecificPurchaseTransaction (PurchaseID, MaterialID, QuantityMaterial) VALUES
('PU001', 'MA003', 2),
('PU001', 'MA005', 1),
('PU002', 'MA010', 2),
('PU002', 'MA002', 1),
('PU003', 'MA011', 2),
('PU003', 'MA001', 4),
('PU003', 'MA004', 2),
('PU004', 'MA007', 6),
('PU004', 'MA005', 2),
('PU005', 'MA010', 1),
('PU005', 'MA006', 2),
('PU005', 'MA008', 2),
('PU005', 'MA009', 3),
('PU006', 'MA002', 2),
('PU007', 'MA008', 1),
('PU008', 'MA003', 1),
('PU009', 'MA001', 3),
('PU009', 'MA003', 2),
('PU010', 'MA005', 2),
('PU011', 'MA007', 1),
('PU012', 'MA004', 2),
('PU013', 'MA004', 4),
('PU013', 'MA002', 8),
('PU014', 'MA001', 3),
('PU014', 'MA005', 7),
('PU015', 'MA003', 2)
GO

INSERT INTO SpecificSalesTransaction (SalesID, ClothID, QuantityCloth) VALUES
('SA001', 'CL001', 1),
('SA001', 'CL004', 1),
('SA001', 'CL005', 2),
('SA002', 'CL006', 3),
('SA002', 'CL007', 4),
('SA003', 'CL003', 1),
('SA003', 'CL004', 2),
('SA003', 'CL007', 5),
('SA004', 'CL002', 2),
('SA004', 'CL012', 4),
('SA005', 'CL009', 2),
('SA005', 'CL011', 1),
('SA006', 'CL008', 5),
('SA006', 'CL009', 2),
('SA007', 'CL013', 2),
('SA008', 'CL001', 2),
('SA008', 'CL004', 5),
('SA009', 'CL003', 2),
('SA010', 'CL002', 2),
('SA011', 'CL005', 5),
('SA012', 'CL007', 1),
('SA013', 'CL001', 3),
('SA014', 'CL014', 2),
('SA015', 'CL002', 2),
('SA015', 'CL004', 1),
('SA016', 'CL007', 5)
GO








