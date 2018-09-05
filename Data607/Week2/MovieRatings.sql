DROP TABLE IF EXISTS userratings;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS users;

CREATE TABLE movies 
(
  movieid int NOT NULL AUTO_INCREMENT,
  moviename varchar(100) NOT NULL,
  PRIMARY KEY (movieid)
);


CREATE TABLE users 
(
  userid int NOT NULL AUTO_INCREMENT,
  username varchar(100) NOT NULL,
  PRIMARY KEY (userid)
);

CREATE TABLE userratings 
(
  
  userratingid int NOT NULL AUTO_INCREMENT,
  movieid int NOT NULL,
  userid int NOT NULL,
  userrating int NOT NULL, 
  PRIMARY KEY (userratingid),
  FOREIGN KEY (movieid)
  REFERENCES movies(movieid)
  ON DELETE CASCADE,
  FOREIGN KEY (userid)
  REFERENCES users(userid)
  ON DELETE CASCADE
);

INSERT INTO movies(movieid, moviename) 
SELECT 1, 'Titanic' 
UNION ALL
SELECT 2, 'Star Wars'
UNION ALL
SELECT 3, 'The Lord of the Rings'
UNION ALL
SELECT 4, 'Terminator'
UNION ALL
SELECT 5, 'The Lion King '
UNION ALL
SELECT 6, 'The Godfather';

INSERT INTO users(userid, username)
SELECT 1 , 'James'
UNION ALL
SELECT 2, 'Seth'
UNION ALL
SELECT 3, 'Anant'
UNION ALL
SELECT 4, 'Vishal'
UNION ALL
SELECT 5, 'Eric';

SET @row_number = 0;

INSERT INTO userratings(userratingid, movieid, userid,userrating)
select  (@row_number:=@row_number + 1) as userratingid, movieid, userid, FLOOR(RAND() * 5) + 1 as userrating
from movies JOIN users


