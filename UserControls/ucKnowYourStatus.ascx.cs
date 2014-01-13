using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_ucKnowYourStatus : System.Web.UI.UserControl
{
    public bool CanExportGrievances
    {
        set
        {
            LinkButtonExport.Visible = value;
        }
    }
    public bool CanAddNewGrievance
    {
        set
        {
            LinkButtonAddNewGrievance.Visible = value;
        }
    }
    public bool CanEditGrievance
    {
        get;
        set;
    }
    public bool IsSuperAdmin
    {
        get
        {
           return Session["IsSuperAdmin"] == null ? false : (bool)Session["IsSuperAdmin"];
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        LabelMessage.Text = "";
        if (!CanEditGrievance)
        {
            GridView1.Columns[0].Visible = false;
        }
        if(IsSuperAdmin)
        {
            GridView1.Columns[1].Visible = true;
        }
    }
    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        var selectCommand = "SELECT [EmpName], [GrievanceID], [EmpFHName], [Designation], [Station], [Subject], [SWSNumber], [MarkedSection], [SWSDate], [ActionTaken], [Status], [DeptReplyLetter], [CreatedDate] FROM [Grievance]";
        if (!string.IsNullOrWhiteSpace(TextBoxSWSNumber.Text))
            selectCommand += " Where SWSNumber = '" + TextBoxSWSNumber.Text+"'";
        selectCommand += " order by createddate desc";
        SqlDataSource1.SelectCommand = selectCommand;
        GridView1.DataSourceID = SqlDataSource1.ID; ;
        GridView1.DataBind();

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRow row = ((DataRowView)e.Row.DataItem).Row;
            var replyLetter = row["DeptReplyLetter"] as string;
            if (string.IsNullOrWhiteSpace(replyLetter))
            {
                LinkButton lnkButton = e.Row.FindControl("lnkDownload") as LinkButton;
                lnkButton.Visible = false;
            }
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmd")
        {
            string filename = e.CommandArgument.ToString();
            if (filename != "")
            {
                string path = MapPath("~/DeptReplyLetter/" + filename);
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
        else if (e.CommandName.ToLower() == "edit")
        {
            int keyID;
            int.TryParse(e.CommandArgument as string, out keyID);
            if (keyID > 0)
                Response.Redirect("MaintainGrievance.aspx?grievanceID=" + keyID.ToString());
        }
        else if (e.CommandName.ToLower() == "delete")
        {
            int keyID;
            int.TryParse(e.CommandArgument as string, out keyID);
            if (keyID > 0)
            {
                SqlDataSource1.DeleteCommandType = SqlDataSourceCommandType.Text;
                SqlDataSource1.DeleteCommand = "Delete Grievance Where GrievanceID = @GrievanceID";
                SqlDataSource1.DeleteParameters.Add("GrievanceID", DbType.Int32, keyID.ToString());
                SqlDataSource1.Delete();
                GridView1.DataBind();
                LabelMessage.Text = "Record Deleted Successfully";
            }

        }


    }
    protected void LinkButtonAddNewGrievance_Click(object sender, EventArgs e)
    {
        Response.Redirect("MaintainGrievance.aspx", true);
    }
    protected void UploadDataTableToExcel(DataTable dtRecords)
    {
        var fileName = "Grievances_" + DateTime.Now.Date.ToString("ddMMyyyy");
        string XlsPath = Server.MapPath(@"~/ExcelFiles/" + fileName +".xls");
        string attachment = string.Empty;
        if (XlsPath.IndexOf("\\") != -1)
        {
            string[] strFileName = XlsPath.Split(new char[] { '\\' });
            attachment = "attachment; filename=" + strFileName[strFileName.Length - 1];
        }
        else
            attachment = "attachment; filename=" + XlsPath;
        try
        {
            Response.ClearContent();
            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/vnd.ms-excel";
            string tab = string.Empty;

            foreach (DataColumn datacol in dtRecords.Columns)
            {
                Response.Write(tab + datacol.ColumnName);
                tab = "\t";
            }
           





            
            Response.Write("\n");

            foreach (DataRow dr in dtRecords.Rows)
            {
                tab = "";
                for (int j = 0; j < dtRecords.Columns.Count; j++)
                {
                    Response.Write(tab + Convert.ToString(dr[j] == DBNull.Value ? "" : dr[j]));
                    tab = "\t";
                }

                Response.Write("\n");
            }
            Response.End();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void LinkButtonExport_Click(object sender, EventArgs e)
    {
        var selectQuery = "SELECT [SWSNumber],[SWSDate],[LetterRefNumber],[EmpName],[EmpFHName],[Designation],[Station],[Subject] ";
        selectQuery += ",[MarkedSection],[ActionTaken],[Status] FROM [Grievance]";
        SqlDataSource2.SelectCommandType = SqlDataSourceCommandType.Text;
        SqlDataSource2.SelectParameters.Clear();
        SqlDataSource2.SelectCommand = selectQuery;
        var dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        UploadDataTableToExcel(dv.Table);
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}