-- SQL Script for GradHire DB
-- Phase II
-- Eviatar Goldschmidt, Scott Robertson, Sam Stone

-- SCHOOLS Table Definition 
CREATE TABLE SCHOOLS 
(
  id 		    INTEGER 	  NOT NULL AUTO_INCREMENT,	-- Auto_increment if not specified
  school_name 	VARCHAR(32) NOT NULL,
  ranking 	INTEGER   	NOT NULL,					-- State Rank
  PRIMARY KEY (ID) 
);

-- STUDENTS Table Definition
CREATE TABLE STUDENTS (
  id    INTEGER 	  NOT NULL AUTO_INCREMENT,	-- Auto_increment if not specified
  school_id 	INTEGER 	  NOT NULL,
  student_name  VARCHAR(32) NOT NULL,
  grad_date	DATE		    NOT NULL,					-- Formatt YYYY-MM-DD
  past_exp 	INTEGER 	  NOT NULL DEFAULT 0 CHECK (PastExp >= 0),			-- # of years
  PRIMARY KEY(id),
  FOREIGN KEY (school_id) REFERENCES SCHOOLS (id) ON UPDATE CASCADE -- FOREIGN
);

-- COMPANY Table Definition
CREATE TABLE COMPANY (
  id 	  INTEGER 	  NOT NULL AUTO_INCREMENT,		-- Auto_increment if not specified
  cname VARCHAR(32) NOT NULL,
  PRIMARY KEY(ID)
);

-- JOBS Table Definition
CREATE TABLE JOBS (
  id 			    INTEGER 	  NOT NULL AUTO_INCREMENT,-- Auto_increment if not specified
  cid 			  INTEGER 	  NOT NULL,
  job_title 	VARCHAR(32) NOT NULL,		
  app_due_date 	DATE	      NOT NULL,					-- Format YYYY-MM-DD
  start_date		DATE	      NOT NULL,					-- Format YYYY-MM-DD
  past_exp		INTEGER 	  NOT NULL DEFAULT 0 CHECK (PastExp >= 0), -- 0 if not specified
  salary	 	    	REAL 	      NOT NULL CHECK (Pay >= 0),
  PRIMARY KEY (id),
  FOREIGN KEY (cid) REFERENCES COMPANY (id) ON UPDATE CASCADE -- FOREIGN
);

-- INTERNSHIPS Table Definition
CREATE TABLE INTERNSHIPS(
  id			INTEGER		  NOT NULL AUTO_INCREMENT,-- Auto_increment if not specified
  cid			    INTEGER 	  NOT NULL,
  job_title		VARCHAR(32) NOT NULL,
  app_due_date	DATE		    NOT NULL,
  duration		INTEGER 	  NOT NULL,				-- Number of Months
  start_date		DATE 		    NOT NULL,
  past_exp		INTEGER 	  NOT NULL DEFAULT 0 CHECK (PastExp >= 0),
  salary			  REAL 		    NOT NULL DEFAULT 0 CHECK (Pay >= 0), -- If not specified we can assume it is unpaid
  PRIMARY KEY (id),
  FOREIGN KEY (cid) REFERENCES COMPANY (id) ON UPDATE CASCADE -- FOREIGN
);

ALTER TABLE SCHOOLS AUTO_INCREMENT = 100;


-- SCHOOLS Initial State
/*								NAME								RNK	*/
INSERT INTO SCHOOLS (school_name, ranking) VALUES('University of Washington T',		1	);
INSERT INTO SCHOOLS (school_name, ranking) VALUES(	'University of Washington S',		2	);
INSERT INTO SCHOOLS (school_name, ranking) VALUES(	'Western Washington University',	3	);			-- AUTO_INCREMENT
INSERT INTO SCHOOLS (school_name, ranking) VALUES(	'Seattle University',				5	);
INSERT INTO SCHOOLS (school_name, ranking) VALUES(	'University of Puget Sound',		6	);
INSERT INTO SCHOOLS (school_name, ranking) VALUES(	"Saint Martin's University",		10	);
INSERT INTO SCHOOLS (school_name, ranking) VALUES(	"Pacific Lutheran University",		11	);
INSERT INTO SCHOOLS (school_name, ranking) VALUES(	"Pierce College",		12	);
INSERT INTO SCHOOLS (school_name, ranking) VALUES(	"Carnegie Mellon",		7	);
INSERT INTO SCHOOLS (school_name, ranking) VALUES(	"Harvard University",		8	);
INSERT INTO SCHOOLS (school_name, ranking) VALUES(	"MIT",		9	);

-- STUDENTS Initial State
/*							ID		SID		NAME				GradDate	exp	*/
INSERT INTO STUDENTS VALUES(1135,	100,	'John Smith', 		'2019-06-12',	DEFAULT	);
INSERT INTO STUDENTS VALUES(1452,	100,	'Mary McDonald', 	'2020-03-27',	1	);
INSERT INTO STUDENTS VALUES(1234,	102,	'David Brock', 		'2019-07-10', DEFAULT	);
INSERT INTO STUDENTS VALUES(1004,	101,	'Anna Johnson', 	'2019-12-19', DEFAULT	);
INSERT INTO STUDENTS VALUES(1034,	101,	'Lizz Kim', 		'2020-06-12',	1	);
INSERT INTO STUDENTS VALUES(1113,	103,	'Daniel Martin', 	'2018-12-18',	2	);
INSERT INTO STUDENTS VALUES(1244,	100,	'Matthew Chang', 	'2019-06-15',	1	);
INSERT INTO STUDENTS VALUES(1322,	104,	'Megan Harper', 	'2021-06-10', DEFAULT	);
INSERT INTO STUDENTS VALUES(1232,	105,	'Clair Jacobson', 	'2020-07-5',	1	);
INSERT INTO STUDENTS VALUES(1531,	109,	'Donald Bailey', 	'2019-07-9', DEFAULT);
INSERT INTO STUDENTS VALUES(1537,	110,	'Jerry Johnson', 	'2019-07-9', DEFAULT);
INSERT INTO STUDENTS (school_id, student_name, grad_date, past_exp) VALUES (108, 'Odd Longfella', '2021-06-12', DEFAULT);
INSERT INTO STUDENTS (school_id, student_name, grad_date, past_exp) VALUES (107, 'Red Green', '2020-12-14', DEFAULT);
INSERT INTO STUDENTS (school_id, student_name, grad_date, past_exp) VALUES (106, 'Rod Olsen', '2018-06-15', DEFAULT);
INSERT INTO STUDENTS (school_id, student_name, grad_date, past_exp) VALUES (100, 'Scott Robertson', '2019-06-14', DEFAULT);


-- COMPANY Initial State
/*							ID	NAME		*/
INSERT INTO COMPANY VALUES(102,	'AMAZON'	);
INSERT INTO COMPANY VALUES(103,	'INFOBLOX'	);
INSERT INTO COMPANY VALUES(210,	'MICROSOFT'	);
INSERT INTO COMPANY VALUES(043,	'APPLE'		);
INSERT INTO COMPANY VALUES(019,	'IBM'		);
INSERT INTO COMPANY VALUES(134,	'T-MOBILE'	);
INSERT INTO COMPANY VALUES(135,	'VERIZON'	);
INSERT INTO COMPANY VALUES(136,	'FACEBOOK'	);
INSERT INTO COMPANY VALUES(137,	'TWITTER'	);
INSERT INTO COMPANY VALUES(138,	'GOOGLE'	);
INSERT INTO COMPANY VALUES(139,	'PAYPAL'	);
INSERT INTO COMPANY VALUES(140, 'PSE'		);

-- JOBS Initial State
/*						ID		CID		Job Name					AppDueDate	StartDate	exp	pay		*/
INSERT INTO JOBS VALUES(145,	102,	'AWS Data Analyst',	'2018-12-22',	'2019-07-20',	2,	110000	);
INSERT INTO JOBS VALUES(156,	102,	'Software Developer',		'2019-05-01',	'2019-08-04',	1,	 80000	);
INSERT INTO JOBS VALUES(176,	103,	'Product Tester', 			'2019-03-20',	'2019-07-15',	0,	 70000	);
INSERT INTO JOBS VALUES(382,	043,	'ISA Engineer', 			'2019-06-12',	'2019-08-15',	1,	100000	);
INSERT INTO JOBS VALUES(324,	043,	'Software Delevolper', 		'2019-06-12',	'2019-07-27',	0,	 90000	);
INSERT INTO JOBS VALUES(427,	019,	'Watson AI Engineer', 		'2019-04-10',	'2019-07-16',	2,	130000	);
INSERT INTO JOBS VALUES(521,	134,	'Software Engineer', 		'2018-12-19',	'2019-04-22',	0,	 90000	);
INSERT INTO JOBS VALUES(510,	134,	'Network Engineer', 		'2019-04-19',	'2019-06-28',	1,	105000	);
INSERT INTO JOBS VALUES(511,	136,	'Web Development', 		'2019-04-19',	'2019-06-28',	1,	105000	);
INSERT INTO JOBS VALUES(512,	138,	'Server Engineer', 		'2019-04-19',	'2019-06-28',	1,	105000	);
INSERT INTO JOBS VALUES(513,	137,	'Software Developer', 		'2019-04-19',	'2019-06-28',	1,	105000	);
INSERT INTO JOBS VALUES(514,	140,	'Underpaid DBadmin',	'2019-06-12',	'2019-09-05', 1, 45000);

-- INTERNSHIPS Initial State
/*								ID	CID		JobTitle					AppDueDate	L	StartDate	exp	pay	*/
INSERT INTO INTERNSHIPS VALUES(112,	103,	'Software Developer',		'2018-12-22',	3,	'2019-07-20',	0,	15000);
INSERT INTO INTERNSHIPS VALUES(134,	103,	'System Tester',			'2018-12-22',	3,	'2019-07-27',	1,	18000);
INSERT INTO INTERNSHIPS VALUES(113,	019,	'Software Developer',		'2019-01-15',	4,	'2019-07-15',	1,	17000);
INSERT INTO INTERNSHIPS VALUES(011,	134,	'User Experiance Designer',	'2019-01-22',	3,	'2019-07-11',	0,	14000);
INSERT INTO INTERNSHIPS VALUES(034,	210,	'Software Developer',		'2019-01-12',	3,	'2019-07-20',	0,	15000);
INSERT INTO INTERNSHIPS VALUES(035,	134,	'Software Engineer', 		'2018-12-19',	3, '2019-04-22',	0,	 90000	);
INSERT INTO INTERNSHIPS VALUES(036,	134,	'Network Engineer', 		'2019-04-19',	6, '2019-06-28',	0,	105000	);
INSERT INTO INTERNSHIPS VALUES(037,	136,	'Web Development', 		'2019-04-19',	4, '2019-06-28',	0,	105000	);
INSERT INTO INTERNSHIPS VALUES(038,	138,	'Server Engineer', 		'2019-04-19',	9, '2019-06-28',	0,	105000	);
INSERT INTO INTERNSHIPS VALUES(039,	137,	'Software Developer', 		'2019-04-19',	6, '2019-06-28',	0,	105000	);

