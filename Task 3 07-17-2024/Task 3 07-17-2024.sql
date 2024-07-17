use master;
go 
create database librarySystem;
use librarySystem;
go

create table Authors (
ID int primary key identity(1,1),
FirstName varchar(20) not null,
LastName varchar(20) not null);

create table Sections (
ID int primary key identity(1,1),
SectionName varchar(20) not null);

create table Categories (
ID int primary key identity(1,1),
CategoryName varchar(20) not null);

create table Books (
ID int primary key identity(1,1),
Title varchar(60) not null,
AuthorID int references Authors(ID),
SectionID int references Sections(ID));

create table Employees (
ID int primary key identity(1,1),
FirstName varchar(20) not null,
LastName varchar(20) not null,
Position varchar(20) not null);

create table Users (
ID int primary key identity(1,1),
employeeID int references Employees(ID),
FirstName varchar(20) not null,
LastName varchar(20) not null,
email varchar(20));

create table BorrowedBooks (
ID int primary key identity(1,1),
UserID  int references Users(ID),
BookID  int references Books(ID),
BorrowDate date not null,
ReturnDate date not null);

create table booksCategories (
ID int primary key,
BookID int references Books(ID),
CategoryID int references Categories(ID),
unique(BookID, CategoryID));

-- Insert data into Authors
insert into Authors (FirstName, LastName) values 
('George', 'Orwell'),
('J.K.', 'Rowling'),
('J.R.R.', 'Tolkien'),
('F. Scott', 'Fitzgerald'),
('Harper', 'Lee'),
('Test','Test');
-- Insert data into Sections
insert into Sections (SectionName) values 
('Fiction'),
('Fantasy'),
('Classics'),
('Science Fiction'),
('Non-Fiction');

-- Insert data into Categories
insert into Categories (CategoryName) values 
('Dystopian'),
('Fantasy'),
('Adventure'),
('Literary'),
('Historical'),
('FUN');

-- Insert data into Books
insert into Books (Title, AuthorID, SectionID) values 
('1984', 1, 1),
('Harry Potter and the Sorcerer''s Stone', 2, 2),
('The Hobbit', 3, 2),
('The Great Gatsby', 4, 3),
('To Kill a Mockingbird', 5, 3),
('Starnger',4,2);

-- Insert data into Employees
insert into Employees (FirstName, LastName, Position) values 
('Lujain', 'Alazzam', 'Librarian'),
('Dima', 'Ahmad', 'Assistant Librarian'),
('Yman', 'Kh', 'Cataloger'),
('Suha', 'Kha', 'Archivist'),
('Hala', 'Khafaja', 'Manager'),
('Noor', 'Qteshat', 'Assistant Librarian');

-- Insert data into Users
insert into Users (employeeID, FirstName, LastName, email) 
values
(1, 'Ayman', 'Jaradat', 'ayman@gmail.com'),
(2, 'Mohammad', 'Frehat', 'mohammad@gmail.com'),
(3, 'Batool', 'Dalki', 'batool@gmail.com'),
(4, 'Ammer', 'Abu Alheja', 'ammer@gmail.com'),
(5, 'Salam', 'Almomani', 'salam@gmail.com'),
(6, 'Dima', 'Ahmad', 'dima@gmail.com');
--DELETE FROM Users;
--delete from employees;
--DELETE FROM BorrowedBooks WHERE UserID IN (SELECT ID FROM Users);


-- Insert data into BorrowedBooks
insert into BorrowedBooks (UserID, BookID, BorrowDate, ReturnDate) values 
(1, 1, '2024-07-07', '2024-07-27'),
(2, 2, '2024-06-27', '2024-07-22'),
(3, 3, '2024-06-17', '2024-07-17'),
(4, 4, '2024-06-07', '2024-07-12'),
(5, 5, '2024-05-28', '2024-07-07');

-- Insert data into BooksCategories
insert into booksCategories (ID,BookID, CategoryID) values 
(1,1, 1),
(2,2, 2),
(3,3, 3),
(4, 4, 4),
(5, 5, 5);

select * from Authors;
select * from Sections;
select * from Categories;
select * from Books;
select * from Employees;
select * from Users;
select * from BorrowedBooks;
select * from booksCategories;

select s.ID, s.FirstName + ' ' + s.LastName, b.Title
from Authors s inner join Books b on s.ID = b.AuthorID;

select Users.ID, Users.FirstName + ' ' + Users.LastName Name, Books.Title , BorrowedBooks.BorrowDate, BorrowedBooks.ReturnDate
from Users LEFT JOIN BorrowedBooks on Users.ID = BorrowedBooks.UserID  LEFT JOIN Books on Books.ID= BorrowedBooks.BookID;

select  booksCategories.ID, Books.Title, Categories.CategoryName
from Books RIGHT JOIN booksCategories on Books.ID = booksCategories.BookID RIGHT JOIN Categories on Categories.ID = booksCategories.CategoryID;
 
 SELECT 
    booksCategories.BookID, 
    Authors.FirstName + ' ' + Authors.LastName AS AuthorName, 
    Books.Title, 
    Categories.CategoryName
FROM 
    booksCategories
FULL OUTER JOIN Books ON booksCategories.BookID = Books.ID
FULL OUTER JOIN Authors ON Books.AuthorID = Authors.ID
FULL OUTER JOIN Categories ON booksCategories.CategoryID = Categories.ID;