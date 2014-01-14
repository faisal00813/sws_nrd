using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Net;
using System.IO;

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
            SendSms(TextBoxMobile.Text);
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

    private void SendSms(string mob) {


        //Your authentication key
        string authKey = "2606AlmmRVFM1f52d43d62";
        //Multiple mobiles numbers seperated by comma
        string mobileNumber = mob;
        //Sender ID,While using route4 sender id should be 6 characters long.
        string senderId = "DRM-NED";
        //Your message to send, Add URL endcoding here.
        string message = HttpUtility.UrlEncode("You have been succesfully registered in Single Window System.");

        //Prepare you post parameters
        StringBuilder sbPostData = new StringBuilder();
        sbPostData.AppendFormat("authkey={0}", authKey);
        sbPostData.AppendFormat("&mobiles={0}", mobileNumber);
        sbPostData.AppendFormat("&message={0}", message);
        sbPostData.AppendFormat("&sender={0}", senderId);
        sbPostData.AppendFormat("&route={0}", "default");

        try
        {
            //Call Send SMS API
            string sendSMSUri = "http://sms.ssdindia.com/sendhttp.php";
            //Create HTTPWebrequest
            HttpWebRequest httpWReq = (HttpWebRequest)WebRequest.Create(sendSMSUri);
            //Prepare and Add URL Encoded data
            UTF8Encoding encoding = new UTF8Encoding();
            byte[] data = encoding.GetBytes(sbPostData.ToString());
            //Specify post method
            httpWReq.Method = "POST";
            httpWReq.ContentType = "application/x-www-form-urlencoded";
            httpWReq.ContentLength = data.Length;
            using (Stream stream = httpWReq.GetRequestStream())
            {
                stream.Write(data, 0, data.Length);
            }
            //Get the response
            HttpWebResponse response = (HttpWebResponse)httpWReq.GetResponse();
            StreamReader reader = new StreamReader(response.GetResponseStream());
            string responseString = reader.ReadToEnd();

            //Close the response
            reader.Close();
            response.Close();
        }
        catch (SystemException ex)
        {
            Console.WriteLine(ex.Message);
        }

    
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