using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Listing : System.Web.UI.Page {

    private DBHandler handler;
    private QueryGenerator queryGenerator;
    private DataSet ds;
    private string query = "";
    private string filterClause = "";
    private const string noResults = "No results found";


    /**
     * Load page with queryGenerator configured from last page. Runs populateGridView to generate and display query.
     */
    protected void Page_Load(object sender, EventArgs e) {

        handler = new DBHandler();
        queryGenerator = (QueryGenerator) Session["queryGenerator"];
        populateGridView();
    }

    /**
     * Adds filter to query from selected drop down list choice. Runs populate gridview to display the new query.
     */
    protected void FilterDDL_SelectedIndexChanged(object sender, EventArgs e) {
        string selection =  filterDDL.SelectedValue;
        if (selection != "0") {
            queryGenerator.FilterFlag = true;
        }
        switch (selection) {
            
            case "0":  //nothing --select value--
                break;
            case "1": ///Company (A-Z)
                queryGenerator.FilterClause = " ORDER BY cname";
                break;
            case "2": //Company (Z-A)
                filterClause = " ORDER BY cname DESC";
                break;
            case "3": //Exp low to high
                queryGenerator.FilterClause = " ORDER BY past_exp DESC";
                break;
            case "4": //Exp high to low
                queryGenerator.FilterClause = " ORDER BY past_exp";
                break;
            case "5": //Start date low to high
                queryGenerator.FilterClause = " ORDER BY start_date";
                break;
            case "6": //Start date high to low
                queryGenerator.FilterClause = " ORDER BY start_date DESC";
                break;
            case "7": //Salary high to low
                queryGenerator.FilterClause = " ORDER BY salary DESC";
                break;
        }
        populateGridView();

    }

    /**
     * Generates the query and displays in gridview
     */
    private void populateGridView() {

        //if (queryGenerator.IsJob) {
        //    listingHeader.InnerHtml = "Jobs";
        //} else {
        //    listingHeader.InnerHtml = "Internships";
        //}

        query = queryGenerator.generate();

        if(validateQuery(query)) {
            DataSet ds = handler.getDataSet(query);
            ds = handler.getDataSet(query);

            if (ds != null) {
                if (ds.Tables[0].Rows.Count != 0) {
                    DisplayListing.DataSource = ds;
                    DisplayListing.DataBind();
                } else {
                    DisplayListing.DataSource = null;
                    DisplayListing.DataBind();
                }
            } else {
                //No rows found
                displayNoResults();
            }
        } else {
            //no query generated
            displayNoResults();
        }
    }

    /**
     * Check if query is null
     */
    private bool validateQuery(string query) {
        return !string.IsNullOrEmpty(query);      
    }

    /**
     * Prints "no results found" to header of page.
     */
    private void displayNoResults() {
        resultsHeader.InnerHtml = noResults;
    }
}