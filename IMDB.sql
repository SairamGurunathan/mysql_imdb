create database IMDB_db;
use IMDB_db;

create table movies(
Movie_id int auto_increment,
Movie_name varchar(50) not null,
Rating decimal(3,1) not null,
Director varchar(50) not null,
Media varchar(50) not null,
Release_Year year not null,
Language varchar(50),
primary key (Movie_id)
);

insert into movies(Movie_name,Rating,Director,Media,Release_Year,Language) values('Nayagan',8.3,'Mani Ratnam','Image',1987,'Tamil'),
('Anbe Sivam',8.1,'Sundar C','Image',2003,'Tamil'),
('Jai Bhim',7.9,'Gnanavel Raja','Video',2021,'Tamil'),
('Soorarai Pottru',8.1,'Sudha Kongara','Image',2020,'Tamil'),
('Kaithi',8.2,'Lokesh Kanagaraj','Video',2019,'Tamil'),
('Asuran',7.9,'Vetrimaran','Image',2019,'Tamil');

select * from movies;

create table genre(
genre_id varchar(5),
gener varchar(50),
primary key (genre_id)
);

alter table genre
rename column gener to genre;

insert into genre values('G1','Crime'),('G2','Drama'),('G3','Comedy'),('G4','Action'),('G5','Adventure');

create table genre_list(
movie_id int,
movie_name varchar(50),
genre_id varchar(5),
genre varchar(50),
foreign key (movie_id) REFERENCES movies(movie_id),
foreign key (genre_id) REFERENCES genre(genre_id)
);

insert into genre_list values(1,'Nayagan','G1','Crime'),
(2,'Anbe Sivam','G2','Drama'),
(3,'Jai Bhim','G3','Comedy'),
(4,'Soorarai Pottru','G4','Action'),
(5,'Kaithi','G5','Adventure'),
(6,'Asuran','G4','Action');

create table users(
user_id varchar(5),
movie_id int,
primary key (user_id)
);

alter table users
add foreign key (movie_id) references movies(movie_id);

insert into users values('U1',1),('U2',3),('U3',3),('U4',4),('U5',5),('U6',6);

create table reviews(
user_id varchar(5),
movie_id int,
review varchar(50),
foreign key (user_id) references users(user_id),
foreign key (movie_id) references movies(movie_id)
);

insert into reviews values('U1',1,'good'),('U2',3,'very good'),('U3',3,'medium'),('U4',4,'good'),('U5',5,'medium'),('U6',6,'low');

create table skills(
movie_id int,
artist_name varchar(50),
skills varchar(50),
foreign key (movie_id) references movies(movie_id)
);

insert into skills values(1,'Kamalhasan','Actor,singer'),(2,'kamalhasan','actor'),(3,'suriya','actor'),(4,'suriya','actor'),(5,'karthi','actor'),(6,'dhanush','actor');

create table roles(
movie_id int,
character_name varchar(50),
role varchar(50),
foreign key (movie_id) references movies(movie_id)
);

insert into roles values(1,'Velu Naickar','Single Role'),
(2,'Nallasivam','Single Role'),
(3,'Chandru','Single Role'),
(4,'Nedumaran','Single Role'),
(5,'Dilli','Single Role'),
(6,'Siva Samy','Single Role');

select m.Movie_name,m.director from movies as m
inner join genre_list as g on m.movie_name = g.movie_name
where g.genre='crime' and m.Director='Mani Ratnam';
