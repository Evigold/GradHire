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

    protected void Page_Load(object sender, EventArgs e) {

    }

    protected void submit_Click(object sender, EventArgs e) {
        string search = keyword.Text;
        bool isJob = typeSelector.SelectedValue == "job";

      
        
        Session["searchString"] = search;

        //Launch listings page
        
        Response.Redirect("~/Listing.aspx", false);
        Context.ApplicationInstance.CompleteRequest();

    }

}