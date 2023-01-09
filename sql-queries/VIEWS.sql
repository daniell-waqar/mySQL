
EX ; 6.1

MariaDB [Waqar]> SELECT * FROM EMPFR;
+---------+-----------+-----------+-----------+------------+---------------+---------------+-----------+-----------+
| EMP_NUM | EMP_TITLE | EMP_LNAME | EMP_FNAME | EMP_DOB    | EMP_HIRE_DATE | EMP_AREA_CODE | EMP_PHONE | PARK_CODE |
+---------+-----------+-----------+-----------+------------+---------------+---------------+-----------+-----------+
|     102 | Mr        | Arshad    | Arif      | 1969-11-14 | 1990-12-20    | 7253          | 675-8993  | FR1001    |
|     105 | Ms        | Namowa    | Mirrelle  | 1990-03-14 | 2006-11-08    | 0181          | 890-3243  | FR1001    |
+---------+-----------+-----------+-----------+------------+---------------+---------------+-----------+-----------+

AFTER CHANGE----------------------------


MariaDB [Waqar]>  UPDATE EMPFR SET EMP_PHONE='324-9652' WHERE EMP_NUM=102;
Query OK, 1 row affected (0.003 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [Waqar]> SELECT * FROM EMPFR;
+---------+-----------+-----------+-----------+------------+---------------+---------------+-----------+-----------+
| EMP_NUM | EMP_TITLE | EMP_LNAME | EMP_FNAME | EMP_DOB    | EMP_HIRE_DATE | EMP_AREA_CODE | EMP_PHONE | PARK_CODE |
+---------+-----------+-----------+-----------+------------+---------------+---------------+-----------+-----------+
|     102 | Mr        | Arshad    | Arif      | 1969-11-14 | 1990-12-20    | 7253          | 324-9652  | FR1001    |
|     105 | Ms        | Namowa    | Mirrelle  | 1990-03-14 | 2006-11-08    | 0181          | 890-3243  | FR1001    |
+---------+-----------+-----------+-----------+------------+---------------+---------------+-----------+-----------+
2 rows in set (0.001 sec)



EX: 6.2

 CREATE VIEW EMP_DETAILS AS SELECT EMP_NUM,t.PARK_CODE,PARK_NAME,EMP_LNAME,EMP_FNAME,EMP_HIRE_DATE,EMP_DOB FROM EMPLOYEE E INNER JOIN THEMEPARK t ON E.PARK_CODE=t.PARK_CODE;
Query OK, 0 rows affected (0.002 sec)

MariaDB [Waqar]> select * from EMP_DETAILS;
+---------+-----------+--------------+------------+-----------+---------------+------------+
| EMP_NUM | PARK_CODE | PARK_NAME    | EMP_LNAME  | EMP_FNAME | EMP_HIRE_DATE | EMP_DOB    |
+---------+-----------+--------------+------------+-----------+---------------+------------+
|     100 | UK3452    | PleasureLand | Calderdale | Emma      | 1992-03-15    | 1972-06-15 |
|     101 | UK3452    | PleasureLand | Ricardo    | Marshel   | 1996-04-25    | 1978-03-19 |
|     102 | FR1001    | FairyLand    | Arshad     | Arif      | 1990-12-20    | 1969-11-14 |
|     103 | UK3452    | PleasureLand | Roberts    | Anne      | 1994-08-16    | 1974-10-16 |
|     104 | ZA1342    | GoldTown     | Denver     | Enrica    | 2001-10-20    | 1980-11-08 |
|     105 | FR1001    | FairyLand    | Namowa     | Mirrelle  | 2006-11-08    | 1990-03-14 |
|     106 | ZA1342    | GoldTown     | Smith      | Gemma     | 1989-01-05    | 1968-02-12 |
+---------+-----------+--------------+------------+-----------+---------------+------------+
7 rows in set (0.001 sec)



EX: 6.3

MariaDB [Waqar]> SELECT EMP_FNAME,EMP_LNAME,PARK_NAME FROM EMP_DETAILS;
+-----------+------------+--------------+
| EMP_FNAME | EMP_LNAME  | PARK_NAME    |
+-----------+------------+--------------+
| Emma      | Calderdale | PleasureLand |
| Marshel   | Ricardo    | PleasureLand |
| Arif      | Arshad     | FairyLand    |
| Anne      | Roberts    | PleasureLand |
| Enrica    | Denver     | GoldTown     |
| Mirrelle  | Namowa     | FairyLand    |
| Gemma     | Smith      | GoldTown     |
+-----------+------------+--------------+
7 rows in set (0.001 sec)


EX:  6.4

MariaDB [Waqar]> CREATE VIEW TICKET_SALES AS SELECT PARK_NAME,MAX(LINE_PRICE),MIN(LINE_PRICE),AVG(LINE_PRICE) FROM THEMEPARK JOIN SALES USING (PARK_CODE) JOIN SALES_LINE USING (TRANSACTION_NO) GROUP BY PARK_NAME;
Query OK, 0 rows affected (0.002 sec)

MariaDB [Waqar]> SELECT * FROM TICKET_SALES;
+--------------+-----------------+-----------------+-----------------+
| PARK_NAME    | MAX(LINE_PRICE) | MIN(LINE_PRICE) | AVG(LINE_PRICE) |
+--------------+-----------------+-----------------+-----------------+
| FairyLand    |          139.96 |           14.99 |       50.232500 |
| GoldTown     |          114.68 |           12.12 |       47.637778 |
| PleasureLand |          168.40 |           21.98 |       60.785714 |
+--------------+-----------------+-----------------+-----------------+
3 rows in set (0.001 sec)


EX : 6.5

MariaDB [Waqar]> SELECT DISTINCT(DATE_FORMAT(SALE_DATE, '%a-%e-%m-%y')) from SALES;
+------------------------------------------+
| (DATE_FORMAT(SALE_DATE, '%a-%e-%m-%y')) |
+------------------------------------------+
| Fri-18-05-07                          |
+------------------------------------------+
1 row in set (0.000 sec)


EX : 6.6


MariaDB [Waqar]> SELECT EMP_FNAME , EMP_LNAME,CONCAT((DATE_FORMAT(EMP_DOB,'%m')),UPPER(SUBSTR(EMP_LNAME,1,6))) AS user_id from EMPLOYEE;
+-----------+------------+----------+
| EMP_FNAME | EMP_LNAME  | user_id  |
+-----------+------------+----------+
| Emma      | Calderdale | 06CALDER |
| Marshel   | Ricardo    | 03RICARD |
| Arif      | Arshad     | 11ARSHAD |
| Anne      | Roberts    | 10ROBERT |
| Enrica    | Denver     | 11DENVER |
| Mirrelle  | Namowa     | 03NAMOWA |
| Gemma     | Smith      | 02SMITH  |
+-----------+------------+----------+
7 rows in set (0.001 sec)


EX : 6.7

MariaDB [Waqar]> SELECT EMP_FNAME,EMP_LNAME,EMP_DOB FROM EMPLOYEE WHERE DAY(EMP_DOB)='14';
+-----------+-----------+------------+
| EMP_FNAME | EMP_LNAME | EMP_DOB    |
+-----------+-----------+------------+
| Arif      | Arshad    | 1969-11-14 |
| Mirrelle  | Namowa    | 1990-03-14 |
+-----------+-----------+------------+
2 rows in set (0.000 sec)


EX:  6.8

MariaDB [Waqar]> SELECT EMP_FNAME , EMP_LNAME , CONCAT(SUBSTR(EMP_PHONE ,1,3) , LOWER(SUBSTR(EMP_FNAME ,1, 2))) AS USER_PASSWORD from EMPLOYEE;
+-----------+------------+---------------+
| EMP_FNAME | EMP_LNAME  | USER_PASSWORD |
+-----------+------------+---------------+
| Emma      | Calderdale | 324em         |
| Marshel   | Ricardo    | 324ma         |
| Arif      | Arshad     | 324ar         |
| Anne      | Roberts    | 898an         |
| Enrica    | Denver     | 504en         |
| Mirrelle  | Namowa     | 890mi         |
| Gemma     | Smith      | 324ge         |
+-----------+------------+---------------+
7 rows in set (0.001 sec)




