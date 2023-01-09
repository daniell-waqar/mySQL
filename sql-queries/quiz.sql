1:

SELECT hotelno,roomno, MAX(price)  FROM room WHERE price <> (SELECT MAX(price)  FROM room);
+---------+--------+------------+
| hotelno | roomno | MAX(price) |
+---------+--------+------------+
| fb01    |    501 |      59.99 |
+---------+--------+------------+
1 row in set (0.000 sec)

2:

MariaDB [guest_house]> select roomno, hotelno, hotelname from hotel natural join room natural join booking where datefrom in("2005","2010");

4:

MariaDB [guest_house]> select hotelname from hotel natural join room where type='single'or type='double';
+---------------+
| hotelname     |
+---------------+
| Omni Shoreham |
| Phoenix Park  |
| Phoenix Park  |
| Latham        |
| Latham        |
| Grosvenor     |
| Grosvenor     |
| Watergate     |
| Watergate     |
+---------------+
9 rows in set (0.001 sec)

5:

MariaDB [guest_house]> select hotelname from hotel natural join room where type='single'or type='family';
+---------------+
| hotelname     |
+---------------+
| Omni Shoreham |
| Omni Shoreham |
| Phoenix Park  |
| Latham        |
| Latham        |
| Grosvenor     |
| Grosvenor     |
| Watergate     |
+---------------+
8 rows in set (0.001 sec)


6:

MariaDB [guest_house]> select hotelname,hotelno,type from hotel natural join room where price < 40.00 AND type="double" OR type="family" order by price;
+---------------+---------+--------+
| hotelname     | hotelno | type   |
+---------------+---------+--------+
| Phoenix Park  | ch02    | double |
| Grosvenor     | fb01    | double |
| Latham        | dc01    | double |
| Latham        | dc01    | family |
| Grosvenor     | fb01    | family |
| Omni Shoreham | ch01    | family |
+---------------+---------+--------+
6 rows in set (0.001 sec)


7:

MariaDB [guest_house]> select type, price from hotel natural join room where
    -> hotelname="Grosvenor";
+--------+-------+
| type   | price |
+--------+-------+
| single | 19.00 |
| double | 29.00 |
| family | 39.00 |
+--------+-------+
3 rows in set (0.000 sec)


8:

ariaDB [guest_house]> select guestname from hotel natural join booking natural join guest where
    -> hotelname="Watergate";
+--------------+
| guestname    |
+--------------+
| John Kay     |
| Mary Tregear |
+--------------+
2 rows in set (0.001 sec)


9:

MariaDB [guest_house]> select hotelname from hotel natural join room where roomno > 2;
+---------------+
| hotelname     |
+---------------+
| Omni Shoreham |
| Omni Shoreham |
| Phoenix Park  |
| Phoenix Park  |
| Latham        |
| Latham        |
| Latham        |
| Grosvenor     |
| Grosvenor     |
| Grosvenor     |
| Watergate     |
| Watergate     |
+---------------+
12 rows in set (0.001 sec)


10;

MariaDB [guest_house]> select count( roomno) from hotel natural join room where city="London";
+----------------+
| count( roomno) |
+----------------+
|              7 |
+----------------+
1 row in set (0.001 sec)




