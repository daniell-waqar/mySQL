MariaDB [hr]> create procedure name(IN var1 int, IN var2 varchar(5), IN var3 varchar(10))
    -> 
    -> BEGIN
    -> INSERT INTO regions(region_id,region_name) values (var1,var2);
    -> INSERT INTO countries(country_id,country_name,region_id) values (var2,var3,var1);
    -> end $$
Query OK, 0 rows affected (0.003 sec)

MariaDB [hr]> delimiter ;
MariaDB [hr]> call name(9,"WF","PAK")
    -> ;
Query OK, 2 rows affected (0.002 sec)

MariaDB [hr]> SELECT * FROM name;
ERROR 1146 (42S02): Table 'hr.name' doesn't exist
MariaDB [hr]> SELECT * FROM regions;
+-----------+------------------------+
| region_id | region_name            |
+-----------+------------------------+
|         1 | Europe                 |
|         2 | Americas               |
|         3 | Asia                   |
|         4 | Middle East and Africa |
|         5 | NULL                   |
|         6 | NULL                   |
|         7 | NULL                   |
|         8 | NULL                   |
|         9 | WF                     |
+-----------+------------------------+
9 rows in set (0.001 sec)

MariaDB [hr]> SELECT * FROM countries;
+------------+--------------------------+-----------+
| country_id | country_name             | region_id |
+------------+--------------------------+-----------+
| AR         | Argentina                |         2 |
| AU         | Australia                |         3 |
| BE         | Belgium                  |         1 |
| BR         | Brazil                   |         2 |
| CA         | Canada                   |         2 |
| CH         | Switzerland              |         1 |
| CN         | China                    |         3 |
| DE         | Germany                  |         1 |
| DK         | Denmark                  |         1 |
| EG         | Egypt                    |         4 |
| FR         | France                   |         1 |
| HK         | HongKong                 |         3 |
| IL         | Israel                   |         4 |
| IN         | India                    |         3 |
| IT         | Italy                    |         1 |
| JP         | Japan                    |         3 |
| KW         | Kuwait                   |         4 |
| MX         | Mexico                   |         2 |
| NG         | Nigeria                  |         4 |
| NL         | Netherlands              |         1 |
| SG         | Singapore                |         3 |
| UK         | United Kingdom           |         1 |
| US         | United States of America |         2 |
| WF         | PAK                      |         9 |
| ZM         | Zambia                   |         4 |
| ZW         | Zimbabwe                 |         4 |

