--Создать таблицу employees:
--- id. serial,  primary key,
--- employee_name. Varchar(50), not null
--Наполнить таблицу employee 70 строками.

create table employees (
id serial primary key,
employee_name varchar(50) not null
);

insert into employees (employee_name)
values ('Kirill'),
		('Anton'),
		('Kir'),
		('Gleb'),
		('Kate'),
		('Ann'),
		('Olga'),
		('Afanasij'),
		('Nastya'),
		('Pasha'),
		('Alina'),
		('Arina'),
		('Polina'),
		('Igor'),
		('Sveta'),
		('Maksim'),
		('Tanya'),
		('Eva'),
		('Gena'),
		('Ira'),
		('Tolya'),
		('Vlad'),
		('Kseniya'),
		('Lena'),
		('Oksana'),
		('Kirill1'),
		('Anton1'),
		('Kir1'),
		('Gleb1'),
		('Kate1'),
		('Ann1'),
		('Olga1'),
		('Afanasij1'),
		('Nastya1'),
		('Pasha1'),
		('Alina1'),
		('Arina1'),
		('Polina1'),
		('Igor1'),
		('Sveta1'),
		('Maksim1'),
		('Tanya1'),
		('Eva1'),
		('Gena1'),
		('Ira1'),
		('Tolya1'),
		('Vlad1'),
		('Kseniya1'),
		('Lena1'),
		('Oksana1'),
		('Anton2'),
		('Kir2'),
		('Gleb2'),
		('Kate2'),
		('Ann2'),
		('Olga2'),
		('Afanasij2'),
		('Nastya2'),
		('Pasha2'),
		('Alina2'),
		('Arina2'),
		('Polina2'),
		('Igor2'),
		('Sveta2'),
		('Maksim2'),
		('Tanya2'),
		('Eva2'),
		('Gena2'),
		('Ira2'),
		('Tolya2');
		
	--Создать таблицу salary
--- id. Serial  primary key,
--- monthly_salary. Int, not null
--Наполнить таблицу salary 15 строками:
--- от 1000 до 2500

	create table salary (
	id serial primary key,
	monthly_salary int not null)
	
	insert into salary (monthly_salary)
	values (1000),
			(1100),
			(1200),
			(1300),
			(1400),
			(1500),
			(1600),
			(1700),
			(1800),
			(1900),
			(2000),
			(2100),
			(2200),
			(2300),
			(2400),
			(2500);
	
	select * from employees;
	select * from salary;


--Создать таблицу employee_salary
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique
-- - salary_id. Int, not null
--Наполнить таблицу employee_salary 40 строками:
-- - в 10 строк из 40 вставить несуществующие employee_id

create table employee_salary (
id serial primary key,
employee_id int not null unique,
salary_id int not null
);

insert into employee_salary (employee_id, salary_id)
values (11, 8),
		(12, 4),
		(13, 10),
		(18, 13),
		(23, 6),
		(17, 5),
		(78, 14),
		(4, 2),
		(21, 7),
		(22, 12),
		(32, 3),
		(89, 1),
		(88, 11),
		(72, 9),
		(90, 15),		
		(19, 14),
		(15, 15),
		(24, 12),
		(20, 13),
		(16, 8),
		(25, 10),
		(27, 11),
		(14, 9),
		(10, 6),
		(3, 7),
		(2, 2),
		(77, 3),
		(26, 4),
		(76, 5),
		(5, 2),
		(83, 15),
		(7, 14),
		(91, 1),
		(6, 12),
		(28, 3),
		(79, 11),
		(9, 1),
		(96, 8),
		(8, 5),
		(1, 4);



--Создать таблицу roles
--- id. Serial  primary key,
--- role_name. int, not null, unique
--Поменять тип столба role_name с int на varchar(30)
--Наполнить таблицу roles 20 строками

	select * from employee_salary;

create table roles (
id serial primary key,
role_name int not null unique
);

alter table roles
alter column role_name type varchar(30);

insert into roles (role_name)
values ('Junior_Python_Developer'),
		('Middle_Python_Developer'),
		('Senior_Python_Developer'),
		('Junior_Java_Developer'),
		('Middle_Java_Developer'),
		('Senior_Java_Developer'),
		('Junior_JavaScript_Developer'),
		('Middle_JavaScript_Developer'),
		('Senior_JavaScript_Developer'),
		('Junior_Manual_QA_Engineer'),
		('Middle_MAnual_QA_Engineer'),
		('Senior_Manual_QA_Engineer'),
		('Project_Manager'),
		('Designer'),
		('HR'),
		('SEO'),
		('Sales_Manager'),
		('Junior_Automation_QA_Engineer'),
		('Middle_Automation_QA_Engineer'),
		('Senior_Automation_QA_Engineer');
	
	
	select * from roles;

-- Создать таблицу roles_employee
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- - role_id. Int, not null (внешний ключ для таблицы roles, поле id)
-- Наполнить таблицу roles_employee 40 строками

create table roles_employee(
id serial primary key,
employee_id int not null unique,
role_id int not null, 
foreign key (employee_id)
	references employees (id),
foreign key (role_id)
	references roles (id)
);


insert into roles_employee (employee_id, role_id)
values (1, 2), (2, 1), (7, 20), (4, 19), (3, 15), (8, 10), (5, 12), (9, 12), (6, 3), (12, 7), (13, 8), (10, 9), (11,11), (20, 10), (19, 9), (17, 12), 
		(18, 16), (16, 13), (14, 2), (15, 1), (21, 14), (22, 19), (23, 15), (25, 10), (26, 2), (24, 1), (27, 3), (28, 4), (29, 5), (30, 10),
		(31, 6), (40, 7), (32, 20), (34, 8), (33, 15), (35, 10), (36, 9), (37, 19), (38, 10), (39, 10);
	
select * from roles_employee;
