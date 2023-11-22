
use online_shopping

CREATE TABLE Users (
ID INT IDENTITY(1,1) PRIMARY KEY,
FirstName VARCHAR(100), 
LastName VARCHAR(100), 
Password VARCHAR(100), 
Email VARCHAR(100),
Type VARCHAR(100), 
Status INT,
CreatedOn Datetime);

CREATE TABLE clothes (
clothesid INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(100),
UnitPrice DECIMAL(18, 2),
Discount DECIMAL(18, 2),
Quantity INT, 
ImageUrl VARCHAR(300),
Status INT
)

CREATE TABLE Carts 
(ID INT IDENTITY(1,1) PRIMARY KEY, 
UserId INT,
garment_price INT, 
UnitPrice DECIMAL(18, 2), 
Discount DECIMAL(18, 2),
Quantity INT, 
TotalPrice DECIMAL(18, 2))



CREATE TABLE Orders (
OrderID INT IDENTITY(1,1) PRIMARY KEY, 
ID INT,FOREIGN KEY (ID) REFERENCES Users(ID),
CartID int,FOREIGN KEY (CartID) REFERENCES Cart(ID),
clothesid INT,FOREIGN KEY (clothesid) REFERENCES clothes(clothesid),
OrderNo VARCHAR(100),
OrderTotal DECIMAL(18, 2),
OrderStatus VARCHAR(100))


CREATE TABLE OrderedItems (
ID INT IDENTITY(1,1) PRIMARY KEY,
OrderID INT,FOREIGN KEY (OrderID) REFERENCES Orders(OrderId),
clothesid INT,FOREIGN KEY (clothesid) REFERENCES clothes(clothesid), 
UnitPrice DECIMAL(18, 2),
Discount DECIMAL(18, 2), 
Quantity INT,
TotalPrice DECIMAL(18, 2)
)

select *from Users
select *from clothes
select *from Cart
select *from Orders
select *from OrderedItems

Drop table Users
Drop table clothes
Drop table Cart
Drop table Orders
Drop table OrderedItems


INSERT INTO Users (FirstName, LastName, Password, Email, Type, Status, CreatedOn) 
VALUES 
('John', 'Doe', 'password123', 'johndoe@example.com', 'user', 1, '2022-01-01 10:00:00'),
('Jane', 'Smith', 'letmein', 'janesmith@example.com', 'admin', 1, '2022-01-02 12:00:00'),
('Bob', 'Johnson', 'password456', 'bobjohnson@example.com', 'user', 0, '2022-01-03 14:00:00'),
('Alice', 'Lee', '123456', 'alicelee@example.com', 'admin', 1, '2022-01-04 16:00:00');


INSERT INTO clothes (Name, UnitPrice, Discount, Quantity, ImageUrl, Status)
VALUES 
('Blue T-shirt', 19.99, 0.00, 50, 'https://example.com/blue-tshirt.jpg', 1),
('Black Hoodie', 39.99, 5.00, 25, 'https://example.com/black-hoodie.jpg', 1),
('Red Dress', 59.99, 10.00, 10, 'https://example.com/red-dress.jpg', 0),
('Green Jacket', 79.99, 0.00, 20, 'https://example.com/green-jacket.jpg', 1);

INSERT INTO Cart (UserId, garment_price, UnitPrice, Discount, Quantity, TotalPrice)
VALUES 
(1, 1, 19.99, 0.00, 1, 19.99),
(1, 2, 39.99, 5.00, 2, 74.98),
(2, 1, 59.99, 10.00, 1, 53.99),
(3, 3, 79.99, 0.00, 3, 239.97);

INSERT INTO Orders (ID,CartID,clothesid,OrderNo,OrderTotal,OrderStatus)
VALUES 
( 1,1,1,'ORD001', 94.97, 'Pending'),
( 2,2,2,'ORD002', 53.99, 'Shipped'),
( 2,2,3,'ORD003', 119.97, 'Pending'),
( 2,2,4,'ORD004', 239.97, 'Delivered');

INSERT INTO OrderedItems (OrderID,clothesid,UnitPrice,Discount,Quantity,TotalPrice)
VALUES
(1,1,19.99,0.00,1,19.99)