CREATE DATABASE Apple;
/*database in use*/
USE Apple;

/*creating table*/
CREATE TABLE students
(
studid int PRIMARY KEY,
sname varchar(25),
percentage int
);

/*insert data in table*/
INSERT INTO students VALUES(1,'manali',90);
INSERT INTO students VALUES(2,'sonali',90);
INSERT INTO students VALUES(3,'vrushali',94);
INSERT INTO students VALUES(4,'monali',90);
INSERT INTO students VALUES(5,'mrunali',93);

/*display structure of table*/
sp_help students;

/*display*/
SELECT * from students;

/*display students with name "manali"*/
select * from students where sname='manali';

/*drop table-students*/
DROP table students;

/*creating table*/
CREATE TABLE students
(
studid int PRIMARY KEY,
sname varchar(25) NOT NULL,
email varchar(50) NOT NULL,
mobile bigint UNIQUE,
city varchar(50) DEFAULT 'pune',
age int CHECK(age>18)
);

/*insert data in table-student*/
INSERT INTO students VALUES(1,'manali','manali@gmail.com',1234567890,'mumbai',23);
INSERT INTO students VALUES(2,'sonali','sonali@gmail.com',123456789,'ravet',22);
INSERT INTO students VALUES(3,'vrushali','vrushali@gmail.com',12345678,'pimpri',23);
INSERT INTO students(studid,sname,email,mobile,age) VALUES(4,'monali','monali@gmail.com',1234567,23);
INSERT INTO students(studid,sname,email,mobile,age) VALUES(5,'mrunali','mrunali@gmail.com',123456,22);

/*alter table-student (add & drop)*/
ALTER TABLE students ADD pyear int;
ALTER TABLE students DROP COLUMN pyear;

/*multiple insert*/
INSERT INTO students VALUES(6,'mana','mana@gmail.com',1234567893,'mumbai',23),(7,'mani','mani@gmail.com',123456785,'mumbai',23),(8,'manu','manu@gmail.com',23456789,'mumbai',23);

/*update query*/
UPDATE students SET sname='tisha' WHERE studid=6;

/*select city='mumbai'*/
SELECT * FROM students WHERE city='mumbai';

/*order by*/
SELECT * FROM students ORDER BY city;

/*delete*/
DELETE FROM students where city='pune';
DELETE FROM students where email='mana@gmail.com'; 

/*Drop constraint*/
ALTER TABLE students DROP CONSTRAINT CK_Students_age_4F7CD00D;

/*drop primary key*/
ALTER TABLE students DROP CONSTRAINT PK_students_E270950BA87C1C3F;

/*ALTER students*/
ALTER TABLE students ADD bid int CONSTRAINT fkey FOREIGN KEY REFERENCES batch;

/*create table batch*/
CREATE TABLE batch
(bid int CONSTRAINT b_pkey PRIMARY KEY,
bname varchar(25));

/*update table students*/
UPDATE students SET bid=101 WHERE studid=1;
UPDATE students SET bid=102 WHERE studid=2;
UPDATE students SET bid=101 WHERE studid=3;
UPDATE students SET bid=101 WHERE studid=4;
UPDATE students SET bid=101 WHERE studid=7;
UPDATE students SET bid=101 WHERE studid=8;

/*INSERT into batch*/
INSERT INTO batch VALUES (101,'Apple');
INSERT INTO batch VALUES (102,'Microsoft');
INSERT INTO batch VALUES (103,'Google');
INSERT INTO batch VALUES (104,'IBM');
INSERT INTO batch VALUES (105,'Facebook');

/*create table-teacher*/
CREATE TABLE teachers
(
tid int PRIMARY KEY,
tname varchar(25),
subject varchar(25),
salary int
);

/*insert into table-teacher*/
INSERT INTO teachers values(11,'Deepa','C#',1000);
INSERT INTO teachers values(22,'Deepa','C#',1000);
INSERT INTO teachers values(33,'Deepa','C#',1000);
INSERT INTO teachers values(44,'Deepa','C#',1000);
INSERT INTO teachers values(55,'Deepa','C#',1000);

/*Giving name to constraint(primary key)*/
CREATE TABLE temp(tempid int CONSTRAINT ITS_PRIMARY PRIMARY KEY,name varchar(25));

