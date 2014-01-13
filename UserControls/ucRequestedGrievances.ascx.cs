using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_ucRequestedGrievances : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmd")
        {
            string filename = e.CommandArgument.ToString();
            if (filename != "")
            {
                string path = MapPath("~/EmpReqLetter/" + filename);
                byte[] bts = System.IO.File.ReadAllBytes(path);
                Response.Clear();
                Response.ClearHeaders();
                Response.AddHeader("Content-Type", "Application/octet-stream");
                Response.AddHeader("Content-Length", bts.Length.ToString());

                Response.AddHeader("Content-Disposition", "attachment;   filename=" + filename);

                Response.BinaryWrite(bts);

                Response.Flush();

                Response.End();
            }
        }
        else if (e.CommandName == "reject")
        {
            var requestID = (string) e.CommandArgument;
            SqlDataSourceAcceptReject.DeleteCommandType = SqlDataSourceCommandType.Text;
            var deleteQuery = "Delete GrievanceOnlineRequest Where GrievanceOnlineRequestID = @RequestID";
            SqlDataSourceAcceptReject.DeleteCommand = deleteQuery;
            SqlDataSourceAcceptReject.DeleteParameters.Add("RequestID", DbType.Int32, requestID);
            SqlDataSourceAcceptReject.Delete();
            LabelMessage.Text = "Requested Grievance Deleted Successfully!";
            GridView1.DataBind();

        }
        else if (e.CommandName == "accept")
        {
            var requestID = (string)e.CommandArgument;
            Response.Redirect("MaintainGrievance.aspx?GrievanceOnlineRequestID=" + requestID, true);

        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRow row = ((DataRowView)e.Row.DataItem).Row;
            var reqLetter = row["EmpRequestLetter"] as string;
            if (string.IsNullOrWhiteSpace(reqLetter))
            {
                LinkButton lnkButton = e.Row.FindControl("lnkDownload") as LinkButton;
                lnkButton.Visible = false;
            }
        }
    }
}