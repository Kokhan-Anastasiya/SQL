--Вывести имена всех людей, которые есть в базе данных авиакомпаний
  select name
  from Passenger

--Вывести названия всеx авиакомпаний
SELECT name
FROM Company

--Вывести все рейсы, совершенные из Москвы
SELECT *
FROM Trip
WHERE town_from = "Moscow"

--Вывести имена людей, которые заканчиваются на "man"
SELECT name
FROM Passenger
WHERE name LIKE '%man'

--Вывести количество рейсов, совершенных на TU-134
SELECT COUNT(plane) as count
FROM trip
WHERE plane = "TU-134"

--Какие компании совершали перелеты на Boeing
SELECT DISTINCT name
FROM Company
  INNER JOIN Trip ON Company.id = Trip.company
WHERE Trip.plane = "Boeing"

--Вывести все названия самолётов, на которых можно улететь в Москву (Moscow)
SELECT DISTINCT plane
FROM Trip
WHERE town_to = "Moscow"

--В какие города можно улететь из Парижа (Paris) и сколько времени это займёт?
SELECT town_to,
  TIME (time_in - time_out) as flight_time
FROM Trip
WHERE town_from = "Paris"

--Какие компании организуют перелеты с Владивостока (Vladivostok)?
SELECT name
FROM Company
  INNER JOIN Trip ON Company.id = Trip.company
WHERE town_from = "Vladivostok"

--Вывести вылеты, совершенные с 10 ч. по 14 ч. 1 января 1900 г.
SELECT *
FROM Trip
WHERE time_out BETWEEN '1900-01-01T10:00:00' AND '1900-01-01T14:00:00'
