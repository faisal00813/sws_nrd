using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class smsrec : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string from = Request.QueryString["from"];
        string message = Request.QueryString["message"];

        SqlDataSourceGrievance.InsertCommandType = SqlDataSourceCommandType.Text;
        var insertQuery = "Insert into GrievanceOnlineRequest ([MobileNumber],[Subject]) ";
        insertQuery += " VALUES (@MobileNumber,@Subject) ";
        SqlDataSourceGrievance.InsertCommand = insertQuery;
        SqlDataSourceGrievance.InsertParameters.Add("MobileNumber", from);
        SqlDataSourceGrievance.InsertParameters.Add("Subject", message);
        SqlDataSourceGrievance.Insert();
    }
}