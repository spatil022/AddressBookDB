UC1: Ability to create a Address Book Service DB

mysql> create database Address_Book_Service;
Query OK, 1 row affected (0.30 sec)

mysql> show databases;
+----------------------+
| Database             |
+----------------------+
| address_book_service |
| information_schema   |
| invoicing            |
| mysql                |
| payroll_services     |
| performance_schema   |
| sakila               |
| sql_hr               |
| sql_inventory        |
| store                |
| sys                  |
| world                |
+----------------------+
12 rows in set (0.00 sec)

mysql> USE Address_Book_Service;
Database changed

UC2:Ability to create a Address Book Table with first and last names, address, city, state, zip, phone number and email as its attributes

mysql> create table addressBook
    -> (
    -> firstName VARCHAR(32) NOT NULL,
    -> lastName VARCHAR(32) NOT NULL,
    -> address VARCHAR(150) NOT NULL,
    -> city VARCHAR(32) NOT NULL,
    -> state VARCHAR(32) NOT NULL,
    -> zip INT unsigned NOT NULL,
    -> phoneNumber INT unsigned NOT NULL,
    -> email VARCHAR(150) NOT NULL,
    -> PRIMARY KEY (firstName)
    -> );
Query OK, 0 rows affected (1.79 sec)

mysql> Describe addressBook;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| firstName   | varchar(32)  | NO   | PRI | NULL    |       |
| lastName    | varchar(32)  | NO   |     | NULL    |       |
| address     | varchar(150) | NO   |     | NULL    |       |
| city        | varchar(32)  | NO   |     | NULL    |       |
| state       | varchar(32)  | NO   |     | NULL    |       |
| zip         | int unsigned | NO   |     | NULL    |       |
| phoneNumber | int unsigned | NO   |     | NULL    |       |
| email       | varchar(150) | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
8 rows in set (0.06 sec)


UC3: Ability to insert new Contacts to Address Book
mysql> insert into addressBook (firstName, lastName, address, city, state, zip, phoneNumber, email) VALUES
    -> ('Sneha', 'Khan', 'Dighi', 'Pune', 'MH', 570017, 676767, 'SK@gmail.com'),
    -> ('Raj', 'potu', 'Kher', 'Satar', 'MH', 879617, 877767, 'Rp@gmail.com'),
    -> ('Sravani', 'Katta', 'Manchiryal', 'Tn', 'Tn', 1230017, 124767, 'Spr@gmail.com');
Query OK, 3 rows affected (0.43 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from addressBook;
+-----------+----------+------------+-------+-------+---------+-------------+---------------+
| firstName | lastName | address    | city  | state | zip     | phoneNumber | email         |
+-----------+----------+------------+-------+-------+---------+-------------+---------------+
| Raj       | potu     | Kher       | Satar | MH    |  879617 |      877767 | Rp@gmail.com  |
| Sneha     | Khan     | Dighi      | Pune  | MH    |  570017 |      676767 | SK@gmail.com  |
| Sravani   | Katta    | Manchiryal | Tn    | Tn    | 1230017 |      124767 | Spr@gmail.com |
+-----------+----------+------------+-------+-------+---------+-------------+---------------+
3 rows in set (0.03 sec)

UC4: Ability to edit existing contact person using their name
mysql> update addressBook set city = 'Mumbai' where firstName = 'Sneha';
Query OK, 1 row affected (0.33 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from addressBook;
+-----------+----------+------------+--------+-------+---------+-------------+---------------+
| firstName | lastName | address    | city   | state | zip     | phoneNumber | email         |
+-----------+----------+------------+--------+-------+---------+-------------+---------------+
| Raj       | potu     | Kher       | Satar  | MH    |  879617 |      877767 | Rp@gmail.com  |
| Sneha     | Khan     | Dighi      | Mumbai | MH    |  570017 |      676767 | SK@gmail.com  |
| Sravani   | Katta    | Manchiryal | Tn     | Tn    | 1230017 |      124767 | Spr@gmail.com |
+-----------+----------+------------+--------+-------+---------+-------------+---------------+
3 rows in set (0.08 sec)


UC5:Ability to delete a person using person's name
mysql> delete from addressBook  where firstName = 'Raj';
Query OK, 1 row affected (0.12 sec)

mysql> select * from addressBook;
+-----------+----------+------------+--------+-------+---------+-------------+---------------+
| firstName | lastName | address    | city   | state | zip     | phoneNumber | email         |
+-----------+----------+------------+--------+-------+---------+-------------+---------------+
| Sneha     | Khan     | Dighi      | Mumbai | MH    |  570017 |      676767 | SK@gmail.com  |
| Sravani   | Katta    | Manchiryal | Tn     | Tn    | 1230017 |      124767 | Spr@gmail.com |
+-----------+----------+------------+--------+-------+---------+-------------+---------------+
2 rows in set (0.00 sec)


UC6: Ability to Retrieve Person belonging to a City or State from the Address Book
mysql> insert into addressBook (firstName, lastName, address, city, state, zip,phoneNumber, email) VALUES
    -> ('Raj', 'potu', 'Satar', 'Satar', 'MH', 879617, 877767, 'Rp@gmail.com');
Query OK, 1 row affected (0.14 sec)

mysql> select * from addressBook where city = 'Satar';
+-----------+----------+---------+-------+-------+--------+-------------+--------------+
| firstName | lastName | address | city  | state | zip    | phoneNumber | email        |
+-----------+----------+---------+-------+-------+--------+-------------+--------------+
| Raj       | potu     | Satar   | Satar | MH    | 879617 |      877767 | Rp@gmail.com |
+-----------+----------+---------+-------+-------+--------+-------------+--------------+
1 row in set (0.06 sec)


UC7:Ability to understand the count of address book by City and State
mysql> select city, Count(firstName) from addressBook group by city;
+--------+------------------+
| city   | Count(firstName) |
+--------+------------------+
| Satar  |                1 |
| Mumbai |                1 |
| Tn     |                1 |
+--------+------------------+
3 rows in set (0.00 sec)

UC8:Ability to retrieve entries sorted alphabetically by Person’s name for a given city
mysql> select * from addressBook where city = 'Mumbai' ORDER BY firstName ASC;
+-----------+----------+---------+--------+-------+--------+-------------+--------------+
| firstName | lastName | address | city   | state | zip    | phoneNumber | email        |
+-----------+----------+---------+--------+-------+--------+-------------+--------------+
| Sneha     | Khan     | Dighi   | Mumbai | MH    | 570017 |      676767 | SK@gmail.com |
+-----------+----------+---------+--------+-------+--------+-------------+--------------+
1 row in set (0.00 sec)
