-- Question 1 Achieving 1NF (First Normal Form) 🛠️
-- Task:

-- You are given the following table ProductDetail:
-- OrderID	CustomerName	Products
-- 101	John Doe	Laptop, Mouse
-- 102	Jane Smith	Tablet, Keyboard, Mouse
-- 103	Emily Clark	Phone
-- In the table above, the Products column contains multiple values, which violates 1NF.
-- Write an SQL query to transform this table into 1NF, ensuring that each row represents a single product for an order
-- Question 2 Achieving 2NF (Second Normal Form) 🧩
-- You are given the following table OrderDetails, which is already in 1NF but still contains partial dependencies:
-- OrderID	CustomerName	Product	Quantity
-- 101	John Doe	Laptop	2
-- 101	John Doe	Mouse	1
-- 102	Jane Smith	Tablet	3
-- 102	Jane Smith	Keyboard	1
-- 102	Jane Smith	Mouse	2
-- 103	Emily Clark	Phone	1
-- In the table above, the CustomerName column depends on OrderID (a partial dependency), which violates 2NF.

-- Write an SQL query to transform this table into 2NF by removing partial dependencies. Ensure that each non-key column fully depends on the entire primary key.

SCENARIO 1


Products violates the First NF because mouse is redundant.

  SOLUTION
  1.We are creating a table with no redundant features in the products section
  
CREATE TABLE ProductDetail_1NF(
  Order_ID  INT PRIMARY KEY,
  customerName VARCHAR(255),
  Products VARCHAR(255)
  );

INSERT INTO ProductDetail_1NF (ORDER_ID,CustomerName,Products) VALUES(
  (101,	'John Doe',	'Laptop')
  (101,	'John Doe'	, 'Mouse')
  (102,	'Jane Smith',	'Tablet')
  (102,	'Jane Smith', 'Keyboard')
  (102,	'Jane Smith',	'Mouse')
  (103,	'Emily Clark',	'Phone')

SCENARIO 2
  The problem is partial dependacies where customers's name depends in order Id which is directly related to products.

  SOLUTION
  We have to remove the partial dependancy
  A separate table for customer and another one which has directly linked orderId AND Products.

  TABLE 1

  CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

TABLE 2
  
  CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

