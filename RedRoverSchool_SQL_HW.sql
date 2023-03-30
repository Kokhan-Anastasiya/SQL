select * from chinook.artist;
select * from chinook.album;
select * from chinook.invoice;
select * from chinook.invoiceline;
select * from chinook.genre;
select * from chinook.album;
select * from chinook.employee;
select * from chinook.customer;
select * from chinook.playlisttrack;
select * from chinook.track;
select * from chinook.playlist;
select * from chinook.mediatype;


-- HW_1 к лекции 3 Simple queries
-- Покажите содержимое таблицы исполнителей (артистов)
select * from chinook.artist;

-- Покажите фамилии и имена клиентов из города Лондон
select FirstName, LastName from chinook.customer
where City = "London";

-- Покажите продажи за 2012 год, со стоимостью продаж более 4 долларов
select InvoiceDate, Total from chinook.invoice
where InvoiceDate like '%2012%' and Total > 4;

-- Покажите дату продажи, адрес продажи, город в которую совершена продажа и стоимость покупки не равную 17.91.
-- (Присвоить названия столбцам InvoiceDate – ДатаПродажи, BillingAddress – АдресПродажи и BillingCity - ГородПродажи)
select InvoiceDate as ДатаПродажи, BillingAddress as АдресПродажи, BillingCity as ГородПродаж, Total from chinook.invoice
where Total <> 17.91;

-- Покажите фамилии и имена сотрудников компании, нанятых в 2003 году из города Калгари
select LastName, FIrstName from chinook.employee
where HireDate like '%2003%' and City = 'Calgary';

-- Покажите канадские города, в которые были сделаны продажи в августе?
select BillingCity from chinook.invoice
where BillingCountry = 'Canada' and InvoiceDate like '%-08-%';

-- Покажите Фамилии и имена работников, нанятых в октябре?
select FirstName, LastName from chinook.employee
where HireDate like '%-10-%';

-- Покажите фамилии и имена сотрудников, занимающих должность менеджера по продажам и ИТ менеджера. Решите задание двумя способами: 
-- используя оператор IN
-- используя логические операции
-- 1:
select LastName, FirstName, Title from chinook.employee
where Title in ('Sales Manager', 'IT Manager');
-- 2:
select * from chinook.employee
where Title = 'Sales Manager' or Title = 'IT Manager';



-- HW_2
-- Покажите фамилии и имя клиентов, у которых имя Mарк.
select LastName, FirstName from chinook.customer
where FirstName like '%Mar_';

-- !!!!Покажите название и размер треков в Мегабайтах, применив округление до 2 знаков и отсортировав по убыванию. Столбец назовите MB
 select Name, round(Bytes/1024/1024, 2) as MB from chinook.track
 order by MB desc;
 
-- Покажите возраст сотрудников, на момент оформления на работу. Вывести фамилию, имя, возраст. дату оформления и день рождения. Столбец назовите age.
select LastName, FirstName, timestampdiff(Year, BirthDate, HireDate) as age, HireDate, BirthDate from chinook.employee;
select LastName, FirstName, floor(datediff(HireDate, BirthDate)/365) as age, HireDate, BirthDate from chinook.employee;

-- Покажите покупателей-американцев без факса.
select * from chinook.customer
where Country = 'USA' and Fax is null;

-- Покажите почтовые адреса клиентов из домена gmail.com.
select Email from chinook.customer
where Email like '%gmail.com';

-- Покажите в алфавитном порядке все уникальные должности в компании.
select distinct (Title) from chinook.employee
order by Title asc;

-- Покажите самую короткую песню.

select Name, Milliseconds from chinook.track
where Milliseconds = (select min(Milliseconds) from chinook.track); 

select name, Milliseconds from chinook.track order by Milliseconds limit 1;

-- Покажите название и длительность в секундах самой короткой песни. Столбец назвать sec.
select Name, (Milliseconds/1000) as sec from chinook.track
where Milliseconds = (select min(Milliseconds) from chinook.track);

select name, Milliseconds/1000 as sec from chinook.track order by Milliseconds limit 1;

-- Покажите средний возраст сотрудников, работающих в компании.
select * from employee;
select avg((YEAR(CURRENT_DATE)-YEAR(BirthDate))) as age from chinook.employee;

-- Проведите аналитическую работу: узнайте фамилию, имя и компанию покупателя (номер 5). Сколько заказов он сделал и на какую сумму. Покажите 2 запроса Вашей работы.
select LastName, FirstName, Company from chinook.customer
where CustomerID = 5;

select count(*) as NumberOfOrders, sum(Total) as TotalSum from chinook.invoice where CustomerId = 5;

-- Напишите запрос, определяющий количество треков, где ID плейлиста > 15. Назовите столбцы соответственно их расположения. 
select PlaylistId as `CONDITION`, count(TrackId) as RESULT from chinook.playlisttrack
where PlaylistId > 15
group by PlaylistId;

-- Найти все ID счет-фактур, в которых количество треков больше или равно 6 и меньше или равно 9
select * from chinook.invoiceline;
select InvoiceId, sum(quantity) from chinook.invoiceline
group by InvoiceId
having sum(quantity) between 6 and 9;


-- HW_3 Subqueries
-- Покажите длительность самой длинной песни. Столбец назвать sec.
select Name, Milliseconds from chinook.track
where Milliseconds = (select max(Milliseconds) from chinook.track);

-- Покажите название и длительность в секундах самой длинной песни применив округление по правилам математики. Столбец назвать sec.
select Name, round(Milliseconds/1000) as sec from chinook.track
where Milliseconds = (select max(Milliseconds) from chinook.track);

-- Покажите все счёт-фактуры, стоимость которых ниже средней
select * from chinook.invoice
where Total < (select avg(Total) from chinook.invoice);

-- Покажите счёт-фактуру с высокой стоимостью
select * from chinook.invoice
where Total = (select max(Total) from chinook.invoice);

-- Покажите города, в которых живут и сотрудники, и клиенты
select City from chinook.employee where (City) in (select City from chinook.customer);

-- Покажите имя, фамилию покупателя (номер 16), компанию и общую сумму его заказов. Столбец назовите sum.
select LastName, FirstName, Company, (select sum(Total) from chinook.invoice where customerId = chinook.customer.CustomerId) as sum from chinook.customer
where CustomerID = 16;


-- HW_4 Joins
-- Покажите все данные заказов покупателя (номер 13) и отсортируйте стоимость по возрастанию.
select * from chinook.invoice
join chinook.customer
on chinook.invoice.CustomerId = chinook.customer.CustomerId
where chinook.customer.CustomerId = 13
order by Total;

-- Посчитайте количество треков в каждом альбоме. В результате вывести ID альбома, имя альбома и кол-во треков. 
select chinook.album.AlbumId, chinook.album.Title, count(chinook.track.TrackId) as 'Number of tracks'
from chinook.album
join chinook.track
on chinook.album.AlbumId = chinook.track.AlbumId
group by chinook.album.AlbumId, chinook.album.Title;

-- Покажите имя, фамилию, кол-во и стоимость покупок по каждому клиенту. Столбцы кол-во назвать quantity, стоимость - sum.
select chinook.customer.FirstName, chinook.customer.LastName, count(chinook.invoice.InvoiceId) as quantity, sum(chinook.invoice.Total) as sum
from chinook.customer 
join chinook.invoice
on chinook.customer.CustomerId = chinook.invoice.CustomerId
group by chinook.customer.FirstName, chinook.customer.LastName;

-- Покажите количество и среднюю стоимость треков в каждом жанре. Вывести ID жанра, название жанра, количество и среднюю стоимость.
select chinook.genre.GenreId, chinook.genre.Name, count(chinook.track.UnitPrice) as quantity, round(avg(chinook.track.UnitPrice)) as 'average price'
from chinook.genre
join chinook.track
on chinook.genre.GenreId = chinook.track.GenreId
group by chinook.genre.GenreId, chinook.genre.Name;

-- Покажите клиента, который потратил больше всего денег. Для сокращения количества символов в запросе, используйте псевдонимы. Для ограничения количества записей используйте оператор "limit".
select c.LastName, c.FirstName, sum(i.Total) as Total
from chinook.customer as c
join chinook.invoice as i
on c.CustomerId = i.CustomerId
group by c.LastName, c.FirstName
order by Total desc
limit 1;



-- Extra (используется соединение 3х таблиц)
-- Покажите список названий альбомов, ID альбомов, количество треков и общую цену альбомов для исполнителя Audioslave.
select chinook.artist.Name, chinook.album.Title, count(chinook.track.albumId) as 'Number of tracks', sum(chinook.track.UnitPrice) as 'Total price of albums'
from chinook.artist
join chinook.album 
on chinook.artist.ArtistId = chinook.album.ArtistId
join chinook.track
on chinook.album.AlbumId = chinook.track.AlbumId
where chinook.artist.Name = 'Audioslave'
group by chinook.artist.Name, chinook.album.Title, chinook.album.AlbumId;
