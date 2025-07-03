 README: Sales Database SQL Program
 Overview
This SQL script defines a Sales database system to manage customers, orders, order details, and products.
It demonstrates:

 Creating tables and inserting sample data
 Using CREATE VIEW with a complex SELECT statement
 Applying views for abstraction and security

 Database Schema
 
Tables
1️ Customers

CustomerID: Primary key, auto-increment

Name: Customer name

Country: Customer location

2️ Orders

OrderID: Primary key, auto-increment

CustomerID: Foreign key referencing Customers

OrderDate: Date of order

TotalAmount: Total order amount

3️ OrderDetails

OrderDetailID: Primary key, auto-increment

OrderID: Foreign key referencing Orders

ProductID: Foreign key referencing Products

Quantity: Quantity ordered

UnitPrice: Price per unit

4️ Products

ProductID: Primary key, auto-increment

ProductName: Name of the product

Category: Product category

 Sample Data Inserted
Customers: ram (Chennai), satish (Ooty)

Products: Laptop (Electronics), Chair (Furniture)

Orders for these customers

Order details with quantities and unit prices

 Views
1️ CustomerOrderSummary
A complex view joining multiple tables to show summarized order information:

Customer ID & Name

Country

Order ID

Order date

Total amount

Calculated total order value (sum of quantities × unit prices)

Number of items (count of order details)

Purpose:
Provides a summarized, combined view for easier reporting, abstracting underlying table structure.

2️ ManagerOrderOverview
A security-focused view derived from CustomerOrderSummary:

Includes only orders with TotalOrderValue > 500

Shows selected columns only: Customer name, country, order ID, order date, total value

Purpose:
Gives managers access to high-value orders only, preventing them from seeing less relevant or sensitive data.



