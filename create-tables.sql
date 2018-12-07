-- SCHOOLS Table Definition
CREATE TABLE SCHOOLS 
(
  id 		    INTEGER 	  NOT NULL IDENTITY(100,1),	-- Auto_increment if not specified
  school_name 	VARCHAR(32) NOT NULL,
  ranking 	INTEGER   	NOT NULL,					-- State Rank
  PRIMARY KEY (ID) 
);

-- STUDENTS Table Definition
CREATE TABLE STUDENTS (
  id    INTEGER 	  NOT NULL IDENTITY(1, 10),	-- Auto_increment if not specified
  school_id 	INTEGER 	  NOT NULL,
  student_name  VARCHAR(32) NOT NULL,
  grad_date	DATE		    NOT NULL,					-- Formatt YYYY-MM-DD
  past_exp 	INTEGER 	  NOT NULL DEFAULT 0 CHECK (past_exp >= 0),			-- # of years
  PRIMARY KEY(id),
  FOREIGN KEY (school_id) REFERENCES SCHOOLS (id) ON UPDATE CASCADE -- FOREIGN
);

-- COMPANY Table Definition
CREATE TABLE COMPANY (
  id 	  INTEGER 	  NOT NULL IDENTITY(300, 1),		-- Auto_increment if not specified
  cname VARCHAR(32) NOT NULL,
  PRIMARY KEY(ID)
);

-- JOBS Table Definition
CREATE TABLE JOBS (
  id 			    INTEGER 	  NOT NULL IDENTITY(1, 1),-- Auto_increment if not specified
  cid 			  INTEGER 	  NOT NULL,
  job_title 	VARCHAR(32) NOT NULL,		
  app_due_date 	DATE	      NOT NULL,					-- Format YYYY-MM-DD
  start_date		DATE	      NOT NULL,					-- Format YYYY-MM-DD
  past_exp		INTEGER 	  NOT NULL DEFAULT 0 CHECK (past_exp >= 0), -- 0 if not specified
  salary	 	    	REAL 	      NOT NULL CHECK (salary >= 0),
  PRIMARY KEY (id),
  FOREIGN KEY (cid) REFERENCES COMPANY (id) ON UPDATE CASCADE -- FOREIGN
);

-- INTERNSHIPS Table Definition
CREATE TABLE INTERNSHIPS(
  id			INTEGER		  NOT NULL IDENTITY(1, 1),-- Auto_increment if not specified
  cid			    INTEGER 	  NOT NULL,
  job_title		VARCHAR(32) NOT NULL,
  app_due_date	DATE		    NOT NULL,
  duration		INTEGER 	  NOT NULL,				-- Number of Months
  start_date		DATE 		    NOT NULL,
  past_exp		INTEGER 	  NOT NULL DEFAULT 0 CHECK (past_exp >= 0),
  salary			  REAL 		    NOT NULL DEFAULT 0 CHECK (salary >= 0), -- If not specified we can assume it is unpaid
  PRIMARY KEY (id),
  FOREIGN KEY (cid) REFERENCES COMPANY (id) ON UPDATE CASCADE -- FOREIGN
);