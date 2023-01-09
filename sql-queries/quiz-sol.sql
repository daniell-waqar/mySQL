
1. 
SELECT R.roomno,H.hotelno,H.hotelname,R.price FROM `room` R join hotel H on H.hotelno=R.hotelno where price <(SELECT max(price) from room) ORDER by price DESC limit 1;

2. 
SELECT H.hotelno,H.hotelname,R.roomno FROM booking B JOIN room R on R.roomno=B.roomno and R.hotelno=B.hotelno join hotel H on H.hotelno=B.hotelno where dateto BETWEEN '2005-01-01' and '2010-12-31' or datefrom BETWEEN '2005-01-01' and '2010-12-31';

3. 
SELECT R.roomno,H.hotelno,H.hotelname,R.price FROM `room` R join hotel H on H.hotelno=R.hotelno where price >(SELECT MIN(price) from room) and type='single' ORDER by price Asc limit 1,1;

4.
SELECT R.roomno,H.hotelno,H.hotelname,R.price,R.type FROM `room` R join hotel H on H.hotelno=R.hotelno where type in ('family','double');


5. 
SELECT R.roomno,H.hotelno,H.hotelname,R.price,R.type FROM `room` R 
     join hotel H on H.hotelno=R.hotelno where R.type in ('single','double') 

     and R.hotelno not in (SELECT hotelno FROM room WHERE type='family');
6. 
 SELECT R.*,H.* FROM room R join hotel H on R.hotelno=H.hotelno WHERE price < 40 AND type IN ('double', 'family') ORDER BY price;


7.
SELECT price, type FROM room WHERE hotelno = (SELECT hotelNo FROM hotel WHERE hotelName = 'Grosvenor');


8. 

SELECT * FROM guest WHERE guestNo = (SELECT guestNo FROM booking WHERE dateFrom <= CURRENT_DATE AND dateTo >= CURRENT_DATE AND hotelNo = (SELECT hotelNo FROM hotel WHERE hotelName = 'Watergate'));


9. 
SELECT hotelNo, COUNT(roomNo) AS count FROM room GROUP BY hotelNo having count>2;

10. 
SELECT H.hotelNo, COUNT(R.roomNo) AS count FROM room R, hotel H WHERE R.hotelNo = H.hotelNo AND H.city = 'London' GROUP BY H.hotelNo;




