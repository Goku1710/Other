
create table MoviesDB (
 Movie_name varchar(255) primary key,
 yr int(10),
 likes int(100),
 Genre varchar(100),
 Service varchar(255),
 Movie_Rating Enum('1-Star','2-Star','3-Star','4-Star','5-Star')
);

create table Member (
Uname varchar(255),
Movie_name varchar(255),
Total_Rating int,
Followers int,
Liked Enum('Yes','No')
);

INSERT INTO MoviesDB (Movie_name, yr, likes, Genre, Service, Movie_Rating) VALUES
('Inception', 2010, 25000, 'Sci-Fi', 'Netflix', '5-Star'),
('The Godfather', 1972, 35000, 'Crime', 'Amazon Prime', '5-Star'),
('The Dark Knight', 2008, 30000, 'Action', 'HBO Max', '5-Star'),
('Pulp Fiction', 1994, 20000, 'Crime', 'Netflix', '5-Star'),
('The Shawshank Redemption', 1994, 28000, 'Drama', 'Amazon Prime', '5-Star'),
('The Matrix', 1999, 27000, 'Sci-Fi', 'HBO Max', '4-Star'),
('Fight Club', 1999, 26000, 'Drama', 'Netflix', '4-Star'),
('Forrest Gump', 1994, 24000, 'Drama', 'HBO Max', '4-Star'),
('Interstellar', 2014, 22000, 'Sci-Fi', 'Netflix', '4-Star'),
('Gladiator', 2000, 21000, 'Action', 'Amazon Prime', '4-Star'),
('The Avengers', 2012, 25000, 'Action', 'Disney+', '4-Star'),
('Titanic', 1997, 30000, 'Romance', 'Disney+', '5-Star'),
('Jurassic Park', 1993, 23000, 'Adventure', 'Netflix', '4-Star'),
('The Lion King', 1994, 28000, 'Animation', 'Disney+', '5-Star'),
('Avatar', 2009, 32000, 'Sci-Fi', 'Disney+', '5-Star'),
('The Departed', 2006, 19000, 'Crime', 'Amazon Prime', '4-Star'),
('Mad Max: Fury Road', 2015, 18000, 'Action', 'HBO Max', '4-Star'),
('Braveheart', 1995, 17000, 'History', 'Netflix', '4-Star'),
('Coco', 2017, 15000, 'Animation', 'Disney+', '5-Star'),
('Black Panther', 2018, 22000, 'Action', 'Disney+', '5-Star');


INSERT INTO Member (Uname, Movie_name, Total_Rating, Followers, Liked) VALUES
('JohnDoe', 'Inception', 1, 150, 'No'),
('JaneSmith', 'Inception', 4, 200, 'Yes'),
('MikeJohnson', 'The Godfather', 2, 180, 'No'),
('AliceWilliams', 'The Godfather', 5, 170, 'Yes'),
('ChrisBrown', 'The Dark Knight', 1, 220, 'No'),
('EmmaDavis', 'The Dark Knight', 4, 190, 'Yes'),
('DavidWilson', 'Pulp Fiction', 5, 160, 'Yes'),
('SophiaTaylor', 'Pulp Fiction', 5, 210, 'Yes'),
('OliviaMartinez', 'The Shawshank Redemption', 5, 140, 'Yes'),
('LiamAnderson', 'The Shawshank Redemption', 4, 130, 'Yes'),
('LucasThomas', 'The Matrix', 4, 150, 'Yes'),
('MasonJackson', 'The Matrix', 3, 230, 'No'),
('EllaWhite', 'Fight Club', 4, 160, 'Yes'),
('AmeliaHarris', 'Fight Club', 5, 250, 'Yes'),
('JamesClark', 'Forrest Gump', 5, 260, 'Yes'),
('AvaRodriguez', 'Forrest Gump', 3, 140, 'No'),
('IsabellaLewis', 'Interstellar', 4, 120, 'Yes'),
('LoganWalker', 'Interstellar', 5, 110, 'Yes'),
('LucasHall', 'Gladiator', 5, 140, 'Yes'),
('LilyAllen', 'Gladiator', 1, 180, 'No');

select * from moviesdb;

Select * from member;

/* 
INNER JOIN: Selects records with matching values in both tables. 
Only the intersecting data is returned.
*/

Select member.uname,member.liked,moviesdb.movie_name,moviesdb.movie_rating
from member
inner join moviesdb on member.movie_name=moviesdb.movie_name;

/* 
Outer Join : : Returns all records when there is a match in either left or right table.
 If there is no match, NULLs are returned for the missing side.
*/

Select member.uname,member.liked,moviesdb.movie_name,moviesdb.movie_rating
from member
left join moviesdb on member.movie_name=moviesdb.movie_name
union
select member.uname,member.liked,moviesdb.movie_name,moviesdb.movie_rating
from moviesdb
right join member on moviesdb.movie_name=member.movie_name;

/* 
Left Join Returns all records from the left table, and the matched records 
from the right table. If no match is found, NULLs are returned for columns 
from the right table.
*/

Select member.uname,member.liked,moviesdb.movie_name,moviesdb.movie_rating
from member
left join moviesdb on member.movie_name=moviesdb.movie_name;

/*
RIGHT JOIN : Returns all records from the right table, and
the matched records from the left table. If no match is found,
NULLs are returned for columns from the left table.
*/
 
select member.uname,member.liked,moviesdb.movie_name,moviesdb.movie_rating
from moviesdb
right join member on moviesdb.movie_name=member.movie_name;








