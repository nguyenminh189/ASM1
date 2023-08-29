	use practice;

CREATE TABLE Customer(
	CustomerName nvarchar(60),
	CustomerID int PRIMARY KEY,
	CustomerLocation nvarchar(150),
	PhoneNumber int
);
GO

INSERT INTO	Customer(CustomerName, CustomerID, CustomerLocation, PhoneNumber) VALUES ('Nguyen Van An', 111, '111 Nguyen Trai, Thanh Xuan', 0987654321);
GO

CREATE TABLE Items(
	ItemID int PRIMARY KEY,
	ItemName nvarchar(100),
	ItemDescription nvarchar(200),
	Units nvarchar(30),
	Price int,
	Quantity int,
	TotalAmount int
);
GO

INSERT INTO Items(ItemID, ItemName, ItemDescription, Units, Price, Quantity, TotalAmount) VALUES (666, 'May tinh T450', 'New', 'Chiec', 1000, 1, 1000);
INSERT INTO Items(ItemID, ItemName, ItemDescription, Units, Price, Quantity, TotalAmount) VALUES (667, 'Dien thoai Nokia 5670', 'Hot', 'Chiec', 200, 2, 400);
INSERT INTO Items(ItemID, ItemName, ItemDescription, Units, Price, Quantity, TotalAmount) VALUES (668, 'May in Samsung 450', 'FA', 'Chiec', 100, 1, 100);
GO

CREATE TABLE Orders (
	OrderID int PRIMARY KEY,
	OrderDate DATE,
	CustomerID int,
	CONSTRAINT id FOREIGN KEY (CustomerID)	REFERENCES Customer(CustomerID)
);
GO

INSERT INTO Orders (OrderID, OrderDate, CustomerID) VALUES (9000, '2009-11-18', 111);
GO 

CREATE TABLE OrdersItems (
	OrderID int,
	ItemID int,
	ItemQty int,
	Price int,
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY (ItemID) REFERENCES Items(ItemID),
);
GO
	
INSERT INTO OrdersItems(OrderID, ItemID, ItemQty, Price) VALUES (9000, 666, 1, 1000);
INSERT INTO OrdersItems(OrderID, ItemID, ItemQty, Price) VALUES (9000, 667, 2, 200);
INSERT INTO OrdersItems(OrderID, ItemID, ItemQty, Price) VALUES (9000, 668, 1, 100);
GO

SELECT * FROM Customer
SELECT * FROM Orders
SELECT * FROM Items
SELECT * FROM OrdersItems
GO


--4
SELECT CustomerName FROM Customer
SELECT ItemName FROM Items
SELECT OrderID FROM Orders

--5
SELECT CustomerName FROM Customer
ORDER BY CustomerName ASC;

SELECT ItemName FROM Items
ORDER BY Price DESC;

SELECT DISTINCT ItemName
FROM Items
JOIN OrdersItems ON Items.ItemID = OrdersItems.ItemID
JOIN Orders ON OrdersItems.OrderID = Orders.OrderID
WHERE Orders.CustomerID = 111;


--6
SELECT COUNT(DISTINCT CustomerID) AS Sokhachhang
FROM Orders;

SELECT COUNT(*) AS NumberItem
FROM Items;

--7
UPDATE Items
SET Price = ABS(Price)
WHERE Price <= 0;

UPDATE Orders
SET OrderDate = GETDATE()
WHERE OrderDate > GETDATE();