using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_MaintainGrievance : System.Web.UI.Page
{
    private int GrievanceID
    {
        get
        {
            return ViewState["GrievanceID"] == null ? 0 : (int)ViewState["GrievanceID"];
        }
        set
        {
            ViewState["GrievanceID"] = value;
        }
    }
    private int GrievanceOnlineRequestID
    {
        get
        {
            return ViewState["GrievanceOnlineRequestID"] == null ? 0 : (int)ViewState["GrievanceOnlineRequestID"];
        }
        set
        {
            ViewState["GrievanceOnlineRequestID"] = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!string.IsNullOrWhiteSpace(Request.QueryString["grievanceID"]))
            {
                int grievanceID = 0;
                int.TryParse(Request.QueryString["grievanceID"], out grievanceID);
                GrievanceID = grievanceID;
                if (GrievanceID > 0)
                {
                    GetData();

                }
            }

            if (!string.IsNullOrWhiteSpace(Request.QueryString["GrievanceOnlineRequestID"]))
            {
                int grievanceOnlineRequestID = 0;
                int.TryParse(Request.QueryString["GrievanceOnlineRequestID"], out grievanceOnlineRequestID);
                GrievanceOnlineRequestID = grievanceOnlineRequestID;
                if (grievanceOnlineRequestID > 0)
                {
                    GetGrievanceOnlineRequestData(grievanceOnlineRequestID);
                }

            }
            GetLastSWSNumber();
        }
    }
    private void GetLastSWSNumber()
    {
        var selectQuery = "SELECT Top 1 [SWSNumber] from Grievance Where ISNULL(SWSNumber,'') <>'' Order By CreatedDate Desc";
        SqlDataSourceGrievance.SelectCommandType = SqlDataSourceCommandType.Text;
        SqlDataSourceGrievance.SelectCommand = selectQuery;
        var dv = (DataView)SqlDataSourceGrievance.Select(DataSourceSelectArguments.Empty);
        if (dv.Table.Rows.Count > 0)
        {
            TextBoxLastSWSNumber.Text = dv.Table.Rows[0]["SWSNumber"] as string;
        }
    }

    private void GetGrievanceOnlineRequestData(int grievanceOnlineRequestID)
    {
        var selectQuery = "SELECT [EmpName], [EmpFHName],[Designation],[Station],[MobileNumber],[Email],[Subject], [CreatedDate] from GrievanceOnlineRequest Where GrievanceOnlineRequestID = @GrievanceOnlineRequestID";
        SqlDataSourceGrievance.SelectCommandType = SqlDataSourceCommandType.Text;
        SqlDataSourceGrievance.SelectParameters.Add("GrievanceOnlineRequestID", DbType.Int32, grievanceOnlineRequestID.ToString());
        SqlDataSourceGrievance.SelectCommand = selectQuery;
        var dv = (DataView)SqlDataSourceGrievance.Select(DataSourceSelectArguments.Empty);
        if (dv.Table.Rows.Count > 0)
        {
            TextBoxName.Text = dv.Table.Rows[0]["EmpName"] as string;
            TextBoxFHName.Text = dv.Table.Rows[0]["EmpFHName"] as string;
            TextBoxDesignation.Text = dv.Table.Rows[0]["Designation"] as string;
            TextBoxStation.Text = dv.Table.Rows[0]["Station"] as string;
            TextBoxSubject.Text = dv.Table.Rows[0]["Subject"] as string;
            TextBoxMobileNumber.Text = dv.Table.Rows[0]["MobileNumber"] as string;
            TextBoxEmail.Text = dv.Table.Rows[0]["Email"] as string;

        }
    }

    private bool IsSWSNumberExist(string swsNumber)
    {
        var selectQuery = "SELECT [EmpName] from Grievance Where SWSNumber = @SWSNumber";
        SqlDataSourceGrievance.SelectCommandType = SqlDataSourceCommandType.Text;
        SqlDataSourceGrievance.SelectParameters.Clear();
        SqlDataSourceGrievance.SelectParameters.Add("SWSNumber", swsNumber);
        SqlDataSourceGrievance.SelectCommand = selectQuery;
        var dv = (DataView)SqlDataSourceGrievance.Select(DataSourceSelectArguments.Empty);
        return dv.Table.Rows.Count > 0;
    }


    private void GetData()
    {
        var selectQuery = "SELECT [GrievanceID], [EmpName], [EmpFHName], [Designation], [Station], [Subject], [MobileNumber], [Email], [Status], [ActionTaken], [DeptReplyLetter], [LetterDate], [LetterRefNumber], [SWSDate], [SWSNumber], [MarkedSection] FROM [Grievance]";
        selectQuery += " Where GrievanceID = " + GrievanceID;
        SqlDataSourceGrievance.SelectCommandType = SqlDataSourceCommandType.Text;
        SqlDataSourceGrievance.SelectCommand = selectQuery;
        var dv = (DataView)SqlDataSourceGrievance.Select(DataSourceSelectArguments.Empty);
        if (dv.Table.Rows.Count > 0)
        {
            TextBoxName.Text = dv.Table.Rows[0]["EmpName"] as string;
            TextBoxFHName.Text = dv.Table.Rows[0]["EmpFHName"] as string;
            TextBoxDesignation.Text = dv.Table.Rows[0]["Designation"] as string;
            TextBoxStation.Text = dv.Table.Rows[0]["Station"] as string;
            TextBoxSubject.Text = dv.Table.Rows[0]["Subject"] as string;
            TextBoxMobileNumber.Text = dv.Table.Rows[0]["MobileNumber"] as string;
            TextBoxEmail.Text = dv.Table.Rows[0]["Email"] as string;
            TextBoxMarkedSection.Text = dv.Table.Rows[0]["Markedsection"] as string;
            TextBoxSWSNumber.Text = dv.Table.Rows[0]["SWSNumber"] as string;
            TextBoxSWSDate.Text = dv.Table.Rows[0]["SWSDate"] as string;
            TextBoxLetterRefNumber.Text = dv.Table.Rows[0]["LetterRefNumber"] as string;
            TextBoxLetterDate.Text = dv.Table.Rows[0]["LetterDate"] as string;
            TextBoxActionTaken.Text = dv.Table.Rows[0]["ActionTaken"] as string;


        }
    }
    protected void ButtonRegister_Click(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrWhiteSpace(TextBoxSWSNumber.Text))
            {
                LabelMessage.Text = "Please enter SWS Number!!!";
                return;
            }
            else if (IsSWSNumberExist(TextBoxSWSNumber.Text.Trim()) && Request.QueryString["grievanceID"] == null)
            {
                LabelMessage.Text = "SWS Number Already Exist!!!";
                return;
            }
            var fileName = UploadFile(TextBoxSWSNumber.Text.Trim());
            //if (string.IsNullOrWhiteSpace(fileName))
            //    return;
            if (GrievanceID <= 0)
            {
                SqlDataSourceGrievance.InsertCommandType = SqlDataSourceCommandType.Text;
                var insertQuery = "Insert into Grievance ([EmpName],[EmpFHName] ,[Designation],[Station] ,[Subject] ,[MobileNumber],[Email],[MarkedSection],[SWSNumber],[SWSDate],[LetterRefNumber],[LetterDate],[DeptReplyLetter],[ActionTaken],[Status]) ";
                insertQuery += " VALUES (@EmpName,@EmpFHName,@Designation,@Station,@Subject,@MobileNumber,@Email,@MarkedSection,@SWSNumber,@SWSDate, @LetterRefNumber, @LetterDate,@DeptReplyLetter, @ActionTaken,@Status) ";
                SqlDataSourceGrievance.InsertCommand = insertQuery;
                SqlDataSourceGrievance.InsertParameters.Add("EmpName", TextBoxName.Text);
                SqlDataSourceGrievance.InsertParameters.Add("EmpFHName", TextBoxFHName.Text);
                SqlDataSourceGrievance.InsertParameters.Add("Designation", TextBoxDesignation.Text);
                SqlDataSourceGrievance.InsertParameters.Add("Station", TextBoxStation.Text);
                SqlDataSourceGrievance.InsertParameters.Add("Subject", TextBoxSubject.Text);
                SqlDataSourceGrievance.InsertParameters.Add("MobileNumber", TextBoxMobileNumber.Text);
                SqlDataSourceGrievance.InsertParameters.Add("Email", TextBoxEmail.Text);
                SqlDataSourceGrievance.InsertParameters.Add("MarkedSection", TextBoxMarkedSection.Text);
                SqlDataSourceGrievance.InsertParameters.Add("SWSNumber", TextBoxSWSNumber.Text);
                SqlDataSourceGrievance.InsertParameters.Add("SWSDate", TextBoxSWSDate.Text);
                SqlDataSourceGrievance.InsertParameters.Add("LetterRefNumber", TextBoxLetterRefNumber.Text);
                SqlDataSourceGrievance.InsertParameters.Add("LetterDate", TextBoxLetterDate.Text);
                if (string.IsNullOrWhiteSpace(fileName))
                    SqlDataSourceGrievance.InsertParameters.Add("DeptReplyLetter", default(string));
                else
                    SqlDataSourceGrievance.InsertParameters.Add("DeptReplyLetter", fileName);
                SqlDataSourceGrievance.InsertParameters.Add("ActionTaken", TextBoxActionTaken.Text);
                SqlDataSourceGrievance.InsertParameters.Add("Status", DroDownListStatus.SelectedValue);
                SqlDataSourceGrievance.Insert();
                DeleteGrivanceOnlineRequest();
            }
            else
            {
                SqlDataSourceGrievance.UpdateCommandType = SqlDataSourceCommandType.Text;
                var updateQuery = "Update Grievance Set EmpName = @EmpName, EmpFHName = @EmpFHName, Designation = @Designation, ";
                updateQuery += " Station = @Station, Subject = @Subject, MobileNumber = @MobileNumber,Email = @Email, ";
                updateQuery += " MarkedSection = @MarkedSection, SWSNumber=@SWSNumber, SWSDate = @SWSDate,";
                updateQuery += " LetterRefNumber = @LetterRefNumber,LetterDate=@LetterDate,";
                if (!string.IsNullOrWhiteSpace(fileName))
                    updateQuery += " DeptReplyLetter=@DeptReplyLetter,";
                updateQuery += " ActionTaken=@ActionTaken,Status=@Status ";
                updateQuery += " Where GrievanceID = @GrievanceID";
                SqlDataSourceGrievance.UpdateCommand = updateQuery;
                SqlDataSourceGrievance.UpdateParameters.Add("EmpName", TextBoxName.Text);
                SqlDataSourceGrievance.UpdateParameters.Add("EmpFHName", TextBoxFHName.Text);
                SqlDataSourceGrievance.UpdateParameters.Add("Designation", TextBoxDesignation.Text);
                SqlDataSourceGrievance.UpdateParameters.Add("Station", TextBoxStation.Text);
                SqlDataSourceGrievance.UpdateParameters.Add("Subject", TextBoxSubject.Text);
                SqlDataSourceGrievance.UpdateParameters.Add("MobileNumber", TextBoxMobileNumber.Text);
                SqlDataSourceGrievance.UpdateParameters.Add("Email", TextBoxEmail.Text);
                SqlDataSourceGrievance.UpdateParameters.Add("MarkedSection", TextBoxMarkedSection.Text);
                SqlDataSourceGrievance.UpdateParameters.Add("SWSNumber", TextBoxSWSNumber.Text);
                SqlDataSourceGrievance.UpdateParameters.Add("SWSDate", TextBoxSWSDate.Text);
                SqlDataSourceGrievance.UpdateParameters.Add("LetterRefNumber", TextBoxLetterRefNumber.Text);
                SqlDataSourceGrievance.UpdateParameters.Add("LetterDate", TextBoxLetterDate.Text);
                if (!string.IsNullOrWhiteSpace(fileName))
                    SqlDataSourceGrievance.UpdateParameters.Add("DeptReplyLetter", fileName);
                //SqlDataSourceGrievance.UpdateParameters.Add("DeptReplyLetter", default(string));
                SqlDataSourceGrievance.UpdateParameters.Add("ActionTaken", TextBoxActionTaken.Text);
                SqlDataSourceGrievance.UpdateParameters.Add("Status", DroDownListStatus.SelectedValue);
                SqlDataSourceGrievance.UpdateParameters.Add("GrievanceID", System.Data.DbType.Int32, GrievanceID.ToString());
                SqlDataSourceGrievance.Update();
                DeleteGrivanceOnlineRequest();
            }
            LabelMessage.Text = "Record Saved Successfully!";
            GrievanceID = 0;
            GrievanceOnlineRequestID = 0;
            GetLastSWSNumber();
        }
        catch (Exception ex)
        {
            LabelMessage.Text = "Error Occured: " + ex.Message + "\n Please try after sometime or physically deliver your application";
        }
    }
    private void DeleteGrivanceOnlineRequest()
    {
        if (GrievanceOnlineRequestID > 0)
        {
            SqlDataSourceGrievance.DeleteCommandType = SqlDataSourceCommandType.Text;
            var deleteQuery = "Delete GrievanceOnlineRequest Where GrievanceOnlineRequestID = @RequestID";
            SqlDataSourceGrievance.DeleteCommand = deleteQuery;
            SqlDataSourceGrievance.DeleteParameters.Add("RequestID", DbType.Int32, GrievanceOnlineRequestID.ToString());
            SqlDataSourceGrievance.Delete();
        }
    }
    private string UploadFile(string swsNumber)
    {
        if (FileUploader.HasFile)
        {
            try
            {
                //saving the file
                var fileName = swsNumber + FileUploader.PostedFile.FileName.Substring(FileUploader.PostedFile.FileName.LastIndexOf("."));
                FileUploader.SaveAs(Server.MapPath("~/DeptReplyLetter/" + fileName));
                return fileName;
            }
            catch (Exception ex)
            {
                LabelMessage.Text = "Exception Occured: " + ex.Message;
            }
        }
        else
            LabelMessage.Text = "Please select file for upload";
        return "";
    }
    protected void ButtonReset_Click(object sender, EventArgs e)
    {
        ClearControls();
    }
    private void ClearControls()
    {
        TextBoxName.Text = "";
        TextBoxFHName.Text = "";
        TextBoxMobileNumber.Text = "";
        TextBoxDesignation.Text = "";
        TextBoxEmail.Text = "";
        TextBoxStation.Text = "";
        TextBoxSubject.Text = "";
        TextBoxSWSNumber.Text = "";
        TextBoxMarkedSection.Text = "";
        TextBoxActionTaken.Text = "";
        TextBoxLetterDate.Text = "";
        TextBoxLetterDate.Text = "";
        TextBoxLetterRefNumber.Text = "";
        TextBoxSWSDate.Text = "";
        DroDownListStatus.SelectedIndex = 0;
        GrievanceID = 0;
        GrievanceOnlineRequestID = 0;
    }
}