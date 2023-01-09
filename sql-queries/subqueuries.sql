1 

select ename from emp where salary = (select MAX(salary) from emp);
+-------+
| ename |
+-------+
| King  |
+-------+
1 row in set (0.001 sec)


2

select ename from emp where deptno = (select deptno from dept where deptno = '30');
+--------+
| ename  |
+--------+
| Allen  |
| Ward   |
| Martin |
| Blake  |
| Turner |
| James  |
+--------+
6 rows in set (0.000 sec)



3


select ename from emp where deptno = (select deptno from dept where location = 'New York');
+--------+
| ename  |
+--------+
| Clark  |
| King   |
| Miller |
+--------+
3 rows in set (0.000 sec)




4

select count(*) as total from emp natural join dept where dname=(select dname from dept where dname='sales');
+----------+
| count(*) |
+----------+
|        6 |
+----------+
1 row in set (0.000 sec)


5

select ename from emp where salary > (select MAX(salary)from emp where deptno = '30');
+-------+
| ename |
+-------+
| Jones |
| Scott |
| King  |
| Ford  |
+-------+
4 rows in set (0.001 sec)


6

select ename from emp where salary > (select MIN(salary) from emp where deptno = '30');
+--------+
| ename  |
+--------+
| Allen  |
| Ward   |
| Jones  |
| Martin |
| Blake  |
| Clark  |
| Scott  |
| David  |
| King   |
| Turner |
| Adams  |
| Ford   |
| Miller |
+--------+
13 rows in set (0.000 sec)


7

select * from dept where deptno NOT in  (select deptno from emp);
+--------+------------+----------+
| deptno | dname      | location |
+--------+------------+----------+
|     40 | Operations | Boston   |
+--------+------------+----------+
1 row in set (0.000 sec)

8


select ename , deptno from emp E where E.salary > (select AVG(salary) from emp A where A.deptno = E.deptno);
+-------+--------+
| ename | deptno |
+-------+--------+
| Allen |     30 |
| Jones |     20 |
| Blake |     30 |
| Scott |     20 |
| King  |     10 |
| Ford  |     20 |
+-------+--------+
6 rows in set (0.001 sec)


