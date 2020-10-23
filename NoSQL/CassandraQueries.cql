CREATE KEYSPACE- 

CREATE KEYSPACE College WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

Description of keyspace-

DESCRIBE College


Create Table using keyspace-

CREATE TABLE College.Students(
   ... USN varint Primary key,
   ... FirstName text,
   ... LastName text,
   ... Course text,
   ... Phone varint);

Insert data into table-

INSERT into college.students(usn,firstname,lastname,course,phone) values(001,'Cheluvesha','B','Data Engineering',123456);

Update data-

UPDATE college.students SET course = '.net' WHERE usn = 002;

Read Data-

SELECT * FROM college.students;

SELECT USN,Course FROM college.students;


SELECT USN,Course FROM college.students WHERE USN = 004;


DELETE-

DELETE phone FROM college.students WHERE USN = 004;



