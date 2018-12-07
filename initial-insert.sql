-- SCHOOLS Initial State
/*								NAME								RNK	*/
INSERT INTO SCHOOLS (school_name, ranking) VALUES('University of Washington T',		1	);
INSERT INTO SCHOOLS (school_name, ranking) VALUES(	'University of Washington S',		2	);
INSERT INTO SCHOOLS (school_name, ranking) VALUES(	'Western Washington University',	3	);			-- AUTO_INCREMENT
INSERT INTO SCHOOLS (school_name, ranking) VALUES(	'Seattle University',				5	);
INSERT INTO SCHOOLS (school_name, ranking) VALUES(	'University of Puget Sound',		6	);
INSERT INTO SCHOOLS (school_name, ranking) VALUES(	'Saint Martin''s University',		10	);
INSERT INTO SCHOOLS (school_name, ranking) VALUES(	'Pacific Lutheran University',		11	);
INSERT INTO SCHOOLS (school_name, ranking) VALUES(	'Pierce College',		12	);
INSERT INTO SCHOOLS (school_name, ranking) VALUES(	'Carnegie Mellon',		7	);
INSERT INTO SCHOOLS (school_name, ranking) VALUES(	'Harvard University',		8	);
INSERT INTO SCHOOLS (school_name, ranking) VALUES(	'MIT',		9	);


SET IDENTITY_INSERT students ON

-- STUDENTS Initial State
/*							ID		SID		NAME				GradDate	exp	*/
INSERT INTO STUDENTS(id, school_id, student_name, grad_date, past_exp)
	VALUES(1135,	100,	'John Smith', 		'2019-06-12',	DEFAULT	);
INSERT INTO STUDENTS(id, school_id, student_name, grad_date, past_exp)
	VALUES(1452,	100,	'Mary McDonald', 	'2020-03-27',	1	);
INSERT INTO STUDENTS(id, school_id, student_name, grad_date, past_exp)
	VALUES(1234,	102,	'David Brock', 		'2019-07-10', DEFAULT	);
INSERT INTO STUDENTS(id, school_id, student_name, grad_date, past_exp)
	VALUES(1004,	101,	'Anna Johnson', 	'2019-12-19', DEFAULT	);
INSERT INTO STUDENTS(id, school_id, student_name, grad_date, past_exp)
	VALUES(1034,	101,	'Lizz Kim', 		'2020-06-12',	1	);
INSERT INTO STUDENTS(id, school_id, student_name, grad_date, past_exp)
	VALUES(1113,	103,	'Daniel Martin', 	'2018-12-18',	2	);
INSERT INTO STUDENTS(id, school_id, student_name, grad_date, past_exp)
	VALUES(1244,	100,	'Matthew Chang', 	'2019-06-15',	1	);
INSERT INTO STUDENTS(id, school_id, student_name, grad_date, past_exp) 
	VALUES(1322,	104,	'Megan Harper', 	'2021-06-10', DEFAULT	);
INSERT INTO STUDENTS(id, school_id, student_name, grad_date, past_exp)
	VALUES(1232,	105,	'Clair Jacobson', 	'2020-07-5',	1	);
INSERT INTO STUDENTS(id, school_id, student_name, grad_date, past_exp)	
	VALUES(1531,	109,	'Donald Bailey', 	'2019-07-9', DEFAULT);
INSERT INTO STUDENTS(id, school_id, student_name, grad_date, past_exp)
	VALUES(1537,	110,	'Jerry Johnson', 	'2019-07-9', DEFAULT);

SET IDENTITY_INSERT students OFF

INSERT INTO STUDENTS (school_id, student_name, grad_date, past_exp) 
	VALUES (108, 'Odd Longfella', '2021-06-12', DEFAULT);
INSERT INTO STUDENTS (school_id, student_name, grad_date, past_exp)
	VALUES (107, 'Red Green', '2020-12-14', DEFAULT);
INSERT INTO STUDENTS (school_id, student_name, grad_date, past_exp) 
	VALUES (106, 'Rod Olsen', '2018-06-15', DEFAULT);
INSERT INTO STUDENTS (school_id, student_name, grad_date, past_exp)
	VALUES (100, 'Scott Robertson', '2019-06-14', DEFAULT);

SET IDENTITY_INSERT company ON
-- COMPANY Initial State
/*							ID	NAME		*/
INSERT INTO COMPANY(id, cname) VALUES(102,	'AMAZON'	);
INSERT INTO COMPANY(id, cname) VALUES(103,	'INFOBLOX'	);
INSERT INTO COMPANY(id, cname) VALUES(210,	'MICROSOFT'	);
INSERT INTO COMPANY(id, cname) VALUES(043,	'APPLE'		);
INSERT INTO COMPANY(id, cname) VALUES(019,	'IBM'		);
INSERT INTO COMPANY(id, cname) VALUES(134,	'T-MOBILE'	);
INSERT INTO COMPANY(id, cname) VALUES(135,	'VERIZON'	);
INSERT INTO COMPANY(id, cname) VALUES(136,	'FACEBOOK'	);
INSERT INTO COMPANY(id, cname) VALUES(137,	'TWITTER'	);
INSERT INTO COMPANY(id, cname) VALUES(138,	'GOOGLE'	);
INSERT INTO COMPANY(id, cname) VALUES(139,	'PAYPAL'	);
INSERT INTO COMPANY(id, cname) VALUES(140, 'PSE'		);

SET IDENTITY_INSERT company OFF

SET IDENTITY_INSERT jobs ON

-- JOBS Initial State
/*						ID		CID		Job Name					AppDueDate	StartDate	exp	pay		*/
INSERT INTO JOBS(id, cid, job_title, app_due_date, start_date, past_exp, salary) 
	VALUES(145,	102,	'AWS Data Analyst',	'2018-12-22',	'2019-07-20',	2,	110000	);
INSERT INTO JOBS(id, cid, job_title, app_due_date, start_date, past_exp, salary) 
	VALUES(156,	102,	'Software Developer',		'2019-05-01',	'2019-08-04',	1,	 80000	);
INSERT INTO JOBS(id, cid, job_title, app_due_date, start_date, past_exp, salary) 
	VALUES(176,	103,	'Product Tester', 			'2019-03-20',	'2019-07-15',	0,	 70000	);
INSERT INTO JOBS(id, cid, job_title, app_due_date, start_date, past_exp, salary) 
	VALUES(382,	043,	'ISA Engineer', 			'2019-06-12',	'2019-08-15',	1,	100000	);
INSERT INTO JOBS(id, cid, job_title, app_due_date, start_date, past_exp, salary) 
	VALUES(324,	043,	'Software Developer', 		'2019-06-12',	'2019-07-27',	0,	 90000	);
INSERT INTO JOBS(id, cid, job_title, app_due_date, start_date, past_exp, salary) 
	VALUES(427,	019,	'Watson AI Engineer', 		'2019-04-10',	'2019-07-16',	2,	130000	);
INSERT INTO JOBS(id, cid, job_title, app_due_date, start_date, past_exp, salary)
	VALUES(521,	134,	'Software Engineer', 		'2018-12-19',	'2019-04-22',	0,	 90000	);
INSERT INTO JOBS(id, cid, job_title, app_due_date, start_date, past_exp, salary) 
	VALUES(510,	134,	'Network Engineer', 		'2019-04-19',	'2019-06-28',	1,	105000	);
INSERT INTO JOBS(id, cid, job_title, app_due_date, start_date, past_exp, salary) 
	VALUES(511,	136,	'Web Development', 		'2019-04-19',	'2019-06-28',	1,	105000	);
INSERT INTO JOBS(id, cid, job_title, app_due_date, start_date, past_exp, salary) 
	VALUES(512,	138,	'Server Engineer', 		'2019-04-19',	'2019-06-28',	1,	105000	);
INSERT INTO JOBS(id, cid, job_title, app_due_date, start_date, past_exp, salary) 
	VALUES(513,	137,	'Software Developer', 		'2019-04-19',	'2019-06-28',	1,	105000	);
INSERT INTO JOBS(id, cid, job_title, app_due_date, start_date, past_exp, salary) 
	VALUES(514,	140,	'Underpaid DBadmin',	'2019-06-12',	'2019-09-05', 1, 45000);

SET IDENTITY_INSERT jobs OFF

SET IDENTITY_INSERT internships ON
-- INTERNSHIPS Initial State
/*								ID	CID		JobTitle					AppDueDate	L	StartDate	exp	pay	*/
INSERT INTO INTERNSHIPS(id, cid, job_title, app_due_date, duration, start_date, past_exp, salary)
	VALUES(112,	103,	'Software Developer',		'2018-12-22',	3,	'2019-07-20',	0,	15000);
INSERT INTO INTERNSHIPS(id, cid, job_title, app_due_date, duration, start_date, past_exp, salary)
	VALUES(134,	103,	'System Tester',			'2018-12-22',	3,	'2019-07-27',	1,	18000);
INSERT INTO INTERNSHIPS(id, cid, job_title, app_due_date, duration, start_date, past_exp, salary)
	VALUES(113,	019,	'Software Developer',		'2019-01-15',	4,	'2019-07-15',	1,	17000);
INSERT INTO INTERNSHIPS(id, cid, job_title, app_due_date, duration, start_date, past_exp, salary)
	VALUES(011,	134,	'User Experiance Designer',	'2019-01-22',	3,	'2019-07-11',	0,	14000);
INSERT INTO INTERNSHIPS(id, cid, job_title, app_due_date, duration, start_date, past_exp, salary)
	VALUES(034,	210,	'Software Developer',		'2019-01-12',	3,	'2019-07-20',	0,	15000);
INSERT INTO INTERNSHIPS(id, cid, job_title, app_due_date, duration, start_date, past_exp, salary)
	VALUES(035,	134,	'Software Engineer', 		'2018-12-19',	3, '2019-04-22',	0,	 90000	);
INSERT INTO INTERNSHIPS(id, cid, job_title, app_due_date, duration, start_date, past_exp, salary)
	VALUES(036,	134,	'Network Engineer', 		'2019-04-19',	6, '2019-06-28',	0,	105000	);
INSERT INTO INTERNSHIPS(id, cid, job_title, app_due_date, duration, start_date, past_exp, salary)
	VALUES(037,	136,	'Web Development', 		'2019-04-19',	4, '2019-06-28',	0,	105000	);
INSERT INTO INTERNSHIPS(id, cid, job_title, app_due_date, duration, start_date, past_exp, salary)
	VALUES(038,	138,	'Server Engineer', 		'2019-04-19',	9, '2019-06-28',	0,	105000	);
INSERT INTO INTERNSHIPS(id, cid, job_title, app_due_date, duration, start_date, past_exp, salary)
	VALUES(039,	137,	'Software Developer', 		'2019-04-19',	6, '2019-06-28',	0,	105000	);