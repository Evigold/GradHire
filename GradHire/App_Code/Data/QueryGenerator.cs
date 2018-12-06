using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/**
 * Class to handle generating queries from user input.
 */
public class QueryGenerator {

    private DBHandler handler;

    private bool companyFlag = false;
    private bool jobFlag = false;
    private bool internFlag = false;

    //False if searching jobs, true if internships
    private bool isJob = false;
    private bool displayAll = false;

    private bool filterFlag = false;

    private string internKeyword = null;
    private string jobKeyword = null;
    private string companyKeyword = null;
    private string filterClause = "";
    private const string internTable = "internships AS i";
    private const string jobsTable = "jobs AS j";
    private const string companyTable = "company AS c";
    private const string companyTableJoin = "AND c.id = cid";

    /**
     * Empty class constructor
     */
    public QueryGenerator() {
        handler = new DBHandler();
    }

    //class properties
    //Job, Company, and Intern flags are true if keywords entered
    public string FilterClause { get => filterClause; set => filterClause = value; }
    public bool FilterFlag { get => filterFlag; set => filterFlag = value; }
    public bool DisplayAll { get => displayAll; set => displayAll = value; }

    /**
     * 
     */
    public void parseSearch(string search, bool isJob)
    {
        if (!string.IsNullOrEmpty(search))
        {

            displayAll = false;

            //Keywords for query
            string jobTitle = null;
            string internTitle = null;
            string companyTitle = null;


            List<string> words = search.Split(' ').ToList<string>();
            List<string> companies = handler.getKeywords("cname", "company");

            //Determine if a company name is in the search. Can switch back to string[]
            //TODO Only works for companies w/o space in title... 
            foreach (string word in words)
            {
                string str = word.ToLower();
                if (companies.Contains(str))
                {
                    if (string.Equals(companyTitle, null))
                    {
                        companyTitle = str;
                        companyFlag = true;
                    }
                    else
                    {
                        companyTitle += str;
                    }
                }
                companyKeyword = companyTitle;
            }

            //User wants to find a job, determine if keywords exist in jobs table.
            if (isJob)
            {
                List<string> jobs = handler.getKeywords("job_title", "jobs");
                foreach (string word in words)
                {
                    string str = word.ToLower();
                    if (jobs.Contains(str))
                    {
                        if (string.Equals(jobTitle, null))
                        {
                            jobTitle = str;
                            jobFlag = true;
                        }
                        else
                        {
                            jobTitle += " " + str;
                        }
                    }
                }
                jobKeyword = jobTitle;
            }
            else
            { //internships selected, determien if keywords exist in internships table.
                isJob = false;
                List<string> internships = handler.getKeywords("job_title", "internships");
                foreach (string word in words)
                {
                    string str = word.ToLower();
                    if (internships.Contains(str))
                    {
                        if (string.Equals(internTitle, null))
                        {
                            internTitle = str;
                            internFlag = true;
                        }
                        else
                        {
                            internTitle += " " + str;
                        }
                    }
                }
                internKeyword = internTitle;
            }

        }
        else
        {
            //No input in textbox. Display all jobs or internships
            displayAll = true;
        }
    }


    /**
     * Generates a search query off flags set by user inputed keywords. 
     */
    public string generate() {

        //Query to be built and returned
        string sqlQuery;
        string startQuery = "SELECT job_title AS Title, cname AS Company, CONVERT(varchar(10), start_date, 101) AS 'Start Date'," +
            "past_exp AS 'Experience Required (years)', salary AS Salary FROM ";

        //Branch to generate query off of flags.
        if (internFlag && companyFlag) {
            sqlQuery = startQuery + internTable + ", " + companyTable + " WHERE i.job_title LIKE \'%" + (InternKeyword + "%\' ") +
                "AND c.cname LIKE \'%" + (companyKeyword + "%\' ") + companyTableJoin;
        } else if (jobFlag && companyFlag) {
            sqlQuery = startQuery + jobsTable + ", " + companyTable + " WHERE j.job_title LIKE \'%" + (JobKeyword + "%\' ") +
                "AND c.cname LIKE \'%" + (companyKeyword + "%\' ") + companyTableJoin;
        } else if (internFlag) {
            sqlQuery = startQuery + internTable + ", " + companyTable + " WHERE i.job_title LIKE \'%" + (InternKeyword + "%\' ") + companyTableJoin;
        } else if (jobFlag) {
            sqlQuery = startQuery + jobsTable + ", " + companyTable + " WHERE j.job_title LIKE \'%" + (JobKeyword + "%\' ") + companyTableJoin;
        } else if (companyFlag) { //Only a company name has been searched
            if (isJob) { //searching for jobs by a company
                sqlQuery = startQuery + companyTable + ",  " + jobsTable + " WHERE c.cname LIKE \'%" + (companyKeyword + "%\' ") + companyTableJoin;
            } else { //searching for internships by a company
                sqlQuery = startQuery + companyTable + ",  " + internTable + " WHERE c.cname LIKE \'%" + (companyKeyword + "%\' ") + companyTableJoin;
            }
        } else { //No keywords found, display all rows if no search provided.
            if (displayAll) {
                if (isJob) {
                    sqlQuery = startQuery + companyTable + ",  " + jobsTable + " WHERE c.id = cid";
                } else {
                    sqlQuery = startQuery + companyTable + ",  " + internTable + " WHERE c.id = cid";
                }
            } else { //Nothing in database matches search terms, return null string 
                sqlQuery = null;
            }

        }

        if (filterFlag) {
            sqlQuery += FilterClause;
        }

        return sqlQuery;
    }

}