//Written by Myungsik Kim

using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace portpolio.registeration
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        public databasesample dataContext = new databasesample();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                Response.Redirect("~/");
            }
        }

        /*
        protected void Register_Callback(object source, CallbackEventArgsBase e)
        {
            var result = from d in dataContext.tb_userAccounts
                         where d.Email == EmailTxt.Text
                         select d.Email;

            if (result.Count() != 0)
            {
                EmailTxt.ErrorText = "Email Already Exists";
                EmailTxt.IsValid = false;
            }

            if (!EmailTxt.Text.Contains("@"))
            {
                EmailTxt.ErrorText = "Invalid Email";
                EmailTxt.IsValid = false;
            }

            if (!EmailTxt.Text.Contains("."))
            {
                EmailTxt.ErrorText = "Invalid Email";
                EmailTxt.IsValid = false;
            }
        }
        */


        bool Valid()
        {
            var result = from d in dataContext.tb_userAccounts
                         where d.Email == EmailTxt.Text
                         select d.Email;

            if (result.Count() != 0)
            {
                EmailTxt.ErrorText = "Email Already Exists";
                EmailTxt.IsValid = false;
                return false;
            }

            if (!EmailTxt.Text.Contains("@"))
            {
                EmailTxt.ErrorText = "Invalid Email";
                EmailTxt.IsValid = false;
                return false;
            }

            if (!EmailTxt.Text.Contains("."))
            {
                EmailTxt.ErrorText = "Invalid Email";
                EmailTxt.IsValid = false;
                return false;
            }
            return true;
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            Thread.Sleep(1000); //delay 1sec for check button disable after click. (to prevent double click)

            if (Valid())
            {
                byte[] salt = Security.CreateSalt();

                tb_userAccount user = new tb_userAccount()
                {
                    Email = EmailTxt.Text,
                    AccessFailedCount = 0,
                    AccountType = "Primary user",
                    AccountVerified = false,
                    RuppertVerified = false,
                    AccountVerifiedDatetime = DateTime.Now,
                    RuppertVerifiedDatetime = DateTime.Now,
                    AccountStatus_Id = 2, // "2" is default which is on hold status.
                    IsTermAccepted = false,
                    PasswordHash = Security.GenerateSaltedHash(Encoding.ASCII.GetBytes(PasswordTxt.Text), salt),
                    PasswordSalt = salt,
                    FirstName = FirstNameText.Text,
                    LastName = LastNameText.Text,
                    Phone = PhoneNumberTxt.Text,
                    Address1 = Address1Txt.Text,
                    Address2 = Address2Txt.Text,
                    City = CityTxt.Text,
                    State = StateCombo.Text,
                    Zip = ZipTxt.Text
                };

                dataContext.tb_userAccounts.InsertOnSubmit(user);
                dataContext.SubmitChanges();

                Session["userEmail"] = EmailTxt.Text;

                Response.Redirect("accountverification.aspx");


            }
        }
    }
}