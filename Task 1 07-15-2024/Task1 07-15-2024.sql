use master;
go

-- create the database
create database library;
go

use library;
go

-- create the authors table
create table authors (
    authorid int,
    firstname varchar(30) not null,
    lastname varchar(30) not null,
    birthyear date,
    constraint tablepk primary key (authorid)
);
go

-- create the books table
create table books (
    bookid int,
    title varchar(100) not null,
    authorid int references authors(authorid),
    publishedyear date not null,
    copiesavailable int,
    bookcategory varchar(20)
);
go

-- insert data into the authors table
insert into authors (authorid, firstname, lastname, birthyear)
values 
(0, 'lujain', 'alazzam', '1998-08-18'),
(1, 'dima', 'ahmad', '1997-12-31'),
(2, 'suha', 'ka', '1996-08-18');
go

-- insert data into the books table
insert into books (bookid, title, authorid, publishedyear, copiesavailable, bookcategory)
values  
(1, 'norwegian wood', 0, '1987-01-01', 500, 'romance'),
(2, 'the autumn of the patriarch', 1, '1975-01-01', 300, 'fiction'),
(3, 'pride and prejudice', 2, '1813-01-28', 250, 'romance'),
(4, 'animal farm', 2, '1945-08-17', 300, 'fiction');
go

-- select all books 
select * from books;
go

-- select all authors
select * from authors;
go

-- book with the highest number of available copies
select title 
from books 
where copiesavailable = (select max(copiesavailable) from books);
go

-- book with the lowest number of available copies
select title 
from books 
where copiesavailable = (select min(copiesavailable) from books);
go

-- average publication year of books
select avg(year(publishedyear)) as averagepublicationyear 
from books;
go

-- total number of books in the library
select count(bookid) as totalbookscount 
from books;
go

-- empty the books table
truncate table books;
go

-- delete the authors table
drop table authors;
go
