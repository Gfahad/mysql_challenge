
-- Very Easy: Create a table with your top three cars and include make, model, year. Create a query to add in two more cars

CREATE TABLE Vehicles (make VARCHAR(100), model VARCHAR(100),
       year INT);
INSERT INTO Vehicles(make,model,year)
       VALUES("Nissan","Lexus",2011),
       ("Toyota","Honda",2011),
       ("Kia","Corolla",2011);
       
INSERT INTO Vehicles(make,model,year)
       VALUES("Volvo","c30",2011),
       ("Cardillac","Jeep",2011);
   
SELECT * FROM Vehicles;


-- Easy: Create a table with your top five favorite books with Title, Publish Date, and
-- Author First/Last Name Create a query to add in two new books Remove the oldest book Provide an additional query giving the sum of all books


CREATE TABLE Books (Title VARCHAR(100), PublishDate VARCHAR(100),
       FirstName VARCHAR (100), LastName VARCHAR (100));

INSERT INTO Books(Title, PublishDate ,FirstName , LastName )
       VALUES("HarryPotter1","10-12-2001","Festus","Yangani"),("HarryPotter2","10-12-2012","Festus","Yangani"),("HarryPotter3","10-12-2014","Festus","Yangani"),("HarryPotter4","10-12-2016","Festus","Yangani"),("HarryPotter5","10-12-2018","Festus","Yangani");
       
INSERT INTO Books(Title, PublishDate ,FirstName , LastName )
       VALUES("Doctor","10-12-2001","Festus","Yangani"),("Once","10-12-2012","Festus","Yangani");
       
       DELETE FROM Books ORDER BY PublishDate ASC LIMIT 1;
       SELECT COUNT(Title)  FROM Books;
       SELECT * FROM Books;
       
       
       



-- Medium: Create a table with your top 10 movies. Include title, release date, and rating Create a query that pulls all movies, in order of release date, where the title includes the letter “s”.


CREATE TABLE Movies (Title VARCHAR(100), ReleasedDate DATE, Rating VARCHAR (100));

INSERT INTO Movies(Title, ReleasedDate ,Rating)
       VALUES 
       ("Avatar","2009-12-18","PG-13"),
       ("Avengers: Endgame","2019-04-26","PG"),
       ("Titanic","1997-12-19","PG-13"),
       ("Star Wars: The Force Awakens","2015-12-18","PG"),
       ("Avengers: Infinity War","2018-04-27","PG-13"),
       ("Spider-Man: No Way Home","2015-06-12","PG-13"),
       ("Jurassic World","2015-06-12","PG-13"),
       ("The Lion King","2019-07-19","PG-13"),
       ("Furious 7","2015-04-02","PG-13"),
       ("Black Panther","2018-02-16","PG-13");

 SELECT * FROM Movies WHERE Title LIKE '%S%' ORDER BY ReleasedDate;
 
 
 



-- 
-- Hard: Make a copy of your Medium Challenge Write out the queries that would add the director’s First Name and Last Name into two separate columns. 
-- Create a query that puts the names together. Create a query to put the list in alphabetical order by the last name from A-Z 
-- After you order the list, 
-- remove the Movies where the Last Name ends with ”R-Z” Write a query where the first three appear

ALTER TABLE Movies
ADD COLUMN Dir_FirstName VARCHAR(100),  ADD COLUMN Dir_LastName VARCHAR (100);


SET SQL_SAFE_UPDATES = 0;
UPDATE Movies SET Dir_FirstName = "James", Dir_LastName = "Cameron" WHERE Title = "Avatar";
UPDATE Movies SET Dir_FirstName = "Anthony", Dir_LastName = "Russo" WHERE Title =  "Avengers: Endgame";
UPDATE Movies SET Dir_FirstName = "James", Dir_LastName = "Cameron" WHERE Title =  "Titanic";
UPDATE Movies SET Dir_FirstName = "J.J.", Dir_LastName = "Abrams" WHERE Title =  "Star Wars: The Force Awakens";
UPDATE Movies SET Dir_FirstName = "Anthony", Dir_LastName = "Russo" WHERE Title =  "Avengers: Infinity War";
UPDATE Movies SET Dir_FirstName = "Jon", Dir_LastName = "Watts" WHERE Title =  "Spider-Man: No Way Home";
UPDATE Movies SET Dir_FirstName = "Colin", Dir_LastName = "Trevorrow" WHERE Title =  "Jurassic World";
UPDATE Movies SET Dir_FirstName = "Roger", Dir_LastName = "Allers" WHERE Title =  "The Lion King";
UPDATE Movies SET Dir_FirstName = "James", Dir_LastName = "Wan" WHERE Title =  "Furious 7";
UPDATE Movies SET Dir_FirstName = "Ryan", Dir_LastName = "Coogler" WHERE Title =  "Black Panther";
SET SQL_SAFE_UPDATES = 1;

SELECT  CONCAT(Dir_FirstName, ' ', Dir_LastName)
FROM Movies;


SELECT * FROM Movies  ORDER BY Dir_LastName ASC;

SELECT * FROM Movies WHERE RIGHT(Dir_LastName, 1) < "R" ORDER BY Dir_LastName ASC;

SELECT * FROM Movies WHERE RIGHT(Dir_LastName, 1) < "R" ORDER BY Dir_LastName ASC LIMIT 3;



-- Very Hard: Copy the table from your Very Easy Challenge 
-- Write a query to add in three cars at once 
-- Write a query to add in prices and colors for each of these cars
-- Write a query to put the Make and Model together in one column
-- Create a new query that adds an additional column to the results to show how many cars have the same Make

CREATE TABLE VehiclesVeryHard (make VARCHAR(100), model VARCHAR(100), year INT);
INSERT INTO VehiclesVeryHard(make, model, year)
       VALUES
       ("Nisssan","Pathfinder",2011),
       ("Toyota","RAV4",2011),
       ("Jeep","Cherokee",2007);
       
ALTER TABLE VehiclesVeryHard
    ADD COLUMN price FLOAT,
    ADD COLUMN color VARCHAR(10);
    
SET SQL_SAFE_UPDATES = 0;
UPDATE VehiclesVeryHard SET price = "20000.00", color = "RED" WHERE model = "Pathfinder";
UPDATE VehiclesVeryHard SET price = "28000.00", color = "RED" WHERE model = "RAV4";
UPDATE VehiclesVeryHard SET price = "32000.00", color = "RED" WHERE model = "Cherokee";
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
ALTER TABLE VehiclesVeryHard
    ADD COLUMN make_model VARCHAR(100);
UPDATE VehiclesVeryHard SET make_model = CONCAT(make, " ", model);
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM VehiclesVeryHard;

SELECT make, COUNT(*) as NUM from VehiclesVeryHard GROUP BY make;

       


 
