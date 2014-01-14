using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPages_MasterPageNew : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonLogin_Click(object sender, EventArgs e)
    {
        if (TextBoxUserName.Text != string.Empty && TextBoxPassword.Text != string.Empty)
        {
            if (ValidateUser(TextBoxUserName.Text, TextBoxPassword.Text))
            {
                FormsAuthentication.RedirectFromLoginPage(TextBoxUserName.Text, false);
            }
            else
            {
                LabelMessage.Text = "<font color='red'>Invalid credentials. Please try again.</font>";
            }
        }
        else
        {
            LabelMessage.Text = "<font color='red'>Invalid credentials. Please try again.</font>";
        }
    }
    private bool ValidateUser(string userName, string password)
    {
        var selectQuery = "SELECT IsSuperAdmin from AdminUser Where UserName= @UserName AND Password = @Password";
        SqlDataSourceUser = new SqlDataSource(System.Configuration.ConfigurationManager.ConnectionStrings["SWSDBConnectionString"].ConnectionString, selectQuery);
        SqlDataSourceUser.SelectCommandType = SqlDataSourceCommandType.Text;
        SqlDataSourceUser.SelectParameters.Add("UserName", userName);
        SqlDataSourceUser.SelectParameters.Add("Password", password);
        var dv = (DataView)SqlDataSourceUser.Select(DataSourceSelectArguments.Empty);
        if (dv.Table.Rows.Count > 0)
        {
            Session["UserName"] = userName;
            Session["IsSuperAdmin"] = (bool)dv.Table.Rows[0]["IsSuperAdmin"];
            return true;
        }
        else
        {
            return false;
        }
    }
}
