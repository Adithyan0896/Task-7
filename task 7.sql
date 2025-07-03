-- Create database
CREATE DATABASE Sales;
USE Sales;

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Country VARCHAR(50)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);

-- Sample data
INSERT INTO Customers (Name, Country) VALUES ('ram', 'chennai'), ('satish', 'ooty');
INSERT INTO Products (ProductName, Category) VALUES ('Laptop', 'Electronics'), ('Chair', 'Furniture');

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES (1, '2025-07-01', 1500.00), (2, '2025-07-02', 300.00);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES (1, 1, 1, 1500.00), (2, 2, 2, 150.00);

-- Create a complex view

CREATE VIEW CustomerOrderSummary AS
SELECT
    c.CustomerID,
    c.Name AS CustomerName,
    c.Country,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    SUM(od.Quantity * od.UnitPrice) AS TotalOrderValue,
    COUNT(od.OrderDetailID) AS NumberOfItems
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, o.OrderID;

-- Use the view for abstraction and security

-- Select from view
SELECT * FROM CustomerOrderSummary;

CREATE VIEW ManagerOrderOverview AS
SELECT
    CustomerName,
    Country,
    OrderID,
    OrderDate,
    TotalOrderValue
FROM CustomerOrderSummary
WHERE TotalOrderValue > 500;  -- Only high-value orders
SELECT * FROM ManagerOrderOverview;
