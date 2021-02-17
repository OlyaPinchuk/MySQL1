select * from students join ratings on students.id = ratings.student_id;

select
    students.name,
    ratings.rating
from students join ratings on students.id = ratings.student_id;

select * from ratings join lesson on lesson.id = ratings.lesson_id;

select *
from ratings
    join lesson on lesson.id = ratings.lesson_id
    join students on students.id = ratings.student_id;

select students.name, ratings.rating, lesson.label
from ratings
    join lesson on lesson.id = ratings.lesson_id
    join students on students.id = ratings.student_id;

select s.name, r.rating, l.label
from ratings as r
    join lesson as l on l.id = r.lesson_id
    join students as s on s.id = r.student_id;

select s.name, r.rating, l.label
from ratings r
    join lesson l on l.id = r.lesson_id
    join students s on s.id = r.student_id
where r.rating = 5;

select count(gender) from students group by gender;
select count(gender), gender from students group by gender;
select count(gender), gender, age from students group by gender, age;

select avg(rating), s.name
from ratings
    join students s on s.id = ratings.student_id group by s.id;

select concat(name, '-', gender) from students;

select concat(s.name, '-', l.label)
from students s
    join ratings r on s.id = r.student_id
    join lesson l on l.id = r.lesson_id;

select * from students join ratings r on students.id = r.student_id where r.rating = 5;

select * from students where id in (select student_id from ratings where rating = 5);
select * from students where id in ( 5, 6, 5, 3 );

select distinct(name) from students;
select distinct(name), count(name) from students group by name;

select avg(rating), s.name
from ratings right join students s on s.id = ratings.student_id #right join/left join віддає пріоритет таблиці зліва/справа, right join відобразив і студентів навіть без оцінок
group by s.id;


select * from students where age not in(25, 30, 35);
