Use internship;

#Creation of the Students Table
Create table Students(
	Student_ID int Primary key,
    Name varchar(40),
    Data_of_Birth date,
    Address varchar(100),
    Contact_Number varchar(12));
describe Students;
ALTER TABLE Students
RENAME COLUMN Data_of_Birth TO Date_of_Birth;

#Creation of the table Courses
Create table Courses(
	Course_ID int Primary key,
    Course_Name varchar(20),
    Course_Code varchar(10),
    Credits int); 
describe Courses;
alter table Courses 
modify COLUMN Course_Name varchar(50);


#Creation of the table Enrollments
Create table Enrollments(
	Enrollment_ID int Primary key,
    Student_ID int,
    Course_ID int,
    foreign key(Student_ID) references Students(Student_ID),
    foreign key(Course_ID) references Courses(Course_ID)
);
describe Enrollments;
Alter table Enrollments
add COLUMN Grade varchar(5);

#inserting of the data in students table
INSERT INTO Students (Student_ID, Name, Date_of_Birth, Address, Contact_Number)
VALUES
  (1, 'Alice Johnson', '2000-01-01', '123 Main St', '123-456-7890'),
  (2, 'Bob Smith', '2001-02-02', '456 Elm St', '987-654-3210'),
  (3, 'Charlie Brown', '2002-03-03', '789 Oak St', '555-555-5555'),
  (4, 'David Miller', '2003-04-04', '101 Pine St', '111-222-3333'),
  (5, 'Emily Davis', '2004-05-05', '202 Cedar St', '444-555-6666'),
  (6, 'Frank Wilson', '2005-06-06', '303 Maple St', '777-888-9999'),
  (7, 'Grace Lee', '2006-07-07', '404 Birch St', '123-456-7890'),
  (8, 'Henry Moore', '2007-08-08', '505 Elm St', '987-654-3210'),
  (9, 'Isabella Clark', '2008-09-09', '606 Oak St', '555-555-5555'),
  (10, 'Jacob Taylor', '2009-10-10', '707 Pine St', '111-222-3333');
Select * from students;

#inserting values in the Courses Table
INSERT INTO Courses (Course_ID, Course_Name, Course_Code, Credits)
VALUES
  (1, 'Database Systems', 'CS101', 3),
  (2, 'Data Structures and Algorithms', 'CS102', 4),
  (3, 'Operating Systems', 'CS103', 3),
  (4, 'Computer Networks', 'CS104', 4),
  (5, 'Web Development', 'CS105', 3),
  (6, 'Artificial Intelligence', 'CS106', 4),
  (7, 'Machine Learning', 'CS107', 3),
  (8, 'Software Engineering', 'CS108', 4),
  (9, 'Cybersecurity', 'CS109', 3),
  (10, 'Cloud Computing', 'CS110', 4);
Select * from Courses;

#inserting values in the enrollments table
INSERT INTO Enrollments (Enrollment_ID, Student_ID, Course_ID, Grade)
VALUES
  (1, 1, 1, 'A'),
  (2, 1, 2, 'B'),
  (3, 2, 1, 'A'),
  (4, 2, 3, 'B+'),
  (5, 3, 2, 'A-'),
  (6, 3, 4, 'B'),
  (7, 4, 3, 'A'),
  (8, 4, 5, 'B+'),
  (9, 5, 4, 'A-'),
  (10, 5, 6, 'B');
Select * from Enrollments;

#Various joins and applying it on various

#inner join , returns the matching value on both sides
select Student_ID,Name from Students;
select Student_ID from Enrollments;
Select Course_Name from Courses;
select * from Students;

SELECT S.Name, C.Course_Name, E.Grade
FROM Students S
INNER JOIN Enrollments E ON S.Student_ID = E.Student_ID
INNER JOIN Courses C ON E.Course_ID = C.Course_ID;

SELECT E.Student_ID, S.Name, C.Course_Name, E.Grade
FROM Enrollments E
INNER JOIN Students S ON E.Student_ID = S.Student_ID
INNER JOIN Courses C ON E.Course_ID = C.Course_ID;

#outer join
SELECT Students.Name, Courses.Course_Name, Enrollments.Grade
FROM Students
 JOIN Enrollments ON Students.Student_ID = Enrollments.Student_ID
 JOIN Courses ON Enrollments.Course_ID = Courses.Course_ID; 
 
#self join 
SELECT S1.Name AS Student1,S2.Name AS Student2
FROM Students S1
JOIN Students S2 ON S1.Address = S2.Address
WHERE S1.Student_ID <> S2.Student_ID;

#left join 
SELECT Students.Name, Courses.Course_Name, Enrollments.Grade
FROM Students
LEFT JOIN Enrollments ON Students.Student_ID = Enrollments.Student_ID
LEFT JOIN Courses ON Enrollments.Course_ID = Courses.Course_ID;


#right join 
SELECT Students.Name, Courses.Course_Name, Enrollments.Grade
FROM Students
RIGHT JOIN Enrollments ON Students.Student_ID = Enrollments.Student_ID
RIGHT JOIN Courses ON Enrollments.Course_ID = Courses.Course_ID;

