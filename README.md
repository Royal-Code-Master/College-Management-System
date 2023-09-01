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
1. admins table

2. student table

3. results table

## Admins Table
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| id        | int         | NO   | PRI | NULL    | auto_increment |
| fullname  | varchar(30) | NO   |     | NULL    |                |
| email     | varchar(30) | NO   |     | NULL    |                |
| passwords | varchar(30) | NO   |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
   
## student table
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| id       | int         | NO   | PRI | NULL    | auto_increment |
| roll     | int         | NO   | UNI | NULL    |                |
| fullname | varchar(30) | NO   |     | NULL    |                |
| branch   | varchar(15) | NO   |     | NULL    |                |
| email    | varchar(30) | YES  |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+

## results table

+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| roll     | int         | NO   | MUL | NULL    |       |
| subject1 | int         | NO   |     | NULL    |       |
| subject2 | int         | NO   |     | NULL    |       |
| subject3 | int         | NO   |     | NULL    |       |
| total    | int         | NO   |     | NULL    |       |
| status   | varchar(10) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+


## Clone Project 



