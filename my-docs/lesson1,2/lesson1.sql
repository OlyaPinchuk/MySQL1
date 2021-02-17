# insert into table1 value (default, 'product1')

select * from students;

select name from students;

select * from students where age = 15;

select * from students where name = 'roman';

select * from students where name like '%n'; #WILDCUT

select * from students where name like 'o%';

select * from students where name like '%e%';

select * from students where name like '___a%';

select * from students where length(name) = 4;

select * from students order by age desc;

select * from students order by age;

select * from students where name like 'o%' order by age;

select * from students where age != 18;
select * from students where age <> 18;

select * from students where age <= 18;

select * from students where age between 20 and 30;
select * from students where age >= 20 and age <= 30;

select * from students where age >= 18 and name like 'o%';

select * from students where age = 18 or (gender = 'female' and name like 'o%');

select * from students where age = 25 or age = 30 or age = 35;
select * from students where age in(25, 30, 35);

#Aggregate functions

select max(age) from students;

select min(age) from students;

select avg(age) from students;

select count(id) from students; #quantity

select count(id) from students where age < 30;

select sum(age) from students;

select
       avg(rating) as avgRating,
       count(rating) as count
from ratings where student_id = 5; #rename

select name as studName from students;

select * from students limit 3;
select * from students limit 3 offset 3;
select * from students limit 3 offset 6;
select * from students limit 3 offset 9;

# limit = 5 & page = 2 (по 5 айтемів на сторінку, сторінка друга) =>
# => select * from students limit ${limit} offset ${limit * page -1}

UPDATE students SET name = 'Updated', gender = 'chubaka' WHERE age = 20;

UPDATE students SET name = 'Moroz' WHERE age = 25;

UPDATE students SET age = 20 WHERE age > 40;

DELETE FROM students WHERE gender = 'chubaka'; # не видалиться, якщо є десь інформація про нього
