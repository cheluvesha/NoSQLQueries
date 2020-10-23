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



Maps:



create Table info.users( UserID varint primary key, UserName text, Address map<text,text>);
Insert into info.users (userid , username , address ) values (1,'cheluvesha',{'bangalore' : 'karnataka'});
select * from info.users ;


UPDATE info.users SET username = 'Bharath', address = {'mumbai' : 'maharastra'} WHERE userid = 2;


DELETE address['city'] FROM info.users WHERE userid = 2;


SETS:

CREATE TABLE images (
    name text PRIMARY KEY,
    owner text,
    tags set<text> // A set of text values
);

INSERT INTO images (name, owner, tags)
            VALUES ('cat.jpg', 'jsmith', { 'pet', 'cute' });

// Replace the existing set entirely
UPDATE images SET tags = { 'kitten', 'cat', 'lol' } WHERE name = 'cat.jpg';

// Adding multiple values to existing set
UPDATE info.images SET tags = tags + { 'gray', 'cuddly' } WHERE name = 'cat.jpg';

// Deleting from set
UPDATE info.images SET tags = tags - { 'cat' } WHERE name = 'cat.jpg';


List :

CREATE TABLE info.plays (id text PRIMARY KEY,     game text,     players int,     scores list<int>  );


INSERT INTO plays (id, game, players, scores)
             VALUES ('123-afde', 'quake', 3, [17, 4, 2]);

UPDATE info.plays SET scores = [ 3, 9, 4] WHERE id = '123-abc';
