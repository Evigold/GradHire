using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

public partial class CompanyStats : System.Web.UI.Page {

    DBHandler handler;

    protected void Page_Load(object sender, EventArgs e) {
        handler = new DBHandler();
        DistByCompany.Legends.Add(new Legend("Default") { Docking = Docking.Right });
    }

    protected void CompanyDDL_SelectedIndexChanged(object sender, EventArgs e) {

        salaryAvg.Text = "$" + handler.getStats(CompanyDDL.SelectedValue, 0);
        earlyApp.Text = handler.getStats(CompanyDDL.SelectedValue, 1);
        jobsOffered.Text = handler.getStats(CompanyDDL.SelectedValue, 2);
        internsOffered.Text = handler.getStats(CompanyDDL.SelectedValue, 3);


        


    }

}