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
    private string internKeyword = null;
    private string jobKeyword = null;
    private string companyKeyword = null;
    private const string internTable = "internships AS i";
    private const string jobsTable = "jobs AS j";
    private const string companyTable = "company AS c";

    /**
     * Empty class constructor
     */
    public QueryGenerator() {

    }

    //class properties
    public bool JobFlag { get => jobFlag; set => jobFlag = value; }
    public bool CompanyFlag { get => companyFlag; set => companyFlag = value; }
    public bool InternFlag { get => internFlag; set => internFlag = value; }
    public string CompanyKeyword { get => companyKeyword; set => companyKeyword = value; }
    public string JobKeyword { get => jobKeyword; set => jobKeyword = value; }
    public string InternKeyword { get => internKeyword; set => internKeyword = value; }


    /**
     * Generates a search query off flags set by user inputed keywords. 
     */
    public string generate() {
        //TODO change * to reflect rows we want to display
        string startQuery = "SELECT * FROM ";

        //Query to be built and returned
        string sqlQuery;

        //Branch to generate query off of flags.
        if (internFlag && companyFlag) {
            sqlQuery = startQuery + internTable + ", " + companyTable + " WHERE i.job_title LIKE \'%" + (InternKeyword + "%\' ") +
                "AND c.cname LIKE \'%" + (companyKeyword + "%\' ") +
                "AND c.id = i.cid";
        } else if (jobFlag && companyFlag) {
            sqlQuery = startQuery + jobsTable + ", " + companyTable + " WHERE j.job_title LIKE \'%" + (JobKeyword + "%\' ") +
                "AND c.cname LIKE \'%" + (companyKeyword + "%\' ") +
                "AND c.id = j.cid";
        } else if (internFlag) {
            sqlQuery = startQuery + internTable + " WHERE i.job_title LIKE \'%" + (InternKeyword + "%\' ");
        } else if (jobFlag) {
            sqlQuery = startQuery + jobsTable + " WHERE j.job_title LIKE \'%" + (JobKeyword + "%\' ");
        } else if (companyFlag) {
            sqlQuery = startQuery + companyTable + " WHERE c.cname LIKE \'%" + (companyKeyword + "%\' ");
        } else {
            sqlQuery = null; //handle me

        }

        return sqlQuery;
    }


}