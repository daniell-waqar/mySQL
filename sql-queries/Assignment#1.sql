
1:

MariaDB [hr]> select first_name,last_name from employees where salary = (select MAX(salary) from employees);

2:

MariaDB [hr]> SELECT first_name, last_name , MAX(salary)  FROM employees WHERE salary <> (SELECT MAX(salary)  FROM employees);


4:


MariaDB [hr]> select employee_id, first_name,last_name, max(salary), job_id from employees where job_id = 'ST_clerk';


5:


MariaDB [hr]> SELECT first_name, salary FROM employees WHERE job_id='FI_ACCOUNT' AND salary > (SELECT MAX(salary) FROM employees
    -> where job_id = "ST_CLERK");


6:


MariaDB [hr]> SELECT first_name, last_name , salary from employees WHERE job_id='ST_CLERK' and  salary > (SELECT MIN(salary) FROM employees WHERE job_id='IT_PROG');
Empty set (0.001 sec)




7:

MariaDB [hr]>  select first_name,last_name from employees where salary> ALL (select salary from employees where first_name="Peter" or first_name="lisa");

8:

MariaDB [hr]> SELECT first_name,last_name,salary FROM employees   WHERE salary > (SELECT AVG(salary) FROM employees);


9:

MariaDB [hr]> SELECT first_name,last_name, salary,   department_id FROM employees WHERE salary IN   (SELECT MAX(salary) FROM employees GROUP BY department_id);


12:

MariaDB [hr]>  SELECT employee_id, first_name,last_name  from employees where job_id in (SELECT job_id FROM employees WHERE department_id=50) and department_id=20;


13:

MariaDB [hr]>  select first_name,last_name from departments, employees where employees.department_id=departments.department_id and department_name='Finance';




14:

 MariaDB [hr]> select first_name,last_name from employees, departments, locations where departments.location_id=locations.location_id and employees.department_id=departments.department_id and city='Toronto';

15:

MariaDB [hr]>  select first_name, last_name , job_title, department_name from employees, departments, jobs where employees.job_id=jobs.job_id and employees.department_id=departments.department_id;


16:

MariaDB [hr]> SELECT D.department_name , E.first_name
    ->   FROM employees E
    ->      INNER JOIN departments D
    ->        ON E.department_id = D.department_id
    ->         GROUP BY D.department_name
    ->           HAVING COUNT(*) < 2;



17:

MariaDB [hr]> SELECT E.first_name , E.last_name ,  E.department_id , D.department_name FROM employees E JOIN departments D ON E.department_id = D.department_id order by last_name;



19:


MariaDB [hr]> SELECT first_name, last_name, salary , department_id   FROM employees   WHERE salary IN   ( SELECT MIN(salary)   FROM employees   GROUP BY department_id having salary < 5000);



