// CREATE KEYSPACE- 

CREATE KEYSPACE College WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

// Description of keyspace-

DESCRIBE College


// Create Table using keyspace-

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

// Read Data-

SELECT * FROM college.students;

SELECT USN,Course FROM college.students;


SELECT USN,Course FROM college.students WHERE USN = 004;


// DELETE-

DELETE phone FROM college.students WHERE USN = 004;



// Maps:



create Table info.users( UserID varint primary key, UserName text, Address map<text,text>);
Insert into info.users (userid , username , address ) values (1,'cheluvesha',{'bangalore' : 'karnataka'});
select * from info.users ;


UPDATE info.users SET username = 'Bharath', address = {'mumbai' : 'maharastra'} WHERE userid = 2;


DELETE address['city'] FROM info.users WHERE userid = 2;


// SETS:

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


// List :

CREATE TABLE info.plays (id text PRIMARY KEY,     game text,     players int,     scores list<int>  );


INSERT INTO plays (id, game, players, scores)
             VALUES ('123-afde', 'quake', 3, [17, 4, 2]);

UPDATE info.plays SET scores = [ 3, 9, 4] WHERE id = '123-abc';


// Append the List Data with Existing data
UPDATE info.plays SET players = 5, scores = scores + [ 14, 21 ] WHERE id = '123-abc';

// Deleting the all occurences 

UPDATE plays SET scores = scores - [ 12, 21 ] WHERE id = '123-afde';

//Removing an element by its position in the list

DELETE scores[1] FROM info.plays WHERE id = '123-abc';


// INDEX-

CREATE INDEX NAMEINDEX ON college.students (firstname) ;


select * from college.students where firstname = 'sam';

// Drop index

DROP INDEX college.nameindex ;

// Time To Live

INSERT INTO college.students (usn,firstname,lastname) values (2,'ted','bear') using ttl 100;


// User Defined Type (UDT)-

CREATE KEYSPACE emp WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TYPE Emp.Current_add
   ... (
   ... Emp_id int,
   ... h_no text,
   ... city text,
   ... state text,
   ... pin_code int,
   ... country text 
   ... ); 

CREATE TABLE Emp.Registration (  Emp_id int PRIMARY KEY,  Emp_Name text,  current_address FROZEN<Current_add> );

INSERT INTO emp.registration (Emp_id, Emp_Name, current_address ) 
 values (1000, 'Ashish', { h_no :'A 210', city : 'delhi', state : 'DL', pin_code : 12345, country :'IN'});


// User Defined Function-


CREATE FUNCTION Emp.Max_value(value1 int, value2 int) CALLED ON NULL INPUT RETURNS int LANGUAGE java AS $$return Math.max(value1, value2);$$;


INSERT INTO UDF_Function_test(function_id, num1, num2) 
   ... VALUES(101, 400, 600);

SELECT function_id, num1, num2, Max_value(num1, num2)  FROM emp.UDF_Function_test  ;



// Aggregation Function- 

SELECT count(*) FROM aggregation.emp;

SELECT min(score) FROM aggregation.emp;

SELECT max(score) FROM aggregation.emp; 

SELECT sum(score) FROM aggregation.emp;

SELECT avg(score) FROM aggregation.emp;


// Composite keys-

CREATE TABLE books (
   isbn text,
   title text,
   author text,
  publisher text,
   category text,
   PRIMARY KEY ((isbn, author), publisher)
);

// Cassandra - Query a column with collection type
                                           
CREATE KEYSPACE Frozen WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;
                 
CREATE TABLE data_points (
          ...   id text PRIMARY KEY,
          ...   created_at timestamp,
          ...   previous_event_id varchar,
          ...   properties map<text,text>
          ... );
INSERT INTO data_points (id, properties) VALUES ('1', { 'fruit' : 'apple', 'band' : 'Beatles' });
INSERT INTO data_points (id, properties) VALUES ('2', { 'fruit' : 'orange', 'band' : 'Beatles' });
INSERT INTO data_points (id, properties) VALUES ('~', { 'fruit' : 'Pink', 'band' : 'EDM' });
INSERT INTO data_points (id, properties) VALUES ('3', { 'fruit' : 'Pink', 'band' : 'EDM' });
INSERT INTO data_points (id, properties) VALUES ('3', { 'fruit' : 'banana', 'band' : 'EDM' });
INSERT INTO data_points (id, properties) VALUES ('4', { 'fruit' : 'melon', 'band' : 'Weeknd' });
                                                 
SELECT * FROM data_points WHERE properties CONTAINS 'Beatles';
                                                 
                                                 
                                             
