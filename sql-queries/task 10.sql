1:

 CREATE USER 'waqar'@'localhost' IDENTIFIED BY 'viki123';
Query OK, 0 rows affected (0.002 sec)

MariaDB [(none)]> Select host,user,password from mysql.user;
+-----------+-------------+-------------------------------------------+
| Host      | User        | Password                                  |
+-----------+-------------+-------------------------------------------+
| localhost | root        |                                           |
| 127.0.0.1 | root        |                                           |
| ::1       | root        |                                           |
| localhost |             |                                           |
| localhost | pma         |                                           |
| localhost | mariadb.sys |                                           |
| localhost | waqar       | *CF4880B63FDC21AFF96CEF0DFD0BFCD377160F07 |
+-----------+-------------+-------------------------------------------+
7 rows in set (0.004 sec)

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| test               |
+--------------------+
2 rows in set (0.003 sec)

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| Waqar              |
| information_schema |
| test               |
+--------------------+
3 rows in set (0.002 sec)



2:

* grant select,update on Waqar.EMPLOYEE to 'waqar'@'localhost';
Query OK, 0 rows affected (0.002 sec)


MariaDB [Waqar]> show tables;
+-----------------+
| Tables_in_Waqar |
+-----------------+
| EMPLOYEE        |
+-----------------+
1 row in set (0.000 sec)




* MariaDB [(none)]> grant select on Waqar.EMPFR to 'waqar'@'localhost';
Query OK, 0 rows affected (0.002 sec)

MariaDB [Waqar]> SELECT * FROM EMPFR;
ERROR 1142 (42000): SELECT command denied to user 'waqar'@'localhost' for table 'EMPFR'
MariaDB [Waqar]> SELECT * FROM EMPFR;
+---------+-----------+-----------+-----------+------------+---------------+---------------+-----------+-----------+
| EMP_NUM | EMP_TITLE | EMP_LNAME | EMP_FNAME | EMP_DOB    | EMP_HIRE_DATE | EMP_AREA_CODE | EMP_PHONE | PARK_CODE |
+---------+-----------+-----------+-----------+------------+---------------+---------------+-----------+-----------+
|     102 | Mr        | Arshad    | Arif      | 1969-11-14 | 1990-12-20    | 7253          | 324-9652  | FR1001    |
|     105 | Ms        | Namowa    | Mirrelle  | 1990-03-14 | 2006-11-08    | 0181          | 890-3243  | FR1001    |
+---------+-----------+-----------+-----------+------------+---------------+---------------+-----------+-----------+
2 rows in set (0.000 sec)


* MariaDB [(none)]> GRANT ALL ON company.* TO 'waqar'@'localhost';
Query OK, 0 rows affected (0.001 sec)

MariaDB [Waqar]> show databases;
+--------------------+
| Database           |
+--------------------+
| Waqar              |
| company            |
| information_schema |
| test               |
+--------------------+
4 rows in set (0.001 sec)

* MariaDB [(none)]> grant create on *.* to 'waqar'@'localhost';
Query OK, 0 rows affected (0.002 sec)

MariaDB [(none)]> create database abc ;
Query OK, 1 row affected (0.000 sec)

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| Ahmed              |
| Waqar              |
| abc                |
| company            |
| hr                 |
| information_schema |
| mysql              |
| p200750            |
| p20075_waqar       |
| performance_schema |
| person             |
| phpmyadmin         |
| sain               |
| sales_co           |
| test               |
+--------------------+
15 rows in set (0.001 sec)


3:

MariaDB [(none)]> revoke select,update on Waqar.EMPFR from 'waqar'@'localhost';
Query OK, 0 rows affected (0.002 sec)

MariaDB [(none)]> SELECT * FROM EMPFR;
ERROR 1046 (3D000): No database selected


4:

MariaDB [Waqar]> SET AUTOCOMMIT = 0;
Query OK, 0 rows affected (0.000 sec)


MariaDB [Waqar]> SELECT * FROM THEMEPARK;
+-----------+---------------+--------------+--------------+
| PARK_CODE | PARK_NAME     | PARK_CITY    | PARK_COUNTRY |
+-----------+---------------+--------------+--------------+
| FR1001    | FairyLand     | PARIS        | FR           |
| NL1202    | Efling        | NOORD        | NL           |
| SP4533    | AdventurePort | BARCELONA    | SP           |
| SW2323    | Labyrinthe    | LAUSANNE     | SW           |
| UK2622    | MiniLand      | WINDSOR      | UK           |
| UK3452    | PleasureLand  | STOKE        | UK           |
| ZA1342    | GoldTown      | JOHANNESBURG | ZA           |
+-----------+---------------+--------------+--------------+
7 rows in set (0.000 sec)

MariaDB [Waqar]> INSERT INTO THEMEPARK VALUES ('JK431','JINNAH','KHI','PK');
Query OK, 1 row affected (0.001 sec)

MariaDB [Waqar]> INSERT INTO THEMEPARK VALUES ('LIM42','JINNAHPARK','KHI','PK');
Query OK, 1 row affected (0.000 sec)

MariaDB [Waqar]> UPDATE THEMEPARK SET PARK_NAME='SINDHPARK' WHERE PARK_CODE='UK2622';
Query OK, 1 row affected (0.001 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [Waqar]> SELECT * FROM THEMEPARK;
+-----------+---------------+--------------+--------------+
| PARK_CODE | PARK_NAME     | PARK_CITY    | PARK_COUNTRY |
+-----------+---------------+--------------+--------------+
| FR1001    | FairyLand     | PARIS        | FR           |
| JK431     | JINNAH        | KHI          | PK           |
| LIM42     | JINNAHPARK    | KHI          | PK           |
| NL1202    | Efling        | NOORD        | NL           |
| SP4533    | AdventurePort | BARCELONA    | SP           |
| SW2323    | Labyrinthe    | LAUSANNE     | SW           |
| UK2622    | SINDHPARK     | WINDSOR      | UK           |
| UK3452    | PleasureLand  | STOKE        | UK           |
| ZA1342    | GoldTown      | JOHANNESBURG | ZA           |
+-----------+---------------+--------------+--------------+
9 rows in set (0.001 sec)

MariaDB [Waqar]> ROLLBACK;
Query OK, 0 rows affected (0.002 sec)

MariaDB [Waqar]> SELECT * FROM THEMEPARK;
+-----------+---------------+--------------+--------------+
| PARK_CODE | PARK_NAME     | PARK_CITY    | PARK_COUNTRY |
+-----------+---------------+--------------+--------------+
| FR1001    | FairyLand     | PARIS        | FR           |
| NL1202    | Efling        | NOORD        | NL           |
| SP4533    | AdventurePort | BARCELONA    | SP           |
| SW2323    | Labyrinthe    | LAUSANNE     | SW           |
| UK2622    | MiniLand      | WINDSOR      | UK           |
| UK3452    | PleasureLand  | STOKE        | UK           |
| ZA1342    | GoldTown      | JOHANNESBURG | ZA           |
+-----------+---------------+--------------+--------------+
7 rows in set (0.001 sec)


MariaDB [Waqar]> INSERT INTO THEMEPARK VALUES ('DK6121','TATARA','PWR','PK');
Query OK, 1 row affected (0.000 sec)

MariaDB [Waqar]> INSERT INTO THEMEPARK VALUES ('LIKE9021','TAJPARK','ISB','PK');
Query OK, 1 row affected (0.001 sec)

MariaDB [Waqar]> SELECT * FROM THEMEPARK;
+-----------+---------------+--------------+--------------+
| PARK_CODE | PARK_NAME     | PARK_CITY    | PARK_COUNTRY |
+-----------+---------------+--------------+--------------+
| DK6121    | TATARA        | PWR          | PK           |
| FR1001    | FairyLand     | PARIS        | FR           |
| LIKE9021  | TAJPARK       | ISB          | PK           |
| NL1202    | Efling        | NOORD        | NL           |
| SP4533    | AdventurePort | BARCELONA    | SP           |
| SW2323    | Labyrinthe    | LAUSANNE     | SW           |
| UK2622    | MiniLand      | WINDSOR      | UK           |
| UK3452    | PleasureLand  | STOKE        | UK           |
| ZA1342    | GoldTown      | JOHANNESBURG | ZA           |
+-----------+---------------+--------------+--------------+
9 rows in set (0.001 sec)

MariaDB [Waqar]> UPDATE THEMEPARK SET PARK_CITY='MULTAN' WHERE PARK_CODE='DK6121'
    -> ;
Query OK, 1 row affected (0.000 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [Waqar]> SELECT * FROM THEMEPARK;
+-----------+---------------+--------------+--------------+
| PARK_CODE | PARK_NAME     | PARK_CITY    | PARK_COUNTRY |
+-----------+---------------+--------------+--------------+
| DK6121    | TATARA        | MULTAN       | PK           |
| FR1001    | FairyLand     | PARIS        | FR           |
| LIKE9021  | TAJPARK       | ISB          | PK           |
| NL1202    | Efling        | NOORD        | NL           |
| SP4533    | AdventurePort | BARCELONA    | SP           |
| SW2323    | Labyrinthe    | LAUSANNE     | SW           |
| UK2622    | MiniLand      | WINDSOR      | UK           |
| UK3452    | PleasureLand  | STOKE        | UK           |
| ZA1342    | GoldTown      | JOHANNESBURG | ZA           |
+-----------+---------------+--------------+--------------+
9 rows in set (0.001 sec)

MariaDB [Waqar]> DELETE FROM THEMEPARK WHERE PARK_CODE='DK6121';
Query OK, 1 row affected (0.000 sec)

MariaDB [Waqar]> SELECT * FROM THEMEPARK;
+-----------+---------------+--------------+--------------+
| PARK_CODE | PARK_NAME     | PARK_CITY    | PARK_COUNTRY |
+-----------+---------------+--------------+--------------+
| FR1001    | FairyLand     | PARIS        | FR           |
| LIKE9021  | TAJPARK       | ISB          | PK           |
| NL1202    | Efling        | NOORD        | NL           |
| SP4533    | AdventurePort | BARCELONA    | SP           |
| SW2323    | Labyrinthe    | LAUSANNE     | SW           |
| UK2622    | MiniLand      | WINDSOR      | UK           |
| UK3452    | PleasureLand  | STOKE        | UK           |
| ZA1342    | GoldTown      | JOHANNESBURG | ZA           |
+-----------+---------------+--------------+--------------+
8 rows in set (0.000 sec)

MariaDB [Waqar]> SAVEPOINT P1;
Query OK, 0 rows affected (0.000 sec)

MariaDB [Waqar]> INSERT INTO THEMEPARK VALUES ('HTR211','QUAID','KHI','PK');
Query OK, 1 row affected (0.000 sec)

MariaDB [Waqar]> INSERT INTO THEMEPARK VALUES ('HM6541','MEHRAN','HYDERABAD','PK');
Query OK, 1 row affected (0.000 sec)

MariaDB [Waqar]> SELECT * FROM THEMEPARK;
+-----------+---------------+--------------+--------------+
| PARK_CODE | PARK_NAME     | PARK_CITY    | PARK_COUNTRY |
+-----------+---------------+--------------+--------------+
| FR1001    | FairyLand     | PARIS        | FR           |
| HM6541    | MEHRAN        | HYDERABAD    | PK           |
| HTR211    | QUAID         | KHI          | PK           |
| LIKE9021  | TAJPARK       | ISB          | PK           |
| NL1202    | Efling        | NOORD        | NL           |
| SP4533    | AdventurePort | BARCELONA    | SP           |
| SW2323    | Labyrinthe    | LAUSANNE     | SW           |
| UK2622    | MiniLand      | WINDSOR      | UK           |
| UK3452    | PleasureLand  | STOKE        | UK           |
| ZA1342    | GoldTown      | JOHANNESBURG | ZA           |
+-----------+---------------+--------------+--------------+
10 rows in set (0.001 sec)

MariaDB [Waqar]> ROLLBACK TO P1;
Query OK, 0 rows affected (0.000 sec)

MariaDB [Waqar]> SELECT * FROM THEMEPARK;
+-----------+---------------+--------------+--------------+
| PARK_CODE | PARK_NAME     | PARK_CITY    | PARK_COUNTRY |
+-----------+---------------+--------------+--------------+
| FR1001    | FairyLand     | PARIS        | FR           |
| LIKE9021  | TAJPARK       | ISB          | PK           |
| NL1202    | Efling        | NOORD        | NL           |
| SP4533    | AdventurePort | BARCELONA    | SP           |
| SW2323    | Labyrinthe    | LAUSANNE     | SW           |
| UK2622    | MiniLand      | WINDSOR      | UK           |
| UK3452    | PleasureLand  | STOKE        | UK           |
| ZA1342    | GoldTown      | JOHANNESBURG | ZA           |
+-----------+---------------+--------------+--------------+
8 rows in set (0.001 sec)





