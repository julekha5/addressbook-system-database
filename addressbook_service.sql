show databases;
-- UC1--
create database addressbook_service;
use addressbook_service;

-- UC2--
CREATE TABLE addressBook (
		id int not null auto_increment primary key,
		firstname varchar(20) NOT NULL, 
        lastname varchar(20) NOT NULL,
        address varchar(100),
        city varchar(20) NOT NULL,
        state varchar(20) NOT NULL,
        zipcode integer(6),
        phonenumber varchar(10) NOT NULL UNIQUE,
        email varchar(20) NOT NULL UNIQUE,
        UNIQUE KEY name (firstname,lastname)
);
desc addressBook;

-- UC3--
INSERT INTO addressbook VALUES
(1,'Julekha','Mulani','Kothrud','Pune','Maharashtra','424112','1234567890', 'jul.m@gmail.com'),
(2,'Rohini','Patil','Deccan','Pune','Maharashtra','420166','9191919291', 'rohini.p@gmail.com'),
(3,'Divya','K','Andhra','Andhra Pradesh','AP','487879','4567890125', 'divya.k@yahoo.com'),
(4,'Neeta','M','Madhya Pradesh','Gwalior','MP','43342','6577567890', 'neeta.m@gmail.com');

SELECT * FROM addressbook;

-- UC4--
UPDATE addressbook SET firstname = 'Julekhaaa'
WHERE firstname = 'Julekha'; 

SELECT * from addressbook where firstname = 'Julekhaaa';
SELECT firstname from addressbook where firstname = 'Julekhaaa';

-- UC5---
DELETE from addressbook WHERE firstname = 'Julekhaaa';
SELECT * FROM addressbook WHERE firstname = 'Julekhaaa';

-- UC6--
SELECT * from addressbook where city = 'Pune' OR state = 'MP';

-- UC7---
SELECT  city, state, COUNT(*) from addressbook where city = 'Pune' AND state = 'Maharashtra';

-- UC8 ---
SELECT * FROM addressbook WHERE state = 'Maharashtra' ORDER BY firstname ASC;
SELECT * FROM addressbook WHERE state = 'Maharashtra' ORDER BY firstname DESC;

-- UC9 ---
ALTER  TABLE addressbook add ab_name varchar(20);
alter table addressbook add family_type char(3);

update addressbook set ab_name = 'AddressBook1' where id = 2;
update addressbook set ab_name = 'AddressBook2' where id = 1;
update addressbook set ab_name = 'AddressBook3' where id IN (3,4);

update addressbook set family_type = 'yes' where id = 1;
update addressbook set friends_type = 'yes' where id = 2;
update addressbook set profession_type = 'yes' where id IN(3,4);

-- UC10---  
SELECT family_type, friends_type, profession_type, COUNT(*) FROM addressbook GROUP BY family_type = 'yes', friends_type = 'yes', profession_type ='yes';

-- UC11---
update addressbook set friends_type = 'yes', family_type = 'yes' where id = 1;
