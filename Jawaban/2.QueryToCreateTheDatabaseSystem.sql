--  b. Create a database system
-- Below query is the answer (2. Query to create the database system):
CREATE DATABASE UniDloX 
GO
USE UniDloX 
GO

CREATE TABLE MsInfoStaff (
	StaffID			CHAR(5) 
		PRIMARY KEY CHECK (StaffID LIKE 'SF[0-9][0-9][0-9]'),
	StaffName		VARCHAR(45) NOT NULL,
	StaffPhone		VARCHAR(15) NOT NULL,
	StaffAddress	VARCHAR(15) NOT NULL
		CHECK (LEN(StaffAddress) BETWEEN 10 AND 15),
	StaffAge		INT NOT NULL,
	StaffGender		VARCHAR(6) NOT NULL
		CHECK(StaffGender LIKE 'Male' OR StaffGender LIKE 'Female'),
	StaffSalary		FLOAT NOT NULL,
	StaffBirthDate DATE NOT NULL
)

CREATE TABLE MsInfoPaymentType (
	PaymentTypeID	CHAR(5) 
		PRIMARY KEY CHECK (PaymentTypeID LIKE 'PA[0-9][0-9][0-9]'),
	PaymentTypeName	VARCHAR(20) NOT NULL
)

CREATE TABLE MsInfoMaterial (
	MaterialID		CHAR(5) 
		PRIMARY KEY CHECK (MaterialID LIKE 'MA[0-9][0-9][0-9]'),
	MaterialName	VARCHAR(45) NOT NULL,
	MaterialPrice	FLOAT NOT NULL
		CHECK(MaterialPrice > 0)
)

CREATE TABLE MsInfoCloth (
	ClothID			CHAR(5) 
		PRIMARY KEY CHECK (ClothID LIKE 'CL[0-9][0-9][0-9]'),
	ClothName		VARCHAR(45) NOT NULL,
	ClothStock		INT NOT NULL
		CHECK(ClothStock BETWEEN 0 AND 250),
	ClothPrice		FLOAT NOT NULL
)

CREATE TABLE MsInfoCustomer (
	CustomerID		CHAR(5) 
		PRIMARY KEY CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName	VARCHAR(45) NOT NULL,
	CustomerPhone	VARCHAR(15) NOT NULL,
	CustomerAddress VARCHAR(45) NOT NULL,
	CustomerGender	VARCHAR(6) NOT NULL
		CHECK(CustomerGender LIKE 'Male' OR CustomerGender LIKE 'Female'),
	CustomerEmail	VARCHAR(45) NOT NULL
		CHECK(CustomerEmail LIKE '%@gmail.com' OR CustomerEmail LIKE '%@yahoo.com'),
	CustomerBirthDate DATE NOT NULL
)

CREATE TABLE MsInfoSupplier (
	SupplierID		CHAR(5) 
		PRIMARY KEY CHECK (SupplierID LIKE 'SU[0-9][0-9][0-9]'),
	SupplierName	VARCHAR(45) NOT NULL
		CHECK (LEN(SupplierName) > 6),
	SupplierPhone	VARCHAR(15) NOT NULL,
	SupplierAddress VARCHAR(45) NOT NULL
)

CREATE TABLE PurchaseTransaction (
	PurchaseID		CHAR(5)
		PRIMARY KEY CHECK (PurchaseID LIKE 'PU[0-9][0-9][0-9]'),
	StaffID			CHAR(5) NOT NULL
		FOREIGN KEY REFERENCES MsInfoStaff(StaffID) 
		ON UPDATE CASCADE 
		ON DELETE CASCADE,
	SupplierID		CHAR(5) NOT NULL
		FOREIGN KEY REFERENCES MsInfoSupplier(SupplierID) 
		ON UPDATE CASCADE 
		ON DELETE CASCADE,
	PaymentTypeID	CHAR(5) NOT NULL
		FOREIGN KEY REFERENCES MsInfoPaymentType(PaymentTypeID) 
		ON UPDATE CASCADE 
		ON DELETE CASCADE,
	PurchaseTransactionDate DATE NOT NULL
)

CREATE TABLE SpecificPurchaseTransaction (
	PurchaseID		CHAR(5)
		FOREIGN KEY REFERENCES PurchaseTransaction(PurchaseID) 
		ON UPDATE CASCADE 
		ON DELETE CASCADE,
	MaterialID		CHAR(5) 
		FOREIGN KEY REFERENCES MsInfoMaterial(MaterialID) 
		ON UPDATE CASCADE 
		ON DELETE CASCADE,
	QuantityMaterial INT NOT NULL,
	PRIMARY KEY (PurchaseID, MaterialID)
)

CREATE TABLE SalesTransaction (
	SalesID			CHAR(5)
		PRIMARY KEY CHECK (SalesID LIKE 'SA[0-9][0-9][0-9]'),
	StaffID			CHAR(5) NOT NULL
		FOREIGN KEY REFERENCES MsInfoStaff(StaffID) 
		ON UPDATE CASCADE 
		ON DELETE CASCADE,
	CustomerID		CHAR(5) NOT NULL
		FOREIGN KEY REFERENCES MsInfoCustomer(CustomerID) 
		ON UPDATE CASCADE 
		ON DELETE CASCADE,
	PaymentTypeID	CHAR(5) NOT NULL
		FOREIGN KEY REFERENCES MsInfoPaymentType(PaymentTypeID) 
		ON UPDATE CASCADE 
		ON DELETE CASCADE,
	SalesTransactionDate DATE NOT NULL
)

CREATE TABLE SpecificSalesTransaction (
	SalesID		CHAR(5)
		FOREIGN KEY REFERENCES SalesTransaction(SalesID) 
		ON UPDATE CASCADE 
		ON DELETE CASCADE,
	ClothID		CHAR(5)
		FOREIGN KEY REFERENCES MsInfoCloth(ClothID) 
		ON UPDATE CASCADE 
		ON DELETE CASCADE,
	QuantityCloth INT NOT NULL,
	PRIMARY KEY (SalesID, ClothID)
)