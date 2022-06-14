CREATE TABLE childdetails(chid int PRIMARY KEY IDENTITY(101,1),name varchar(10),age int);

INSERT INTO childdetails VALUES ('manali',23),('sonali',21),('chitra',25);

SELECT * FROM childdetails;