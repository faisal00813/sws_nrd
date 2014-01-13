using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ShowAdminUser : System.Web.UI.Page
{
    private bool IsSuperAdmin
    {
        get
        {
            return Session["IsSuperAdmin"] == null ? false : (bool)Session["IsSuperAdmin"];
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsSuperAdmin)
        {
            GridViewUser.Columns[0].Visible = true;
        }
        if (IsSuperAdmin)
        {
            GridViewUser.Columns[1].Visible = true;
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRow row = ((DataRowView)e.Row.DataItem).Row;
            //if (string.IsNullOrWhiteSpace(replyLetter))
            //{
            //    LinkButton lnkButton = e.Row.FindControl("lnkDownload") as LinkButton;
            //    lnkButton.Visible = false;
            //}
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToLower() == "edit")
        {
            int keyID;
            int.TryParse(e.CommandArgument as string, out keyID);
            Response.Redirect("MaintainUser.aspx?userId=" + keyID.ToString(), true);
            //if (keyID > 0)
                //Response.Redirect("MaintainGrievance.aspx?grievanceID=" + keyID.ToString());
        }
        else if (e.CommandName.ToLower() == "delete")
        {
            int keyID;
            int.TryParse(e.CommandArgument as string, out keyID);
            if (keyID > 0)
            {
                SqlDataSourceUser.DeleteCommandType = SqlDataSourceCommandType.Text;
                SqlDataSourceUser.DeleteCommand = "Delete AdminUser Where UserID = @UserID";
                SqlDataSourceUser.DeleteParameters.Add("UserID", DbType.Int32, keyID.ToString());
                SqlDataSourceUser.Delete();
                GridViewUser.DataBind();
                LabelMessage.Text = "Record Deleted Successfully";
            }
        }
    }
    protected void LinkButtonAddNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("MaintainUser.aspx", true);
    }
}