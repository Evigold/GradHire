using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home : System.Web.UI.Page {
    SqlConnection DBConnection;
    SqlCommand DBCommand;
    SqlDataAdapter DBAdapter;
    SqlDataReader DBReader;
    private DBHandler handler;
    private string query;
    QueryGenerator queryGenerator;
    bool debug = true;
    
    //Property so handler can be passed to Listing.aspx
    public DBHandler Handler { get => handler; set => handler = value; }
    public string Query { get => query; set => query = value; }

    protected void Page_Load(object sender, EventArgs e) {

    }

    protected void submit_Click(object sender, EventArgs e) {
        handler = new DBHandler();
        this.Handler = handler;
        queryGenerator = new QueryGenerator();

        string search = keyword.Text;
        string jobTitle = null;
        string internTitle = null;
        string companyTitle = null;

        List<string> words = search.Split(' ').ToList<string>();
        List<string> companies = handler.getKeywords("cname", "company");

        printDebug(words);

        //Determine if a company name is in the search. Can switch back to string[]

        //TODO Only works for companies w/o space in title... 
        foreach (string word in words) {
            string str = word.ToLower();
            if (companies.Contains(str)) {
                if (string.Equals(companyTitle, null)) {
                    companyTitle = str;
                    queryGenerator.CompanyFlag = true;
                } else {
                    companyTitle += str;
                }


            }
            queryGenerator.CompanyKeyword = companyTitle;
        }

        //User wants to find a job, determine if keywords exist in jobs table.
        if (typeSelector.SelectedValue == "job") {
            List<string> jobs = handler.getKeywords("job_title", "jobs");
            printDebug(jobs);
            foreach (string word in words) {
                string str = word.ToLower();
                if (jobs.Contains(str)) {
                    if (string.Equals(jobTitle, null)) {
                        jobTitle = str;
                        queryGenerator.JobFlag = true;
                    } else {
                        jobTitle += " " + str;
                    }
                }
            }
            queryGenerator.JobKeyword = jobTitle;
        } else { //internships selected, determien if keywords exist in internships table.
            List<string> internships = handler.getKeywords("job_title", "internships");
            foreach (string word in words) {
                string str = word.ToLower();
                if (internships.Contains(str)) {
                    if (string.Equals(internTitle, null)) {
                        internTitle = str;
                        queryGenerator.InternFlag = true;
                    } else {
                        internTitle += " " + str;
                    }
                }
            }
            queryGenerator.InternKeyword = internTitle;
        }

        if (debug) {
            System.Diagnostics.Debug.WriteLine("Company: " + companyTitle);
            System.Diagnostics.Debug.WriteLine("Intern: " + internTitle);
            System.Diagnostics.Debug.WriteLine("Jobss: " + jobTitle);
            System.Diagnostics.Debug.WriteLine(queryGenerator.InternFlag.ToString() + queryGenerator.JobFlag.ToString() + queryGenerator.CompanyFlag.ToString());
            System.Diagnostics.Debug.WriteLine(queryGenerator.JobKeyword + "      " + queryGenerator.CompanyKeyword);
        }

        //handler.Query = queryGenerator.generate();
        //Response.Redirect("~/Listing.aspx");

        query = queryGenerator.generate();
        SqlDataReader reader = handler.runQuery(query);
        DisplayJobs.DataSource = reader;
        DisplayJobs.DataBind();
        reader.Close();


    }
    
    private void printDebug(List<string> words) {
        foreach (string word in words) {
            System.Diagnostics.Debug.WriteLine(word);
        }
    }
}