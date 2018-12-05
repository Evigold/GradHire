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
    private DBHandler handler;
    QueryGenerator queryGenerator;

    protected void Page_Load(object sender, EventArgs e) {

    }

    protected void submit_Click(object sender, EventArgs e) {
        handler = new DBHandler();
        queryGenerator = new QueryGenerator();
        string search = keyword.Text;
        bool isJob = typeSelector.SelectedValue == "job";


        queryGenerator.IsJob = isJob;

        if (!string.IsNullOrEmpty(search)) {

            queryGenerator.DisplayAll = false;

            //Keywords for query
            string jobTitle = null;
            string internTitle = null;
            string companyTitle = null;


            List<string> words = search.Split(' ').ToList<string>();
            List<string> companies = handler.getKeywords("cname", "company");

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
            if (isJob) {                
                List<string> jobs = handler.getKeywords("job_title", "jobs");
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
                queryGenerator.IsJob = false;
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

        } else {
            //No input in textbox. Display all jobs or internships
            queryGenerator.DisplayAll = true;
        }

        Session["queryGenerator"] = queryGenerator;

        //Launch listings page
        
        Response.Redirect("~/Listing.aspx", false);
        Context.ApplicationInstance.CompleteRequest();

    }

}