--#1. Вывести имена всех людей, которые есть в базе данных авиакомпаний
  select name
  from Passenger

--#2. Вывести названия всеx авиакомпаний
SELECT name
FROM Company

--#3. Вывести все рейсы, совершенные из Москвы
SELECT *
FROM Trip
WHERE town_from = "Moscow"

--#4. Вывести имена людей, которые заканчиваются на "man"
SELECT name
FROM Passenger
WHERE name LIKE '%man'

--#5. Вывести количество рейсов, совершенных на TU-134
SELECT COUNT(plane) as count
FROM trip
WHERE plane = "TU-134"

--#6. Какие компании совершали перелеты на Boeing
SELECT DISTINCT name
FROM Company
  INNER JOIN Trip ON Company.id = Trip.company
WHERE Trip.plane = "Boeing"

--#7. Вывести все названия самолётов, на которых можно улететь в Москву (Moscow)
SELECT DISTINCT plane
FROM Trip
WHERE town_to = "Moscow"

--#8. В какие города можно улететь из Парижа (Paris) и сколько времени это займёт?
SELECT town_to,
  TIME (time_in - time_out) as flight_time
FROM Trip
WHERE town_from = "Paris"

--#9. Какие компании организуют перелеты с Владивостока (Vladivostok)?
SELECT name
FROM Company
  INNER JOIN Trip ON Company.id = Trip.company
WHERE town_from = "Vladivostok"

--#10. Вывести вылеты, совершенные с 10 ч. по 14 ч. 1 января 1900 г.
SELECT *
FROM Trip
WHERE time_out BETWEEN '1900-01-01T10:00:00' AND '1900-01-01T14:00:00'

--#14. В какие города летал Bruce Willis
select town_to
from Trip
  JOIN Pass_in_trip ON Trip.id = Pass_in_trip.trip
  JOIN Passenger ON Pass_in_trip.passenger = Passenger.id
Where Passenger.name = "Bruce Willis"

--#19. Определить, кто из членов семьи покупал картошку (potato)
SELECT DISTINCT status
FROM FamilyMembers
  JOIN Payments ON FamilyMembers.member_id = Payments.family_member
WHERE Payments.good = (
    SELECT good_id
    FROM Goods
    WHERE good_name = "potato"
  )
  
 --#22. Найти имена всех матерей (mother)
 SELECT member_name
FROM FamilyMembers
WHERE status = "mother"

--#28. Сколько рейсов совершили авиакомпании с Ростова (Rostov) в Москву (Moscow) ?
select COUNT(plane) as count
from Trip
Where town_from = "Rostov"
  and town_to = "Moscow"
  
--#31. Вывести всех членов семьи с фамилией Quincey.
select *
from FamilyMembers
where member_name LIKE '%Quincey%'

--#34. Сколько всего 10-ых классов
select COUNT(name) as count
from Class
where name LIKE "10%"

--#36. Выведите информацию об обучающихся живущих на улице Пушкина (ul. Pushkina)?
SELECT *
FROM Student
WHERE address LIKE "ul. Pushkina%"

--#38. Сколько Анн (Anna) учится в школе ?
select COUNT(first_name) as count
from student
Where first_name = "Anna"

--#39. Сколько обучающихся в 10 B классе ?
Select COUNT(class) as count
from Student_in_class
  JOIN Class ON Student_in_class.class = Class.id
Where Class.name = "10 B"

--#41. Во сколько начинается 4-ый учебный предмет по расписанию ?
SELECT start_pair
FROM Timepair
where id = 4

--53. #Измените имя "Andie Quincey" на новое "Andie Anthony".
UPDATE FamilyMembers
SET member_name = "Andie Anthony"
where status = "son"

--#56. Удалить все перелеты, совершенные из Москвы (Moscow).
delete from Trip
where town_from = "Moscow"

--#Вывести пользователей,указавших Белорусский номер телефона ? Телефонный код Белоруссии +375.
select *
from Users
where phone_number LIKE "%+375%"
