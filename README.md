# College-Management-System
This application is developed using java with maven help with clean ui/ux with backed implementation.


# features:
1.Admin and Student Access.

2.Preventing the direct Access of Web Pages.

3.Session Management.

4.Uploading Students Results.

5.Searching the Student Result using Roll number.

# Author
<a href="https://github.com/Royal-Code-Master/">Royal-Code-Master</a>


# SQL Tables 

1. Database name Student

2. admins table

3. student table

4. results table


## Admins Table
CREATE TABLE admins (
    id INT NOT NULL AUTO_INCREMENT,
    fullname VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    passwords VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
);

   
## student table
CREATE TABLE student (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    roll INT NOT NULL UNIQUE,
    fullname VARCHAR(30) NOT NULL,
    branch VARCHAR(15) NOT NULL,
    email VARCHAR(30)
);


## results table

CREATE TABLE results (
    roll INT NOT NULL,
    subject1 INT NOT NULL,
    subject2 INT NOT NULL,
    subject3 INT NOT NULL,
    total INT NOT NULL,
    status VARCHAR(10) NOT NULL,
    PRIMARY KEY (roll)
);


## Clone Project 



