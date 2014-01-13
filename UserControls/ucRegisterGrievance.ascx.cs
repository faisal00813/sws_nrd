using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ucRegisterGrievance : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonRegister_Click(object sender, EventArgs e)
    {
        try
        {
            var fileName = UploadFile(TextBoxName.Text.Trim());
            if (string.IsNullOrWhiteSpace(fileName))
                return;

            SqlDataSourceGrievance.InsertCommandType = SqlDataSourceCommandType.Text;
            var insertQuery = "Insert into GrievanceOnlineRequest ([EmpName],[EmpFHName],[Designation],[Station],[MobileNumber],[Email],[Subject],[EmpRequestLetter]) ";
            insertQuery += " VALUES (@EmpName,@EmpFHName,@Designation,@Station,@MobileNumber,@Email,@Subject, @EmpRequestLetter) ";
            SqlDataSourceGrievance.InsertCommand = insertQuery;
            SqlDataSourceGrievance.InsertParameters.Add("EmpName", TextBoxName.Text);
            SqlDataSourceGrievance.InsertParameters.Add("EmpFHName", TextBoxFHName.Text);
            SqlDataSourceGrievance.InsertParameters.Add("Designation", TextBoxDesignation.Text);
            SqlDataSourceGrievance.InsertParameters.Add("Station", TextBoxStation.Text);
            SqlDataSourceGrievance.InsertParameters.Add("MobileNumber", TextBoxMobileNumber.Text);
            SqlDataSourceGrievance.InsertParameters.Add("Email", TextBoxEmail.Text);
            SqlDataSourceGrievance.InsertParameters.Add("Subject", TextBoxSubject.Text);
            SqlDataSourceGrievance.InsertParameters.Add("EmpRequestLetter", fileName);
            SqlDataSourceGrievance.Insert();
            LabelMessage.Text = "Your request has been submitted Successfully!";
        }
        catch (Exception ex)
        {
            LabelMessage.Text = "Error Occured: " + ex.Message + "\n Please try after sometime or physically deliver your application";
        }
    }
    private string UploadFile(string employeeName)
    {
        if (FileUploader.HasFile)
        {
            try
            {
                var uniqueID = DateTime.Now.ToString("yyyyMMddHHmmss");
                //saving the file
                var fileName = employeeName + "_" + uniqueID + FileUploader.PostedFile.FileName.Substring(FileUploader.PostedFile.FileName.LastIndexOf("."));
                FileUploader.SaveAs(Server.MapPath("~/EmpReqLetter/" + fileName));
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
    }
}