using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_MaintainUser : System.Web.UI.Page
{
    private int UserID
    {
        get
        {
            return ViewState["UserID"] == null ? 0 : (int)ViewState["UserID"];
        }
        set
        {
            ViewState["UserID"] = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!string.IsNullOrWhiteSpace(Request.QueryString["userID"]))
            {
                int userID = 0;
                int.TryParse(Request.QueryString["userID"], out userID);
                UserID = userID;
                if (UserID > 0)
                {
                    GetUser();
                }
            }

        }
    }
    private void GetUser()
    {
        var selectQuery = "SELECT UserID, [UserName], [Name], [Designation], [IsSuperAdmin] FROM [AdminUser]";
        selectQuery += " Where UserID = " + UserID;
        SqlDataSourceUser.SelectCommandType = SqlDataSourceCommandType.Text;
        SqlDataSourceUser.SelectCommand = selectQuery;
        var dv = (DataView)SqlDataSourceUser.Select(DataSourceSelectArguments.Empty);
        if (dv.Table.Rows.Count > 0)
        {
            TextBoxUserName.Text = dv.Table.Rows[0]["UserName"] as string;
            TextBoxName.Text = dv.Table.Rows[0]["Name"] as string;
            TextBoxDesignation.Text = dv.Table.Rows[0]["Designation"] as string;
        }
    }

    protected void ButtonSave_Click(object sender, EventArgs e)
    {
        if (UserID > 0)
        {
            var updateQuery = "Update AdminUser Set UserName = @UserName, Password = @Password, [Name] = @Name, [Designation] = @Designation FROM [AdminUser]";
            updateQuery += " Where UserID = @UserID";
            SqlDataSourceUser.UpdateCommandType = SqlDataSourceCommandType.Text;
            SqlDataSourceUser.UpdateCommand = updateQuery;
            SqlDataSourceUser.UpdateParameters.Add("UserID", UserID.ToString());
            SqlDataSourceUser.UpdateParameters.Add("UserName", TextBoxUserName.Text);
            SqlDataSourceUser.UpdateParameters.Add("Password", TextBoxPassword.Text);
            SqlDataSourceUser.UpdateParameters.Add("Name", TextBoxName.Text);
            SqlDataSourceUser.UpdateParameters.Add("Designation", TextBoxDesignation.Text);
            SqlDataSourceUser.Update();
        }
        else
        {
            var insertQuery = "Insert AdminUser(UserName, Password, Name, Designation) Values(@UserName, @Password, @Name, @Designation)";
            SqlDataSourceUser.InsertCommandType = SqlDataSourceCommandType.Text;
            SqlDataSourceUser.InsertCommand = insertQuery;
            SqlDataSourceUser.InsertParameters.Add("UserName", TextBoxUserName.Text);
            SqlDataSourceUser.InsertParameters.Add("Password", TextBoxPassword.Text);
            SqlDataSourceUser.InsertParameters.Add("Name", TextBoxName.Text);
            SqlDataSourceUser.InsertParameters.Add("Designation", TextBoxDesignation.Text);
            SqlDataSourceUser.Insert();
        }
        LabelMessage.Text = "User Saved Successfully";
    }
}