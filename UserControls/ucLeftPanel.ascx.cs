using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LeftPanel : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("RegisterGrievance.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("EmpContactDetail.aspx");
    }
}