
CREATE SCHEMA hotel;

--create tables
--customer

CREATE TABLE hotel.customer
(cust_id int CONSTRAINT c_pkey PRIMARY KEY,
cust_name varchar(25),
ph_no bigint unique not null,
age int CHECK (age>18),
gender varchar(1) CHECK (gender='f' or gender='m')
);

--hotel

CREATE TABLE hotel.hotel
(hotel_id int CONSTRAINT h_pkey PRIMARY KEY,
hotel_name varchar(25),
city varchar(25),
pin_code int,
rating_id int,
CONSTRAINT h_fkey FOREIGN KEY(rating_id) REFERENCES hotel.rating(rating_id));

--booking_app

CREATE TABLE hotel.booking_app
(app_id int CONSTRAINT ba_pkey PRIMARY KEY,
a_name varchar(25));

--bookinng details

CREATE TABLE hotel.b_details
(booking_id int CONSTRAINT bd_pkey PRIMARY KEY,
cust_id int,
CONSTRAINT bd_fkey1 FOREIGN KEY(cust_id) REFERENCES hotel.customer(cust_id),
app_id int,
CONSTRAINT bd_fkey2 FOREIGN KEY(app_id) REFERENCES hotel.booking_app(app_id),
hotel_id int,
CONSTRAINT bd_fkey3 FOREIGN KEY(hotel_id) REFERENCES hotel.hotel(hotel_id),
b_id int ,
CONSTRAINT bd_fkey4 FOREIGN KEY(b_id) REFERENCES hotel.b_details(booking_id),
check_in_date date,
check_out_date date,
charges int,
no_of_people int,
ispaid  bit);

--rating

CREATE TABLE hotel.rating
(rating_id int CONSTRAINT r_pkey PRIMARY KEY,
r_details varchar(25));


--insert into

--customer

INSERT INTO hotel.customer VALUES(111,'manali',1234567890,23,'f'),(222,'sonali',2134567890,21,'f'),(333,'raj',3124567890,25,'m'),(444,'suraj',4123567890,28,'m'),(555,'riya',5123467890,22,'f');

--hotel

INSERT INTO hotel.hotel VALUES(11,'anapurna','chichwad',411017,1),(12,'amantran','nigdi',411017,2),(13,'aathwan','kalewadi',411017,4),(14,'malashree','pimpri',411017,3);

--booking_app

INSERT INTO hotel.booking_app VALUES(101,'trivago'),(102,'google trips'),(103,'hopper'),(104,'makemytrip');

--b_details


INSERT INTO hotel.b_details VALUES (1,111,101,11,null,'2021-04-12','2021-04-30',12000,1,1),(2,111,101,11,1,'2021-06-12','2021-06-30',12000,1,1),(3,222,102,14,null,'2021-05-12','2021-05-30',30000,3,1);
INSERT INTO hotel.b_details VALUES (4,222,101,12,null,'2021-04-12','2021-04-30',12000,1,1),(5,222,101,12,4,'2021-06-12','2021-06-30',12000,1,1),(6,222,102,14,3,'2021-06-12','2021-06-30',30000,3,1);
INSERT INTO hotel.b_details VALUES (7,222,101,11,null,'2021-03-12','2021-04-30',12000,1,1);
update hotel.b_details set check_out_date='2021-06-15'  where booking_id=2;

INSERT INTO hotel.b_details VALUES (8,111,101,11,null,'2018-04-12','2018-04-13',12000,1,1),(9,111,101,11,1,'2018-06-12','2018-06-14',12000,1,1),(10,222,102,14,null,'2021-05-12','2021-05-30',30000,3,1);
INSERT INTO hotel.b_details VALUES (11,222,101,12,null,'2018-04-12','2018-04-30',12000,1,1),(12,222,101,12,4,'2021-06-12','2021-06-30',12000,1,1),(13,222,102,14,3,'2021-06-12','2021-06-30',30000,3,1);
--rating

INSERT INTO hotel.rating VALUES(1,'very good'),(2,'good'),(3,'average'),(4,'poor');


--select queries

SELECT * FROM hotel.hotel;
SELECT * FROM hotel.customer;
SELECT * FROM hotel.b_details;
SELECT * FROM hotel.booking_app;
SELECT * FROM hotel.rating;

--queries

--1.cust_name who booked hotel max times as cnt for hotel booking app arrange cnt desc.

SELECT TOP 1 cust_name,count(hotel_id) from hotel.customer c inner join hotel.b_details b on c.cust_id=b.cust_id  group by cust_name order by count(hotel_id)desc;


--2.all booking details for december 2018
SELECT * FROM hotel.b_details where DATEPART(year,check_in_date)=2018 and DATEPART(month,check_in_date)=12;

--3.top 3 rating hotel in may 2018
SELECT Distinct TOP 3 h.* 
FROM hotel.hotel h 
join  hotel.b_details b on h.hotel_id=b.hotel_id 
where DATEPART(year,check_in_date)=2018 
ORDER BY rating_id;

--4.cust_id who have done max no of booking
SELECT max(b.cust_id) from hotel.customer c inner join hotel.b_details b on c.cust_id=b.cust_id;

--5.top three hotel who have rating as very good
SELECT TOP 3 * FROM hotel.hotel WHERE rating_id in(SELECT rating_id FROM hotel.rating WHERE r_details='very good'); 

--6.customer name who have stayed longest in hotel name olive(anapurna)
SELECT TOP 1 DATEDIFF(day,check_in_date,check_out_date)
,c.cust_name 'Customer name'FROM hotel.customer c 
inner join hotel.b_details b on c.cust_id=b.cust_id
inner join hotel.hotel h on b.hotel_id=h.hotel_id
where h.hotel_name='anapurna' 
order by  DATEDIFF(day,check_in_date,check_out_date) desc;

--7.hotel name from city name start with p and whose rating is very good and arrange hotel names inasc
SELECT hotel_name FROM hotel.hotel 
WHERE city like 'p%' and rating_id=(
SELECT rating_id FROM hotel.rating WHERE r_details='very good') 
order by hotel_name;

--8.create index for faster retrieval of charge

CREATE INDEX idxhotel on hotel.b_details(charges);

--9.update remark as very good to hotel which have max booking
UPDATE hotel.hotel
SET hotel.rating_id=(SELECT rating_id FROM hotel.rating WHERE r_details='very good')
FROM hotel.hotel h inner join hotel.b_details b ON h.hotel_id=b.hotel_id
WHERE           

UPDATE <table_name>
SET <table_name>.<column_name> = <table_name1>.<column_name>, ...
FROM <table_name>
[ INNER | LEFT ] JOIN <table_name1> ON <join_predicate>
[ WHERE Condition(s) ]
--10.delete booking id of customer who have paid bill & already checkout
DELETE FROM hotel.b_details WHERE ispaid=1 and check_out_date is  not null;

--11.get total family menbers of mr amol who visited hotel orchid in month june
SELECT no_of_people FROM hotel.b_details 
WHERE DATEPART(month,check_in_date)='06' 
and cust_id=(SELECT cust_id FROM hotel.customer WHERE cust_name='amol') 
and hotel_id=(SELECT hotel_id FROM hotel.hotel WHERE hotel_name='orchid');

