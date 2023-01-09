

EX : 4.1

MariaDB [Waqar]> SELECT AVG(HOUR_RATE) FROM HOURS;
+----------------+
| AVG(HOUR_RATE) |
+----------------+
|       7.033636 |
+----------------+
1 row in set (0.001 sec)


EX : 4.2

MariaDB [Waqar]> select AVG(ATTRACT_AGE) FROM ATTRACTION WHERE PARK_CODE = 'UK3452';
+------------------+
| AVG(ATTRACT_AGE) |
+------------------+
|           7.2500 |
+------------------+
1 row in set (0.001 sec)


EX : 4.3

MariaDB [Waqar]> select EMP_NUM , SUM(HOURS_PER_ATTRACT) AS TOTAL_HOURS
    -> FROM HOURS GROUP BY EMP_NUM;
+---------+-------------+
| EMP_NUM | TOTAL_HOURS |
+---------+-------------+
|     100 |          12 |
|     101 |           6 |
|     102 |          12 |
|     104 |          12 |
|     105 |          12 |
+---------+-------------+
5 rows in set (0.001 sec)




EX : 4.4


MariaDB [Waqar]> SELECT ATTRACT_NO,MIN(HOUR_RATE),MAX(HOUR_RATE) FROM HOURS GROUP BY ATTRACT_NO;
+------------+----------------+----------------+
| ATTRACT_NO | MIN(HOUR_RATE) | MAX(HOUR_RATE) |
+------------+----------------+----------------+
|      10034 |           6.50 |           6.50 |
|      10078 |           8.50 |           8.50 |
|      10098 |           8.50 |           8.50 |
|      30011 |           7.20 |           7.20 |
|      30012 |           5.99 |           7.20 |
|      30044 |           5.99 |           5.99 |
+------------+----------------+----------------+
6 rows in set (0.001 sec)

EX : 4.5

MariaDB [Waqar]> SELECT EMP_NUM,ATTRACT_NO,AVG(HOURS_PER_ATTRACT) FROM HOURS
    -> WHERE HOURS_PER_ATTRACT >=5 GROUP BY EMP_NUM;
+---------+------------+------------------------+
| EMP_NUM | ATTRACT_NO | AVG(HOURS_PER_ATTRACT) |
+---------+------------+------------------------+
|     100 |      10034 |                 6.0000 |
|     101 |      10034 |                 6.0000 |
|     102 |      30044 |                 6.0000 |
|     104 |      30011 |                 6.0000 |
|     105 |      10098 |                 6.0000 |
+---------+------------+------------------------+
5 rows in set (0.001 sec)

EX : 4.6

MariaDB [Waqar]> SELECT * FROM EMPLOYEE CROSS JOIN HOURS;

77 rows in set (0.001 sec)



EX : 4.7

MariaDB [Waqar]> SELECT EMP_LNAME, EMP_FNAME,ATTRACT_NO,DATE_WORKED
    -> FROM EMPLOYEE E INNER JOIN HOURS H ON E.EMP_NUM = H.EMP_NUM;
+------------+-----------+------------+-------------+
| EMP_LNAME  | EMP_FNAME | ATTRACT_NO | DATE_WORKED |
+------------+-----------+------------+-------------+
| Calderdale | Emma      |      10034 | 2007-05-18  |
| Calderdale | Emma      |      10034 | 2007-05-20  |
| Ricardo    | Marshel   |      10034 | 2007-05-18  |
| Arshad     | Arif      |      30012 | 2007-05-23  |
| Arshad     | Arif      |      30044 | 2007-05-21  |
| Arshad     | Arif      |      30044 | 2007-05-22  |
| Denver     | Enrica    |      30011 | 2007-05-21  |
| Denver     | Enrica    |      30012 | 2007-05-22  |
| Namowa     | Mirrelle  |      10078 | 2007-05-18  |
| Namowa     | Mirrelle  |      10098 | 2007-05-18  |
| Namowa     | Mirrelle  |      10098 | 2007-05-19  |
+------------+-----------+------------+-------------+
11 rows in set (0.001 sec)



EX : 4.8

MariaDB [Waqar]> SELECT EMP_LNAME, EMP_FNAME,A.ATTRACT_NO,ATTRACT_NAME FROM EMPLOYEE E INNER JOIN HOURS H ON E.EMP_NUM = H.EMP_NUM INNER JOIN ATTRACTION A ON H.ATTRACT_NO = A.ATTRACT_NO;
+------------+-----------+------------+----------------+
| EMP_LNAME  | EMP_FNAME | ATTRACT_NO | ATTRACT_NAME   |
+------------+-----------+------------+----------------+
| Calderdale | Emma      |      10034 | ThunderCoaster |
| Calderdale | Emma      |      10034 | ThunderCoaster |
| Ricardo    | Marshel   |      10034 | ThunderCoaster |
| Arshad     | Arif      |      30012 | Pirates        |
| Arshad     | Arif      |      30044 | UnderSeaWord   |
| Arshad     | Arif      |      30044 | UnderSeaWord   |
| Denver     | Enrica    |      30011 | BlackHole2     |
| Denver     | Enrica    |      30012 | Pirates        |
| Namowa     | Mirrelle  |      10078 | Ant-Trap       |
| Namowa     | Mirrelle  |      10098 | Carnival       |
| Namowa     | Mirrelle  |      10098 | Carnival       |
+------------+-----------+------------+----------------+
11 rows in set (0.001 sec)


EX : 4.9


MariaDB [Waqar]> SELECT PARK_NAME ,SUM(LINE_PRICE) FROM THEMEPARK JOIN SALES USING (PARK_CODE) JOIN SALES_LINE USING (TRANSACTION_NO) WHERE PARK_COUNTRY = 'UK' OR PARK_COUNTRY = 'FR' GROUP BY PARK_COUNTRY;
+--------------+-----------------+
| PARK_NAME    | SUM(LINE_PRICE) |
+--------------+-----------------+
| FairyLand    |          401.86 |
| PleasureLand |          851.00 |
+--------------+-----------------+
2 rows in set (0.002 sec)


EX : 4.10


MariaDB [Waqar]> SELECT SALE_DATE , LINE_QTY , LINE_PRICE FROM SALES INNER JOIN SALES_LINE USING (TRANSACTION_NO) WHERE SALE_DATE = '2007-05-18';
+------------+----------+------------+
| SALE_DATE  | LINE_QTY | LINE_PRICE |
+------------+----------+------------+
| 2007-05-18 |        2 |      69.98 |
| 2007-05-18 |        1 |      14.99 |
| 2007-05-18 |        2 |      69.98 |
| 2007-05-18 |        2 |      41.98 |
| 2007-05-18 |        1 |      14.99 |
| 2007-05-18 |        1 |      14.99 |
| 2007-05-18 |        1 |      34.99 |
| 2007-05-18 |        4 |     139.96 |
| 2007-05-18 |        4 |     168.40 |
| 2007-05-18 |        1 |      22.50 |
| 2007-05-18 |        2 |      21.98 |
| 2007-05-18 |        2 |      84.20 |
| 2007-05-18 |        2 |      21.98 |
| 2007-05-18 |        2 |      84.20 |
| 2007-05-18 |        1 |      22.50 |
| 2007-05-18 |        2 |      21.98 |
| 2007-05-18 |        2 |      21.98 |
| 2007-05-18 |        2 |      84.20 |
| 2007-05-18 |        4 |     168.40 |
| 2007-05-18 |        1 |      22.50 |
| 2007-05-18 |        2 |      21.98 |
| 2007-05-18 |        2 |      84.20 |
| 2007-05-18 |        2 |      57.34 |
| 2007-05-18 |        2 |      37.12 |
| 2007-05-18 |        2 |      57.34 |
| 2007-05-18 |        2 |      37.12 |
| 2007-05-18 |        1 |      18.56 |
| 2007-05-18 |        1 |      12.12 |
| 2007-05-18 |        4 |     114.68 |
| 2007-05-18 |        2 |      57.34 |
| 2007-05-18 |        2 |      37.12 |
+------------+----------+------------+
31 rows in set (0.001 sec)








