--1. Find the model number, speed and hard drive capacity for all the PCs with prices below $500.
Result set: model, speed, hd.
SELECT model, speed, hd FROM PC
WHERE price < 500;

--2. List all printer makers. Result set: maker.
SELECT DISTINCT maker FROM Product
WHERE type = 'printer';

--3. Find the model number, RAM and screen size of the laptops with prices over $1000.
SELECT model, ram, screen FROM Laptop
WHERE price > 1000;

--4. Find all records from the Printer table containing data about color printers.
SELECT DISTINCT * FROM Printer
WHERE color = 'y';

--5. Find the model number, speed and hard drive capacity of PCs cheaper than $600 having a 12x or a 24x CD drive.
SELECT model, speed, hd 
FROM PC 
WHERE (PC.cd = '12x' OR 
 PC.cd = '24x') 
AND price < 600;

--6. For each maker producing laptops with a hard drive capacity of 10 Gb or higher, find the speed of such laptops. Result set: maker, speed.
SELECT DISTINCT Product.maker,Laptop.speed
FROM Product JOIN 
 Laptop ON Product.model = Laptop.model 
WHERE Laptop.hd >= 10;

--7. Get the models and prices for all commercially available products (of any type) produced by maker B.
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

--9. Find the makers of PCs with a processor speed of 450 MHz or more. Result set: maker.
select DISTINCT maker from product
JOIN pc ON product.model = pc.model
where speed >=450

--10. Find the printer models having the highest price. Result set: model, price.
select model, price from printer
where price IN (select MAX(price) from printer)

--11. Find out the average speed of PCs.
select AVG(speed) from pc

--12. Find out the average speed of the laptops priced over $1000.
select AVG(speed) from laptop
where price > 1000

--14. For the ships in the Ships table that have at least 10 guns, get the class, name, and country.
Select Ships.class, Ships.name, Classes.country from Ships
Join Classes on Classes.class = Ships.class
where Classes.numGuns >=10

--17. Get the laptop models that have a speed smaller than the speed of any PC.
SELECT DISTINCT type, Laptop.model, speed
FROM Laptop, Product
WHERE Product.model = Laptop.model AND
      Laptop.speed < (SELECT MIN(speed) FROM PC)
      
--19. For each maker having models in the Laptop table, find out the average screen size of the laptops he produces.
select maker, AVG(screen) as avg_screen 
from Product
Join Laptop ON Product.model = Laptop.model
Group by maker

--21. Find out the maximum PC price for each maker having models in the PC table. Result set: maker, maximum price.
select maker, MAX(price) as max_price from PC
JOIN Product ON Product.model = PC.model
Group by maker

--22. For each value of PC speed that exceeds 600 MHz, find out the average price of PCs with identical speeds.
Select speed, AVG(price) as avg_price from PC
where speed > 600
Group by speed

