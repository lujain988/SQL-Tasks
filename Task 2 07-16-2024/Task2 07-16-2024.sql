use master 
go 
create database School;
go 
use School;
go
create table Teachers (
ID int, 
courses varchar(10),
studentsID int,
unique (ID)
);

create table TeacherDetails (
ID int primary key,
NameofTeacher varchar(30) not null,
birthDate date,
email varchar(30),
phone varchar(13) not null,
addressHome varchar(50),
salary decimal(10,2) not null,
);

create table Courses(
ID int primary key, 
nameOfCourse varchar(15) not null,
studentID int,
teacherID int  references Teachers(ID),
);

create table Students(
ID int, 
courseID int references Courses(ID), 
teacherID int references Teachers(ID),
phone varchar(13) not null,
email varchar(20),
AdressHome varchar(15),
);

-- Insert records into Teachers table
insert into Teachers 
values
(1, 'Math', 1),
(2, 'Science', 1),
(3, 'English', 3),
(4, 'History', 4),
(5, 'Art', 5);

--insert records into TeacherDateails 
insert into TeacherDetails 
values 
(1,'lujain', '1998-08-18', 'lujainalazzam98@gmail.com','0772816672', '123 st', '5000'),
(2,'demma', '1998-08-18', 'demma98@gmail.com','0772816672', '123 st', '100'),
(3,'suha', '1998-08-18', 'suha@gmail.com','0772816672', '123 st', '300'),
(4,'noor', '1998-08-18', 'noor@gmail.com','0772816672', '123 st', '200'),
(5,'hala', '1998-08-18', 'hala@gmail.com','0772816672', '123 st', '1000');

--insert records into the courses table
insert into Courses 
values
(1, 'Math 101', 1, 1),
(2, 'Science 101', 2, 2),
(3, 'English 101', 3, 3),
(4, 'History 101', 4, 4),
(5, 'Art 101', 5, 5);

-- Insert records into the Students table
insert into Students 
values
(1, 1, 1, '9876543210', 'student1@example.com', '321 St'),
(2, 2, 2, '9876543211', 'student2@example.com', '654 St'),
(3, 3, 3, '9876543212', 'student3@example.com', '987 St'),
(4, 4, 4, '9876543213', 'student4@example.com', '321  St'),
(5, 5, 5, '9876543214', 'student5@example.com', '654  St');


select * from Teachers;
select * from TeacherDetails;
select * from Courses;
select * from Students;