

/*
Query 1:
Use three joins.

Computes inner joins of three tables to display all internships and jobs form INFOBLOX
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
					WHERE startdate < '2019-06-01')
                    GROUP BY cid;

-- Think this is a unique query, should populate with a bit of data that matches though...
-- Correlated nesty query


/*
Query 3:
A correlated nested query.

Selects all internships where pay is more than the lowest paying job.

TODO: add data to verify this query
*/
SELECT * 
	FROM INTERNSHIPS
		WHERE pay > (SELECT MIN(pay)
						FROM JOBS);

-- Uses a full join
-- 

/*
Query 4:
Uses a full join
mysql lacks support for a full join so a full join is emulated by the union of left and right joins.

Selects all job titles.
*/
SELECT I.jobtitle, J.jname 
	FROM INTERNSHIPS AS I LEFT JOIN JOBS AS J ON I.cid = J.cid
		UNION
			SELECT I.jobtitle, J.jname FROM INTERNSHIPS AS I RIGHT JOIN JOBS AS J ON I.cid = J.cid;

/*
Query 5:
Use nested queries with a set operation

Selects copanies that offer jobs and internships starting after June 1st 2019.
*/

SELECT C.cname
	FROM COMPANY AS C, JOBS AS J
		WHERE C.id = J.cid
          AND J.startdate > '2019-06-01'
			UNION
				SELECT cname
					FROM COMPANY AS C, INTERNSHIPS AS I
						WHERE C.id = I.cid
                          AND I.startdate > '2019-06-01'


/*
Query 6:
*/

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


