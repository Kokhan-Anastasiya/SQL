--Find the model number, speed and hard drive capacity for all the PCs with prices below $500.
Result set: model, speed, hd.
SELECT model, speed, hd FROM PC
WHERE price < 500;

--List all printer makers. Result set: maker.
SELECT DISTINCT maker FROM Product
WHERE type = 'printer';

--Find the model number, RAM and screen size of the laptops with prices over $1000.
SELECT model, ram, screen FROM Laptop
WHERE price > 1000;

--Find all records from the Printer table containing data about color printers.
SELECT DISTINCT * FROM Printer
WHERE color = 'y';

--Find the model number, speed and hard drive capacity of PCs cheaper than $600 having a 12x or a 24x CD drive.
SELECT model, speed, hd 
FROM PC 
WHERE (PC.cd = '12x' OR 
 PC.cd = '24x') 
AND price < 600;

--For each maker producing laptops with a hard drive capacity of 10 Gb or higher, find the speed of such laptops. Result set: maker, speed.
SELECT DISTINCT Product.maker,Laptop.speed
FROM Product JOIN 
 Laptop ON Product.model = Laptop.model 
WHERE Laptop.hd >= 10;

--Get the models and prices for all commercially available products (of any type) produced by maker B.
SELECT PC.model, price FROM PC
JOIN Product ON Product.model = PC.model
WHERE Product.maker = 'B'
UNION
SELECT Laptop.model, price FROM Laptop
JOIN Product ON Product.model = Laptop.model
WHERE Product.maker = 'B'
UNION
SELECT Printer.model, price FROM Printer
JOIN Product ON Product.model = Printer .model
WHERE Product.maker = 'B';



