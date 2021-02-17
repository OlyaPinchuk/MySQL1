-- # 1. +Вибрати усіх клієнтів, чиє ім'я має менше ніж 6 символів.
select * from client  where length(FirstName) < 6;

-- # 2. +Вибрати львівські відділення банку.+
select * from department where DepartmentCity = 'Lviv';

-- # 3. +Вибрати клієнтів з вищою освітою та посортувати по прізвищу.
select * from client where Education = 'high' order by LastName;

#TODO
-- # 4. +Виконати сортування у зворотньому порядку над таблицею Заявка і вивести 5 останніх елементів.??
select * from application order by idApplication desc;

-- # 5. +Вивести усіх клієнтів, чиє прізвище закінчується на OV чи OVA.
select * from client where LastName like '%iva' or LastName like '%iv';

-- # 6. +Вивести клієнтів банку, які обслуговуються київськими відділеннями.
select client.idClient, client.LastName, department.DepartmentCity
from client
    join department on client.Department_idDepartment = department.idDepartment where department.DepartmentCity = 'Kyiv' ;

-- # 7. +Вивести імена клієнтів та їхні номера телефону, погрупувавши їх за іменами.
select FirstName, Passport from client group by FirstName;

-- # 8. +Вивести дані про клієнтів, які мають кредит більше ніж на 5000 тисяч гривень.
select *
from client
    join application on client.idClient = application.Client_idClient
    where Sum > 5000 and Currency = 'Gryvnia' and CreditState = 'Not returned';

-- # 9. +Порахувати кількість клієнтів усіх відділень та лише львівських відділень.
select Department_idDepartment, count(idClient) from client group by Department_idDepartment;
select Department_idDepartment, count(idClient)
from client
    join department on client.Department_idDepartment = department.idDepartment where department.DepartmentCity = 'Lviv' group by Department_idDepartment;

-- # 10. Знайти кредити, які мають найбільшу суму для кожного клієнта окремо.
select Client_idClient, max(Sum) from application group by Client_idClient;

-- # 11. Визначити кількість заявок на крдеит для кожного клієнта.
select Client_idClient, count(idApplication) from application group by Client_idClient;

-- # 12. Визначити найбільший та найменший кредити.
select max(sum) from application;
select min(sum) from application;

-- # 13. Порахувати кількість кредитів для клієнтів,які мають вищу освіту.
select c.idClient, count(idApplication) from application a
    join client c on a.Client_idClient = c.idClient where c.Education = 'high' group by c.idClient;

#TODO
-- # 14. Вивести дані про клієнта, в якого середня сума кредитів найвища.
select Client_idClient, avg(sum) from application group by Client_idClient order by avg(sum) desc;

select max(avg_sum)
from (select avg(sum) as avg_sum from application group by Client_idClient) as max_sum;

#TODO
-- # 15. Вивести відділення, яке видало в кредити найбільше грошей
select application.Client_idClient, sum(sum), client.Department_idDepartment
from application
    join client on application.Client_idClient = client.idClient group by Client_idClient;

-- # 16. Вивести відділення, яке видало найбільший кредит.
select application.Client_idClient, max(Sum), client.idClient, client.Department_idDepartment
from application
    join client on application.Client_idClient = client.idClient where Currency = 'Euro';

#TODO
-- # 17. Усім клієнтам, які мають вищу освіту, встановити усі їхні кредити у розмірі 6000 грн
select client.idClient, application.Sum
from client
    join application on client.idClient = application.Client_idClient where Education = 'high';

#ToDO
-- # 18. Усіх клієнтів київських відділень пересилити до Києва
select client.idClient, client.LastName, client.City, client.Department_idDepartment, department.DepartmentCity
from client
    join department on client.Department_idDepartment = department.idDepartment
    where department.DepartmentCity = 'Kyiv' and client.City not like 'Kyiv';

-- # 19. Видалити усі кредити, які є повернені.
delete from application where CreditState = 'Returned';

#TODO
-- # 20. Видалити кредити клієнтів, в яких друга літера прізвища є голосною.
select client.idClient, client.Lastname
from client where LastName like '_[aeiou]%';

-- # Знайти львівські відділення, які видали кредитів на загальну суму більше ніж 5000
-- # Знайти клієнтів, які повністю погасили кредити на суму більше ніж 5000
/* Знайти максимальний неповернений кредит.*/
/*Знайти клієнта, сума кредиту якого найменша*/
/*Знайти кредити, сума яких більша за середнє значення усіх кредитів*/
/*Знайти клієнтів, які є з того самого міста, що і клієнт, який взяв найбільшу кількість кредитів*/
-- #місто чувака який набрав найбільше кредитів
