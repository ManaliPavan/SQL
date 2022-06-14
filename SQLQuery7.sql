/*create database*/
create database Practise;
/*to use database*/
use Practise;
/*Create table-student*/
create table student(sid int primary key,sname varchar(25),percentage int);
/*insert into table-student*/
insert into student values(1,'manali',90);
insert into student values(2,'sonali',92);
insert into student values(3,'vrushali',94);
insert into student values(4,'monali',91);
insert into student values(5,'mrunali',93);
/*to display table-student*/
	select * from student;
/*create table-teacher*/
create table teacher(tid int primary key,tname varchar(25),subject varchar(25),salary int);
/*insert into table-teacher*/
insert into teacher values(11,'Deepa','C#',1000);
insert into teacher values(22,'Deepa','C#',1000);
insert into teacher values(33,'Deepa','C#',1000);
insert into teacher values(44,'Deepa','C#',1000);
insert into teacher values(55,'Deepa','C#',1000);


