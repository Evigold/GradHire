using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/**
 * Class to handle generating queries from user input.
 */
public class QueryGenerator {

    private DBHandler handler;

    private const string jobsTable = " JOBS AS j ";
    private const string internTable = " INTERNSHIPS AS i ";
    private const string companyTable = " COMPANY AS c ";
    private const string companyTableJoin = " AND c.id = cid ";

    private List<string> companies;
    private List<string> internships;
    private List<string> jobs;

    private bool companyFlag = false;
    private bool jobFlag = false;
    private bool internFlag = false;
    private bool isJob = false;
    private bool displayAll = false;
    private bool filterFlag = false;

    private string internKeyword = null;
    private string jobKeyword = null;
    private string companyKeyword = null;
    private string filterClause = "";

    /**
     * Class constructor. Populate keyword lists and set isJob.
     */
    public QueryGenerator(bool isJob) {

        handler = new DBHandler();
        companies = handler.getKeywords("cname", "company");
        internships = handler.getKeywords("job_title", "internships");
        jobs = handler.getKeywords("job_title", "jobs");
        IsJob = isJob;
        
    }

    //class properties
    //Job, Company, and Intern flags are true if keywords entered
    public string FilterClause { get => filterClause; set => filterClause = value; }
    public bool FilterFlag { get => filterFlag; set => filterFlag = value; }
    public bool DisplayAll { get => displayAll; set => displayAll = value; }
    public bool IsJob { get => isJob; set => isJob = value; }

    /**
     * 
     */
    public void parseSearch(string search, bool isJob) {

        //Keywords for query
        string jobTitle = null;
        string internTitle = null;
        string companyTitle = null;

        if (!string.IsNullOrEmpty(search)) {

            displayAll = false;
            List<string> words = search.Split(' ').ToList<string>();

            //User wants to find a job, determine if keywords exist in jobs table.
            if (isJob) {
                foreach (string word in words) {
                    string str = word.ToLower();
                    if (jobs.Contains(str)) {
                        if (string.Equals(jobTitle, null)) {
                            jobTitle = str;
                            jobFlag = true;
                        } else {
                            jobTitle += " " + str;
                        }
                    }
                }
                jobKeyword = jobTitle;
            } else { //internships selected, determine if keywords exist in internships table.
                isJob = false;
                foreach (string word in words) {
                    string str = word.ToLower();
                    if (internships.Contains(str)) {
                        if (string.Equals(internTitle, null)) {
                            internTitle = str;
                            internFlag = true;
                        } else {
                            internTitle += " " + str;
                        }
                    }
                }
                internKeyword = internTitle;
            }

            //Determine if a company name is in the search. Can switch back to string[]
            foreach (string word in words) {
                string str = word.ToLower();
                if (!str.Equals("software") && !str.Equals("develop")) {
                    if (companies.Contains(str)) {
                        if (string.Equals(companyTitle, null)) {
                            companyTitle = str;
                            companyFlag = true;
                        } else  {
                            companyTitle += str;
                        }
                    }
                }


            }
            companyKeyword = companyTitle;
        } else {
            //No input in textbox. Display all jobs or internships
            displayAll = true;
        }
        System.Diagnostics.Debug.WriteLine(internTitle);
        System.Diagnostics.Debug.WriteLine(jobKeyword);
        System.Diagnostics.Debug.WriteLine(companyKeyword);
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
            sqlQuery = startQuery + internTable + ", " + companyTable + " WHERE i.job_title LIKE \'%" + (internKeyword + "%\' ") +
                "AND c.cname LIKE \'%" + (companyKeyword + "%\' ") + companyTableJoin;
        } else if (jobFlag && companyFlag) {
            sqlQuery = startQuery + jobsTable + ", " + companyTable + " WHERE j.job_title LIKE \'%" + (jobKeyword + "%\' ") +
                "AND c.cname LIKE \'%" + (companyKeyword + "%\' ") + companyTableJoin;
        } else if (internFlag) {
            sqlQuery = startQuery + internTable + ", " + companyTable + " WHERE i.job_title LIKE \'%" + (internKeyword + "%\' ") + companyTableJoin;
        } else if (jobFlag) {
            sqlQuery = startQuery + jobsTable + ", " + companyTable + " WHERE j.job_title LIKE \'%" + (jobKeyword + "%\' ") + companyTableJoin;
        } else if (companyFlag) { //Only a company name has been searched
            if (IsJob) { //searching for jobs by a company
                sqlQuery = startQuery + companyTable + ",  " + jobsTable + " WHERE c.cname LIKE \'%" + (companyKeyword + "%\' ") + companyTableJoin;
            } else { //searching for internships by a company
                sqlQuery = startQuery + companyTable + ",  " + internTable + " WHERE c.cname LIKE \'%" + (companyKeyword + "%\' ") + companyTableJoin;
            }
        } else { //No keywords found, display all rows if no search provided.
            if (displayAll) {
                if (IsJob) {
                    sqlQuery = startQuery + companyTable + ",  " + jobsTable + " WHERE c.id = cid";
                } else {
                    sqlQuery = startQuery + companyTable + ",  " + internTable + " WHERE c.id = cid";
                }
            } else { //Nothing in database matches search terms, return null string 
                sqlQuery = null;
            }

        }

        if (FilterFlag) {
            sqlQuery += FilterClause;
        }

        return sqlQuery;
    }

}