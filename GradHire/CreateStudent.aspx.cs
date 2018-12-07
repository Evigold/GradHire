using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateStudent : System.Web.UI.Page {


    private int studentID;
    private string name;
    private string date;
    private int pastExp;
    
    private DBHandler handler;

    protected void Page_Load(object sender, EventArgs e) {
        handler = new DBHandler();


    }

    protected void Submit_OnClick(object sender, EventArgs e) {
        studentID = Convert.ToInt32(SchoolDDL.SelectedValue);
        name = Name.Text;
        date = Date.Text;
        pastExp = Convert.ToInt32(ExpDDL.SelectedValue);

        handler.InsertStudent(studentID, name, date, pastExp);
    }
}