# College-Management-System
This application is developed using java with maven help with clean ui/ux with backed implementation.


# features:
1.Admin and Student Access.

2.Preventing the direct Access of Web Pages.

3.Session Management.

4.Uploading Students Results.

5.Searching the Student Result using Roll number.

6.Delete and Update Student

# Author
<a href="https://github.com/Royal-Code-Master/">Royal-Code-Master</a>


# SQL Tables 

1. Database name Student

2. admins table

3. student table

4. results table

5. . messages table


# Admins Table
CREATE TABLE admins (
    id INT NOT NULL AUTO_INCREMENT,
    fullname VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    passwords VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
);

   
# student table
CREATE TABLE student (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    roll INT NOT NULL UNIQUE,
    fullname VARCHAR(30) NOT NULL,
    branch VARCHAR(15) NOT NULL,
    email VARCHAR(30)
);


# results table

CREATE TABLE results (
    roll INT NOT NULL,
    subject1 INT NOT NULL,
    subject2 INT NOT NULL,
    subject3 INT NOT NULL,
    total INT NOT NULL,
    status VARCHAR(10) NOT NULL,
    PRIMARY KEY (roll)
);

ALTER TABLE results
ADD CONSTRAINT fk_results_student
FOREIGN KEY (roll)
REFERENCES student(roll)
ON DELETE CASCADE;


# messages table

CREATE TABLE messages ( id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, user_email VARCHAR(30) NOT NULL, user_phone VARCHAR(12) NOT NULL, user_msg TEXT NOT NULL );

# Clone Project using Git CLI
gh repo clone Royal-Code-Master/College-Management-System


# Results of Project 

I want to show the project results using images.


# This is Home Page

![Screenshot 2023-09-08 110613](https://github.com/Royal-Code-Master/College-Management-System/assets/126596692/2c703508-5ac8-49e5-85c9-66a8dab2cbcf)



# Admin Pages

![Screenshot (84)](https://github.com/Royal-Code-Master/College-Management-System/assets/126596692/e7985622-54d8-45e3-a8b2-dc74745682bf)


![Screenshot (85)](https://github.com/Royal-Code-Master/College-Management-System/assets/126596692/5fd4eea7-dd97-4131-8da2-52994dd6b5b8)


![Screenshot (86)](https://github.com/Royal-Code-Master/College-Management-System/assets/126596692/19d9c8c7-2b62-45ab-ab8f-69bdfc80ee3d)


![Screenshot (87)](https://github.com/Royal-Code-Master/College-Management-System/assets/126596692/79ec5b44-cc2c-4dd0-990b-fe2ecf375bd9)


![Screenshot (88)](https://github.com/Royal-Code-Master/College-Management-System/assets/126596692/4a729ec3-aed9-4f81-8e1e-d457250be70e)


![Screenshot (89)](https://github.com/Royal-Code-Master/College-Management-System/assets/126596692/fe268150-f7ec-4c53-9190-2cb839e21795)


![Screenshot (92)](https://github.com/Royal-Code-Master/College-Management-System/assets/126596692/4d2a9b9e-ea1c-4444-81e2-dfc216c91c27)


# Student Pages

![Screenshot (90)](https://github.com/Royal-Code-Master/College-Management-System/assets/126596692/1b343998-6843-4a98-a350-747e5f7afc22)

![Screenshot (91)](https://github.com/Royal-Code-Master/College-Management-System/assets/126596692/04918088-6cac-4e4c-a701-5bcbd43bce99)


# Results Page

![Screenshot (93)](https://github.com/Royal-Code-Master/College-Management-System/assets/126596692/6e5b3483-148d-4e06-97a3-546a14824b65)


# messages page.

![Screenshot 2023-09-04 102831](https://github.com/Royal-Code-Master/College-Management-System/assets/126596692/a56b0454-ccb5-444c-a95b-f15bb8a3aff5)

![Screenshot (94)](https://github.com/Royal-Code-Master/College-Management-System/assets/126596692/8bd028d0-b5ec-4b2e-bf53-df88b2011e69)


