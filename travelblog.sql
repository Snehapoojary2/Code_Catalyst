
Setting environment for using XAMPP for Windows.
Somashekhara@SNEHA c:\snehaxamp
# mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.28-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| dbtest             |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| sneha              |
| test               |
| travel             |
| travel1            |
+--------------------+
9 rows in set (0.001 sec)

MariaDB [(none)]> use sneha;
Database changed
MariaDB [sneha]> CREATE TABLE Users (user_id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(100),email VARCHAR(255) UNIQUE,password_hash VARCHAR(255));
Query OK, 0 rows affected (0.030 sec)

MariaDB [sneha]> desc Users;
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| user_id       | int(11)      | NO   | PRI | NULL    | auto_increment |
| name          | varchar(100) | YES  |     | NULL    |
       |
| email         | varchar(255) | YES  | UNI | NULL    |
       |
| password_hash | varchar(255) | YES  |     | NULL    |
       |
+---------------+--------------+------+-----+---------+----------------+
4 rows in set (0.016 sec)

MariaDB [sneha]> CREATE TABLE Destinations (destination_id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(255),country VARCHAR(100), description TEXT, image_url VARCHAR(255));
Query OK, 0 rows affected (0.014 sec)

MariaDB [sneha]> desc Destinations;
+----------------+--------------+------+-----+---------+----------------+
| Field          | Type         | Null | Key | Default | Extra          |
+----------------+--------------+------+-----+---------+----------------+
| destination_id | int(11)      | NO   | PRI | NULL    | auto_increment |
| name           | varchar(255) | YES  |     | NULL    |                |
| country        | varchar(100) | YES  |     | NULL    |                |
| description    | text         | YES  |     | NULL    |                |
| image_url      | varchar(255) | YES  |     | NULL    |                |
+----------------+--------------+------+-----+---------+----------------+
5 rows in set (0.016 sec)

MariaDB [sneha]> CREATE TABLE Travel_Plans (plan_id INT PRIMARY KEY AUTO_INCREMENT,user_id INT,destination_id INT,start_date DATE,end_date DATE,notes TEXT,FOREIGN KEY (user_id) REFERENCES Users(user_id),FOREIGN KEY (destination_id) REFERENCES Destinations(destination_id));
Query OK, 0 rows affected (0.018 sec)

MariaDB [sneha]> desc Travel_Plans;
+----------------+---------+------+-----+---------+----------------+
| Field          | Type    | Null | Key | Default | Extra          |
+----------------+---------+------+-----+---------+----------------+
| plan_id        | int(11) | NO   | PRI | NULL    | auto_increment |
| user_id        | int(11) | YES  | MUL | NULL    |
   |
| destination_id | int(11) | YES  | MUL | NULL    |
   |
| start_date     | date    | YES  |     | NULL    |
   |
| end_date       | date    | YES  |     | NULL    |
   |
| notes          | text    | YES  |     | NULL    |
   |
+----------------+---------+------+-----+---------+----------------+
6 rows in set (0.018 sec)

MariaDB [sneha]> CREATE TABLE Blogs (blog_id INT PRIMARY KEY AUTO_INCREMENT,user_id INT,title VARCHAR(255),content TEXT,FOREIGN KEY (user_id) REFERENCES Users(user_id));
Query OK, 0 rows affected (0.018 sec)

MariaDB [sneha]> desc Blogs;
+---------+--------------+------+-----+---------+----------------+
| Field   | Type         | Null | Key | Default | Extra
 |
+---------+--------------+------+-----+---------+----------------+
| blog_id | int(11)      | NO   | PRI | NULL    | auto_increment |
| user_id | int(11)      | YES  | MUL | NULL    |
 |
| title   | varchar(255) | YES  |     | NULL    |
 |
| content | text         | YES  |     | NULL    |
 |
+---------+--------------+------+-----+---------+----------------+
4 rows in set (0.011 sec)

MariaDB [sneha]> CREATE TABLE Reviews (review_id INT PRIMARY KEY AUTO_INCREMENT,user_id INT,destination_id INT,rating INT CHECK (rating BETWEEN 1 AND 5),comment TEXT,FOREIGN KEY (user_id) REFERENCES Users(user_id),FOREIGN KEY (destination_id) REFERENCES Destinations(destination_id));
Query OK, 0 rows affected (0.019 sec)

MariaDB [sneha]> desc Reviews;
+----------------+---------+------+-----+---------+----------------+
| Field          | Type    | Null | Key | Default | Extra          |
+----------------+---------+------+-----+---------+----------------+
| review_id      | int(11) | NO   | PRI | NULL    | auto_increment |
| user_id        | int(11) | YES  | MUL | NULL    |
   |
| destination_id | int(11) | YES  | MUL | NULL    |
   |
| rating         | int(11) | YES  |     | NULL    |
   |
| comment        | text    | YES  |     | NULL    |
   |
+----------------+---------+------+-----+---------+----------------+
5 rows in set (0.015 sec)

MariaDB [sneha]> CREATE TABLE Bookings (booking_id INT PRIMARY KEY AUTO_INCREMENT,category varchar(10),title varchar(200),Description TEXT,price_range int,location varchar(100));
Query OK, 0 rows affected (0.009 sec)

MariaDB [sneha]> desc Bookings;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| booking_id  | int(11)      | NO   | PRI | NULL    | auto_increment |
| category    | varchar(10)  | YES  |     | NULL    |                |
| title       | varchar(200) | YES  |     | NULL    |                |
| Description | text         | YES  |     | NULL    |                |
| price_range | int(11)      | YES  |     | NULL    |                |
| location    | varchar(100) | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
6 rows in set (0.016 sec)

MariaDB [sneha]> desc Users;
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| user_id       | int(11)      | NO   | PRI | NULL    | auto_increment |
| name          | varchar(100) | YES  |     | NULL    |                |
| email         | varchar(255) | YES  | UNI | NULL    |                |
| password_hash | varchar(255) | YES  |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+
4 rows in set (0.012 sec)

MariaDB [sneha]> desc Destinations;
+----------------+--------------+------+-----+---------+----------------+
| Field          | Type         | Null | Key | Default | Extra          |
+----------------+--------------+------+-----+---------+----------------+
| destination_id | int(11)      | NO   | PRI | NULL    | auto_increment |
| name           | varchar(255) | YES  |     | NULL    |                |
| country        | varchar(100) | YES  |     | NULL    |                |
| description    | text         | YES  |     | NULL    |                |
| image_url      | varchar(255) | YES  |     | NULL    |                |
+----------------+--------------+------+-----+---------+----------------+
5 rows in set (0.016 sec)

MariaDB [sneha]> desc Travel_Plans;
+----------------+---------+------+-----+---------+----------------+
| Field          | Type    | Null | Key | Default | Extra          |
+----------------+---------+------+-----+---------+----------------+
| plan_id        | int(11) | NO   | PRI | NULL    | auto_increment |
| user_id        | int(11) | YES  | MUL | NULL    |                |
| destination_id | int(11) | YES  | MUL | NULL    |                |
| start_date     | date    | YES  |     | NULL    |                |
| end_date       | date    | YES  |     | NULL    |                |
| notes          | text    | YES  |     | NULL    |                |
+----------------+---------+------+-----+---------+----------------+
6 rows in set (0.017 sec)

MariaDB [sneha]> desc Blogs;
+---------+--------------+------+-----+---------+----------------+
| Field   | Type         | Null | Key | Default | Extra          |
+---------+--------------+------+-----+---------+----------------+
| blog_id | int(11)      | NO   | PRI | NULL    | auto_increment |
| user_id | int(11)      | YES  | MUL | NULL    |                |
| title   | varchar(255) | YES  |     | NULL    |                |
| content | text         | YES  |     | NULL    |                |
+---------+--------------+------+-----+---------+----------------+
4 rows in set (0.020 sec)

MariaDB [sneha]> Desc Reviews;
+----------------+---------+------+-----+---------+----------------+
| Field          | Type    | Null | Key | Default | Extra          |
+----------------+---------+------+-----+---------+----------------+
| review_id      | int(11) | NO   | PRI | NULL    | auto_increment |
| user_id        | int(11) | YES  | MUL | NULL    |                |
| destination_id | int(11) | YES  | MUL | NULL    |                |
| rating         | int(11) | YES  |     | NULL    |                |
| comment        | text    | YES  |     | NULL    |                |
+----------------+---------+------+-----+---------+----------------+
5 rows in set (0.017 sec)

MariaDB [sneha]> Desc Bookings;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| booking_id  | int(11)      | NO   | PRI | NULL    | auto_increment |
| category    | varchar(10)  | YES  |     | NULL    |                |
| title       | varchar(200) | YES  |     | NULL    |                |
| Description | text         | YES  |     | NULL    |                |
| price_range | int(11)      | YES  |     | NULL    |                |
| location    | varchar(100) | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
6 rows in set (0.011 sec)

MariaDB [sneha]> INSERT INTO Users (name, email, password_hash)
    -> VALUES
    -> ('Alice Johnson', 'alice@example.com', 'hashedpassword1'),
    -> ('Bob Smith', 'bob@example.com', 'hashedpassword2');
Query OK, 2 rows affected (0.007 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [sneha]> select *from Users;
+---------+---------------+-------------------+-----------------+
| user_id | name          | email             | password_hash   |
+---------+---------------+-------------------+-----------------+
|       1 | Alice Johnson | alice@example.com | hashedpassword1 |
|       2 | Bob Smith     | bob@example.com   | hashedpassword2 |
+---------+---------------+-------------------+-----------------+
2 rows in set (0.002 sec)


MariaDB [sneha]> INSERT INTO Destinations (name, country, description, image_url)
    -> VALUES
    -> ('Eiffel Tower', 'France', 'A famous landmark in Paris, known for its stunning architecture and breathtaking views.', 'eiffeltower.jpg'),
    -> ('Great Wall of China', 'China', 'An ancient wall stretching across northern China, built for defense and now a popular tourist attraction.', 'greatwall.jpg');
Query OK, 2 rows affected (0.004 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [sneha]> select *from Destinations;
+----------------+---------------------+---------+-----------------------------------------------------------------------------------------------------------+-----------------+
| destination_id | name                | country | description
                        | image_url       |
+----------------+---------------------+---------+-----------------------------------------------------------------------------------------------------------+-----------------+
|              1 | Eiffel Tower        | France  | A famous landmark in Paris, known for its stunning architecture and breathtaking views.                   | eiffeltower.jpg |
|              2 | Great Wall of China | China   | An ancient wall stretching across northern China, built for defense and now a popular tourist attraction. | greatwall.jpg   |
+----------------+---------------------+---------+-----------------------------------------------------------------------------------------------------------+-----------------+
2 rows in set (0.001 sec)

MariaDB [sneha]> INSERT INTO Travel_Plans (user_id, destination_id, start_date, end_date, notes)
    -> VALUES
    -> (1, 1, '2025-06-10', '2025-06-15', 'Exploring Paris and visiting the Eiffel Tower.'),
    -> (2, 2, '2025-09-05', '2025-09-12', 'Hiking along the Great Wall and experiencing Chinese culture.');
Query OK, 2 rows affected (0.005 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [sneha]> select *from Travel_Plans;
+---------+---------+----------------+------------+------------+---------------------------------------------------------------+
| plan_id | user_id | destination_id | start_date | end_date   | notes                                                         |
+---------+---------+----------------+------------+------------+---------------------------------------------------------------+
|       1 |       1 |              1 | 2025-06-10 | 2025-06-15 | Exploring Paris and visiting the Eiffel Tower.                |
|       2 |       2 |              2 | 2025-09-05 | 2025-09-12 | Hiking along the Great Wall and experiencing Chinese culture. |
+---------+---------+----------------+------------+------------+---------------------------------------------------------------+
2 rows in set (0.001 sec)

MariaDB [sneha]> INSERT INTO Blogs (user_id, title, content)
    -> VALUES
    -> (1, 'My Paris Adventure', 'I had an amazing time exploring the Eiffel Tower and the beautiful streets of Paris.'),
    -> (2, 'Walking the Great Wall', 'The Great Wall of China was a breathtaking experience. The history and scenery');
Query OK, 2 rows affected (0.003 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [sneha]> select *from Blogs;
+---------+---------+------------------------+--------------------------------------------------------------------------------------+
| blog_id | user_id | title                  | content                                                                              |
+---------+---------+------------------------+--------------------------------------------------------------------------------------+
|       1 |       1 | My Paris Adventure     | I had an amazing time exploring the Eiffel Tower and the beautiful streets of Paris. |
|       2 |       2 | Walking the Great Wall | The Great Wall of China was a breathtaking experience. The history and scenery       |
+---------+---------+------------------------+--------------------------------------------------------------------------------------+
2 rows in set (0.001 sec)

MariaDB [sneha]> INSERT INTO Reviews (user_id, destination_id, rating, comment)
    -> VALUES
    -> (1, 1, 5, 'The Eiffel Tower was absolutely stunning! A must-visit in Paris.'),
    -> (2, 2, 4, 'The Great Wall of China was an incredible experience, though some sections were crowded.');
Query OK, 2 rows affected (0.003 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [sneha]> select *from Reviews;
+-----------+---------+----------------+--------+------------------------------------------------------------------------------------------+
| review_id | user_id | destination_id | rating | comment
      |
+-----------+---------+----------------+--------+------------------------------------------------------------------------------------------+
|         1 |       1 |              1 |      5 | The Eiffel Tower was absolutely stunning! A must-visit in Paris.
      |
|         2 |       2 |              2 |      4 | The Great Wall of China was an incredible experience, though some sections were crowded. |
+-----------+---------+----------------+--------+------------------------------------------------------------------------------------------+
2 rows in set (0.001 sec)




