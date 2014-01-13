using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_ucLeftPanelAdmin : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("RequestedGrievance.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminAcceptedGrievance.aspx");
    }
    
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("ShowAdminUser.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("ShowContacts.aspx");
    }
    protected void Button3_Click1(object sender, EventArgs e)
    {
        Response.Redirect("ChangePassword.aspx");
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("Pendingstatus.aspx");
    }
}