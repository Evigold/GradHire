

/*
Query 1:
Use three joins.

Computes inner joins of three tables to display all internships and jobs from INFOBLOX
*/
SELECT * 
	FROM JOBS AS J, INTERNSHIPS AS I, COMPANY AS C
		WHERE J.cid = C.id
          AND I.cid = C.id
          AND C.cname = "INFOBLOX";


/*
Query 2:

-- = ANY is the same as IN 
Nested query with use of ANY or ALL operator and GROUP BY clause     

Selects any job that has a startdate before June 1st 2019.

TODO: add more data to verify
*/
SELECT *
	FROM COMPANY AS C, JOBS AS J 
		WHERE J.id = ANY 
			(SELECT id	
				FROM JOBS 
					WHERE start_date < '2019-06-01')
                    GROUP BY cid;

-- Think this is a unique query, should populate with a bit of data that matches though...
-- Correlated nesty query


/*
Query 3:
A correlated nested query.

Selects all internships where pay is more than the lowest paying job and what company offers the internship.

*/
SELECT I.job_title AS Position, C.cname AS Company, I.salary AS Salary
	FROM INTERNSHIPS AS I , COMPANY AS C
		WHERE I.cid = C.id
		  AND salary > (SELECT MIN(salary)
						FROM JOBS);


/*
Query 4:
Uses a full join
mysql lacks support for a full join so a full join is emulated by the union of left and right joins.

Selects all job titles.
*/
SELECT I.job_title, J.job_title 
	FROM INTERNSHIPS AS I LEFT JOIN JOBS AS J ON I.cid = J.cid
		UNION
			SELECT I.job_title, J.job_title FROM INTERNSHIPS AS I RIGHT JOIN JOBS AS J ON I.cid = J.cid;

/*
Query 5:
Use nested queries with a set operation

Selects companies that offer jobs and internships starting after June 1st 2019.

TODO add companies with start dates all less than june 1st 2019 to verify.
*/

SELECT C.cname
	FROM COMPANY AS C, JOBS AS J
		WHERE C.id = J.cid
          AND J.start_date > '2019-06-01'
			UNION
				SELECT cname
					FROM COMPANY AS C, INTERNSHIPS AS I
						WHERE C.id = I.cid
                          AND I.start_date > '2019-06-01';


/*
Query 6:

Select all students that are graduating from a University of Washington Campus in after the start of year 2020
*/

SELECT S.student_name AS Student, U.school_name AS School
	FROM STUDENTS AS S, SCHOOLS AS U
		WHERE YEAR(S.grad_date) >= 2020
		  AND S.school_id = U.id
		  AND (U.school_name = 'University of Washington T'
			   OR U.school_name = 'University of Washington S');

		  

/*
Query 7:


*/


/*
Query 8:
*/

/*
Query 9:
*/


/*
Query 10:
*/


