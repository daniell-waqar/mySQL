
1:

MariaDB [person]> create PROCEDURE my_proc (IN id int , IN total_users int, IN Yahoo int,IN Hotmail int , IN Gmail int) BEGIN INSERT INTO Summary Values (2,3,2,1,2); END $$
Query OK, 0 rows affected (0.001 sec)

MariaDB [person]> DELIMITER ;
MariaDB [person]> CALL my_proc(2,3,2,1,2);
Query OK, 1 row affected (0.003 sec)

MariaDB [person]> select * from Summary;
+----+-------------+-------+---------+-------+
| id | total_users | Yahoo | Hotmail | Gmail |
+----+-------------+-------+---------+-------+
|  1 |           2 |     1 |       0 |     1 |
|  2 |           3 |     2 |       1 |     2 |
+----+-------------+-------+---------+-------+
2 rows in set (0.000 sec)


2:


create PROCEDURE my_user_pro (IN user_id int , IN username varchar(25),IN password Varchar(10),IN email varchar(25),IN salary int) BEGIN insert into users (user_id , username, password, email, salary) Values (1,'xvc567','def123','itsme1562@gmail.com',3000);  END$$
Query OK, 0 rows affected (0.004 sec)

MariaDB [person]> DELIMITER ;
MariaDB [person]> CALL  my_user_pro(1,'xvc567','def123','itsme1562@gmail.com',3000);
Query OK, 1 row affected (0.003 sec)

MariaDB [person]> SELECT * FROM users;
+---------+----------+----------+---------------------+--------+
| user_id | username | password | email               | salary |
+---------+----------+----------+---------------------+--------+
|       1 | xvc567   | def123   | itsme1562@gmail.com |   3000 |
+---------+----------+----------+---------------------+--------+
1 row in set (0.001 sec)


--------Then using different procedures I put recordes into table users---------------
-------total 5 recordes------------------------I have done


MariaDB [person]> select * from users $$
+---------+----------+----------+---------------------+--------+
| user_id | username | password | email               | salary |
+---------+----------+----------+---------------------+--------+
|       1 | xvc567   | def123   | itsme1562@gmail.com |   3000 |
|       2 | abc567   | asp123   | john908@gmail.com   |   2000 |
|       3 | ghj567   | lim123   | firn308@gmail.com   |   5000 |
|       4 | pop2367  | sdf123   | nam348@gmail.com    |   4000 |
|       5 | asd2367  | ret123   | uyuy@gmail.com      |   8000 |
+---------+----------+----------+---------------------+--------+
5 rows in set (0.000 sec)


3:


MariaDB [person]> CREATE PROCEDURE tot_users (out total int)
    -> BEGIN
    -> SELECT count(user_id) from users;
    -> END $$
Query OK, 0 rows affected (0.003 sec)

MariaDB [person]> delimiter ;
MariaDB [person]> CALL tot_users(@out);
+----------------+
| count(user_id) |
+----------------+
|              5 |
+----------------+
1 row in set (0.001 sec)

Query OK, 0 rows affected (0.001 sec)


4:


MariaDB [person]> CREATE PROCEDURE avg_sal (out sal decimal)
    -> BEGIN
    -> SELECT avg(salary) from users;
    -> END $$
Query OK, 0 rows affected (0.003 sec)

MariaDB [person]> CALL avg_sal(@out) $$
+-------------+
| avg(salary) |
+-------------+
|   4400.0000 |
+-------------+
1 row in set (0.001 sec)

Query OK, 0 rows affected (0.001 sec)



5:

MariaDB [person]> CREATE PROCEDURE min_max(OUT MIN_SAL INT,OUT MAX_SAL INT) BEGIN SELECT MIN(SALARY),MAX(SALARY) INTO MIN_SAL,MAX_SAL FROM users; END$$
Query OK, 0 rows affected (0.004 sec)

MariaDB [person]> DELIMITER ;
MariaDB [person]> CALL min_max(@MIN_SAL , @MAX_SAL)
    -> ;
Query OK, 1 row affected (0.000 sec)

MariaDB [person]> SELECT @MIN_SAL,@MAX_SAL;
+----------+----------+
| @MIN_SAL | @MAX_SAL |
+----------+----------+
|     2000 |     8000 |
+----------+----------+
1 row in set (0.000 sec)


6:

------------------------part 1---------------------------------


MariaDB [person]> DELIMITER $$
MariaDB [person]> CREATE TRIGGER test AFTER INSERT ON users
    -> FOR EACH ROW BEGIN
    ->   UPDATE Summary SET total_users = total_users + 1 WHERE id = 1
    -> ;
    -> END $$
Query OK, 0 rows affected (0.004 sec)

MariaDB [person]>  DELIMITER ;
MariaDB [person]> INSERT INTO users (user_id,username, password, email, salary) VALUES (2,'AKHTAR','abc123','AKHTAR313@gmail.COM' , 2500)
    -> ;
Query OK, 1 row affected (0.004 sec)

MariaDB [person]> select * from Summary;
+----+-------------+-------+---------+-------+
| id | total_users | Yahoo | Hotmail | Gmail |
+----+-------------+-------+---------+-------+
|  1 |           3 |     1 |       0 |     1 |
|  2 |           3 |     2 |       1 |     2 |
+----+-------------+-------+---------+-------+
2 rows in set (0.001 sec)


MariaDB [person]> INSERT INTO users (user_id,username, password, email, salary) VALUES (7,'TALHA','XYZ123','TALHA123@GMAIL.COM' , 2000
    -> );
Query OK, 1 row affected (0.004 sec)

MariaDB [person]>  INSERT INTO users (user_id,username, password, email, salary) VALUES (2,'AKHTAR','abc123','AKHTAR313@gmail.COM' , 2500);
Query OK, 1 row affected (0.002 sec)

MariaDB [person]> INSERT INTO users (user_id,username, password, email, salary) VALUES (7,'TALHA','XYZ123','TALHA123@GMAIL.COM' , 2000);
Query OK, 1 row affected (0.004 sec)

MariaDB [person]> select * from Summary;
+----+-------------+-------+---------+-------+
| id | total_users | Yahoo | Hotmail | Gmail |
+----+-------------+-------+---------+-------+
|  1 |           6 |     1 |       0 |     1 |
|  2 |           3 |     2 |       1 |     2 |
+----+-------------+-------+---------+-------+
2 rows in set (0.001 sec)



---------------------------part 2------------------------------------------------------

MariaDB [person]> CREATE TRIGGER test1 AFTER DELETE ON users FOR EACH ROW BEGIN  UPDATE Summary SET total_users = total_users - 1 WHERE id = 1 ; END$$ 
Query OK, 0 rows affected (0.004 sec)

MariaDB [person]> DELIMITER ;
MariaDB [person]> DELETE FROM users WHERE user_id = 7;
Query OK, 2 rows affected (0.001 sec)

MariaDB [person]> select * from Summary;
+----+-------------+-------+---------+-------+
| id | total_users | Yahoo | Hotmail | Gmail |
+----+-------------+-------+---------+-------+
|  1 |           4 |     1 |       0 |     1 |
|  2 |           3 |     2 |       1 |     2 |
+----+-------------+-------+---------+-------+
2 rows in set (0.001 sec)




