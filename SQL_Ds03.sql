DROP DATABASE IF EXISTS sql_ds03;
CREATE DATABASE IF NOT EXISTS sql_ds03;
use sql_ds03;

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff`
(
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(45),
    `last_name` VARCHAR(45),
    `post` VARCHAR(30),
    `seniority` INT,
    `salary` DECIMAL (8, 2), 
    `age` INT
);

INSERT staff (first_name, last_name, post, seniority, salary, age)
VALUES
	('Вася', 'Петров', 'Начальник', 40, 100000, 60),
	('Петр', 'Власов', 'Начальник', 8, 70000, 30),
	('Катя', 'Катина', 'Инженер', 2, 70000, 25),
	('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
	('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
	('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
	('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
	('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
	('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
	('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
	('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
	('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
 
# 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания для каждой группы

SELECT *
FROM staff
ORDER BY post, salary DESC;

SELECT *
FROM staff
ORDER BY post, salary;

# 2. Выведите 5 максимальных заработных плат (saraly)

SELECT *
FROM staff
ORDER BY salary DESC
LIMIT 5;

# 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)

SELECT post AS "Специальность", SUM(salary) AS "Суммарная зарплата по специальности"
FROM staff
GROUP BY post;

# 4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.

SELECT post AS "Специальность", COUNT(salary) AS "Кол-во сотрудников"
FROM staff
WHERE post = 'Рабочий' AND age >= 24 AND age <= 49
ORDER BY post;

# 5. Найдите количество специальностей

SELECT COUNT(DISTINCT post) AS "Кол-во специальностей"
FROM staff;

# 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет

SELECT post AS "Специальность", AVG(age) AS "Средний возраст"
FROM staff
GROUP BY post
HAVING AVG(age) < 30;

#---------------------------------------------------------------------------------------------------------------

SELECT post AS "Специальность", AVG(age) AS "Средний возраст"
FROM staff
GROUP BY post
HAVING AVG(age) < 36;