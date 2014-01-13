using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class EmpContactDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (!IsMobileNumberExist(TextBoxMobile.Text.Trim()))
        {
            SqlDataSourceGrievance.InsertCommandType = SqlDataSourceCommandType.Text;
            var insertQuery = "Insert into EmpContactDetail ([EmpName],[EmpFHName],[Designation],[Station],[MobileNumber],[Email]) ";
            insertQuery += " VALUES (@EmpName,@EmpFHName,@Designation,@Station,@MobileNumber,@Email) ";
            SqlDataSourceGrievance.InsertCommand = insertQuery;
            SqlDataSourceGrievance.InsertParameters.Add("EmpName", TextBoxName.Text);
            SqlDataSourceGrievance.InsertParameters.Add("EmpFHName", TextBoxFHName.Text);
            SqlDataSourceGrievance.InsertParameters.Add("Designation", TextBoxDesignation.Text);
            SqlDataSourceGrievance.InsertParameters.Add("Station", TextBoxStation.Text);
            SqlDataSourceGrievance.InsertParameters.Add("MobileNumber", TextBoxMobile.Text);
            SqlDataSourceGrievance.InsertParameters.Add("Email", TextBoxEmail.Text);
            SqlDataSourceGrievance.Insert();
            LabelMessage.Visible = true;
            LabelMessage.Text = "<font color='Blue'>Thank You for Registering Your Contact Details...</font>";
            ClearControls();
        }
        else
        {
            LabelMessage.Visible = true;
            LabelMessage.Text = "<font color='red'> Mobile Number already registered!!!!</font>";
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        ClearControls();
    }

    private bool IsMobileNumberExist(string mobileNumber)
    {
        var selectQuery = "SELECT [EmpName] from [EmpContactDetail] Where [MobileNumber] like '%" + mobileNumber + "%'";
        SqlDataSourceGrievance.SelectCommandType = SqlDataSourceCommandType.Text;
        SqlDataSourceGrievance.SelectCommand = selectQuery;
        var dv = (DataView)SqlDataSourceGrievance.Select(DataSourceSelectArguments.Empty);
        return dv.Table.Rows.Count > 0;
    }
    private void ClearControls()
    {
        TextBoxName.Text = "";
        TextBoxFHName.Text = "";
        TextBoxMobile.Text = "";
        TextBoxDesignation.Text = "";
        TextBoxEmail.Text = "";
        TextBoxStation.Text = "";

    }
    protected void TextBoxName_TextChanged(object sender, EventArgs e)
    {

    }
}