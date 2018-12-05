using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/**
 * Class to handle generating queries from user input.
 */
public class QueryGenerator {

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

    }

    //class properties
    //Job, Company, and Intern flags are true if keywords entered
    public bool JobFlag { get => jobFlag; set => jobFlag = value; }
    public bool CompanyFlag { get => companyFlag; set => companyFlag = value; }
    public bool InternFlag { get => internFlag; set => internFlag = value; }
    public string CompanyKeyword { get => companyKeyword; set => companyKeyword = value; }
    public string JobKeyword { get => jobKeyword; set => jobKeyword = value; }
    public string InternKeyword { get => internKeyword; set => internKeyword = value; }
    public bool IsJob { get => isJob; set => isJob = value; }
    public string FilterClause { get => filterClause; set => filterClause = value; }
    public bool FilterFlag { get => filterFlag; set => filterFlag = value; }
    public bool DisplayAll { get => displayAll; set => displayAll = value; }


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