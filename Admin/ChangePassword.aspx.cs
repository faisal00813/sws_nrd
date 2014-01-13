using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBoxUserName.Text = Session["UserName"] as string;
        LabelMessage.Text = "";
    }
    protected void ButtonChangePassword_Click(object sender, EventArgs e)
    {
        if (TextBoxNewPassword.Text != TextBoxConfirmPassword.Text)
        {
            LabelMessage.Text = "New Password and Confirm Password do not match";
            return;
        }
        else
        {
            var selectQuery = "SELECT UserName FROM [AdminUser] Where UserName = @UserName AND Password = @Password";
            SqlDataSourceUser.SelectCommandType = SqlDataSourceCommandType.Text;
            SqlDataSourceUser.SelectParameters.Clear();
            SqlDataSourceUser.SelectCommand = selectQuery;
            SqlDataSourceUser.SelectParameters.Add("UserName", TextBoxUserName.Text);
            SqlDataSourceUser.SelectParameters.Add("Password", TextBoxPassword.Text);

            var dv = (DataView)SqlDataSourceUser.Select(DataSourceSelectArguments.Empty);
            if (dv.Table.Rows.Count <= 0)
            {
                LabelMessage.Text = "Invalid Current Password";
                return;
            }
            var updateQuery = "Update AdminUser Set Password = @NewPassword Where UserName = @UserName";
            SqlDataSourceUser.UpdateCommandType = SqlDataSourceCommandType.Text;
            SqlDataSourceUser.UpdateCommand = updateQuery;
            SqlDataSourceUser.UpdateParameters.Add("UserName", TextBoxUserName.Text);
            SqlDataSourceUser.UpdateParameters.Add("NewPassword", TextBoxNewPassword.Text);
            SqlDataSourceUser.Update();
            LabelMessage.Text = "Password Changed Successfully";
        }
    }
}