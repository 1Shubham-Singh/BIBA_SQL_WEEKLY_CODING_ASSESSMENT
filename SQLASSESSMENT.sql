CREATE DATABASE SQL_ASSESSMENT;

CREATE TABLE EMPLOYEESS(EMP_ID char(255),
						EMP_NAME VARCHAR(255),
						SALARY INT,
						DEPT_ID CHAR(20),
						MANAGER_ID CHAR(20));
INSERT INTO EMPLOYEESS(EMP_ID,EMP_NAME,SALARY,DEPT_ID,MANAGER_ID) 
VALUES ('E1','Rahul','15000','D1','M1'),
		('E2','Manoj','15000','D1','M1'),
		('E3','james','55000','D2','M2'),
		('E4','Michal','25000','D2','M2'),
		('E5','Ali','20000','D10','M3'),
		('E6','Robin','35000','D10','M3');

CREATE TABLE DEPARTMENT(DEPT_ID CHAR(20),DEPT_NAME CHAR(50));
INSERT INTO DEPARTMENT(DEPT_ID,DEPT_NAME)VALUES('D1','IT'),
												('D2','HR'),
												('D3','FINANCE'),
												('D4','ADMIN');
CREATE TABLE MANAGER(MANAGER_ID CHAR(20),MANAGER_NAME CHAR(50),DEPT_ID CHAR(20));
INSERT INTO MANAGER(MANAGER_ID,MANAGER_NAME,DEPT_ID)VALUES('M1','PREM','D3'),
														('M2','PREM','D4'),
														('M3','NICK','D1'),
														('M4','CORY','D1');

CREATE TABLE PROJECT(PROJECT_ID CHAR(20), PROJECT_NAME CHAR(100),TEAM_MEMBER_ID CHAR(20) );
INSERT INTO PROJECT(PROJECT_ID,PROJECT_NAME,TEAM_MEMBER_ID)VALUES('P1','DATA MIGRATION','E1'),
																('P1','DATA MIGRATION','E2'),
																('P1','DATA MIGRATION','M3'),
																('P2','ETL TOOL','E1'),
																('P1','ETL TOOL','M4');
SELECT * FROM EMPLOYEESS;
SELECT * FROM DEPARTMENT;
SELECT * FROM MANAGER;
SELECT * FROM PROJECT;
--1.Querying Data by Using Joins and Subqueries--
/*Fetch the employee name and the department name they belongs to*/
--INNER JOIN /JOIN--
SELECT E.EMP_NAME, D.DEPT_NAME
FROM EMPLOYEESS E  INNER JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID;
/*Fetch the ALL employee name and their department name they belongs to*/
--LEFT JOIN:-INNER JOIN + ANY ADDITIONAL RECORD FROM THE LEFT TABLE
SELECT E.EMP_NAME, D.DEPT_NAME
FROM EMPLOYEESS E LEFT JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID;
/*Fetch the  employee name and their ALL department name they belongs to*/
--RIGHT JOIN:-INNER JOIN + ANY ADDITINAL RECORD FROM THE RIGHT TABLE
SELECT E.EMP_NAME, D.DEPT_NAME
FROM EMPLOYEESS E RIGHT JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID;
--SUBQUERIES--
SELECT * FROM EMPLOYEESS
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEESS);
--2.Manipulate data by using sql  commands using groupby and having clause.
--This is all DML Commands
--SELECT,INSERT,DELETE AND UPDATE
--This all DDL Commands:
--1.CREATE,ALTER,TRUNCATE AND DROP

SELECT COUNT(EMP_ID),SALARY FROM EMPLOYEESS GROUP BY SALARY HAVING COUNT(EMP_ID)>1;


CREATE TABLE EMPLOYEESSSS(EMP_ID char(255),
						EMP_NAME VARCHAR(255),
						SALARY INT,
						DEPT_ID CHAR(20),
						MANAGER_ID CHAR(20));
INSERT INTO EMPLOYEESSSS(EMP_ID,EMP_NAME,SALARY,DEPT_ID,MANAGER_ID) 
VALUES ('E1','Rahul','15000','D1','M1'),
		('E2','Manoj','15000','D1','M1'),
		('E3','james','55000','D2','M2'),
		('E4','Michal','25000','D2','M2'),
		('E5','Ali','20000','D10','M3'),
		('E6','Robin','35000','D10','M3');
DELETE FROM EMPLOYEESSSS WHERE SALARY = 15000;
UPDATE EMPLOYEESSSS SET EMP_NAME = 'Shubham' where SALARY =55000;
ALTER TABLE EMPLOYEESSSS  ADD JOB_ID VARCHAR(255);
SELECT * FROM EMPLOYEESSSS;
TRUNCATE TABLE EMPLOYEESSSS;
DROP TABLE EMPLOYEESSSS;






