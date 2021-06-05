CREATE DATABASE ASSIGNMENT1;
CREATE TABLE assignment1.WORKER(
WORKER_ID INT primary key ,
FIRST_NAME varchar(15) NOT NULL,
LAST_NAME varchar(15) NOT NULL,
SALARY INT NOT NULL,
JOINING_DATE datetime default current_timestamp
);

ALTER TABLE assignment1.worker add column DEPARTMENT_ID int NOT NULL;
insert into assignment1.worker(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID) values 
(2, 'Niharika', 'Verma', 80000, 2),
(3, 'Vishal', 'Singhal', 300000, 1),
(4, 'Amitabh', 'Singh', 500000, 2),
(5, 'Vivek', 'Bhati', 500000, 2),
(6, 'Vipul', 'Diwan', 200000, 3),
(7, 'Satish', 'Kumar', 75000, 3),
(8, 'Geetika', 'Chauhan', 90000, 2);


create table ASSIGNMENT1.DEPARTMENT(DEPARTMENT_ID INT PRIMARY KEY, DEPARTMENT_NAME VARCHAR(15) NOT NULL);
INSERT INTO ASSIGNMENT1.DEPARTMENT (DEPARTMENT_ID, DEPARTMENT_NAME) values 
(1, 'HR'),
(2, 'ADMIN'),
(3, 'ACCOUNT');
ALTER TABLE assignment1.WORKER ADD foreign key(DEPARTMENT_ID) references assignment1.department(DEPARTMENT_ID);

CREATE TABLE ASSIGNMENT1.BONUS(WORKER_REF_ID INT NOT NULL, BONUS_DATE datetime, BONUS_AMOUNT VARCHAR(15) NOT NULL);
INSERT INTO assignment1.BONUS (WORKER_REF_ID, BONUS_DATE, BONUS_AMOUNT) VALUES 
(1, '2016-02-20 00:00', 5000),
(2, '2016-06-11 00:00', 3000),
(3, '2016-02-20 00:00', 4000),
(1, '2016-02-20 00:00', 4500),
(2, '2016-06-11 00:00', 3500);
select bonus.WORKER_REF_ID, bonus.BONUS_DATE, bonus.BONUS_AMOUNT from assignment1.bonus;

create table ASSIGNMENT1.TITLE (WORKER_REF_ID INT NOT NULL, WORKER_TITLE varchar(15) NOT NULL, AFFECTED_FROM datetime default current_timestamp);
INSERT INTO assignment1.TITLE (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES 
(1, 'Manager', '2016-02-20 00:00'),
(2, 'Executive', '2016-06-11 00:00'),
(8, 'Executive', '2016-06-11 00:00'),
(5, 'Manager', '2016-06-11 00:00'),
(4, 'Asst. Manager', '2016-06-11 00:00'),
(7, 'Executive', '2016-06-11 00:00'),
(6, 'Lead', '2016-06-11 00:00'),
(3, 'Lead', '2016-02-20 00:00');

UPDATE 	assignment1.worker SET SALARY = (SALARY + 20000) WHERE FIRST_NAME = 'Satish' and LAST_NAME ='Kumar';
UPDATE 	assignment1.worker SET SALARY = (SALARY + 20000) WHERE FIRST_NAME = 'Geetika' and LAST_NAME ='Chauhan';

select worker.WORKER_ID,worker.FIRST_NAME,worker.LAST_NAME, worker.SALARY, worker.JOINING_DATE, worker.DEPARTMENT_ID from assignment1.worker;