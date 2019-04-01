//Written by Myungsik Kim

using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace portpolio.login
{
    public partial class Registration : System.Web.UI.Page
    {
        public databasesample dataContext = new databasesample();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public class ClearButton : EditButton
        {
            public ClearButtonDisplayMode DisplayMode { get; set; }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            Thread.Sleep(1000); //delay 1sec for check button disable after click. (to prevent double click)

            var account = (from d in dataContext.tb_userAccounts
                           where d.Email == EmailTxt.Text
                           select d).FirstOrDefault();

            tb_login_log log = new tb_login_log()
            {
                Email = EmailTxt.Text,
                dateTime = DateTime.Now,
                Result = "default log",
                IpAddress = Request.UserHostAddress
            };

            if (account != null)
            {
                if (account.PasswordHash == Security.GenerateSaltedHash(Encoding.ASCII.GetBytes(PasswordTxt.Text), account.PasswordSalt.ToArray())) //if password is correct
                {
                    if (account.AccountStatus_Id == 1) // 1 is active.
                    {
                        log.Result = "User(status 1) Log in success";
                        account.AccessFailedCount = 0; //To reset # of log in attemp failure.
                        dataContext.tb_login_logs.InsertOnSubmit(log);
                        dataContext.SubmitChanges();

                        Session["email"] = EmailTxt.Text; //session start
                        Response.Redirect("~/");

                        //FormsAuthentication.RedirectFromLoginPage(EmailTxt.Text, true); //redirect to Default.aspx
                    }
                    else if ((account.AccountStatus_Id == 2) || (account.AccountStatus_Id == 3)) // 2,3 is on hold
                    {
                        log.Result = "User(status 2,3) Log in success";
                        account.AccessFailedCount = 0; //To reset # of log in attemp failure.

                        dataContext.tb_login_logs.InsertOnSubmit(log);
                        dataContext.SubmitChanges();

                        Session["emailVerify"] = EmailTxt.Text; //session start
                        Response.Redirect("emailVerification.aspx");
                    }
                    else if ((account.AccountStatus_Id == 12) || (account.AccountStatus_Id == 13)) // 12,13 is forgot password, but enter correct password.
                    {
                        if (account.AccountVerified == true) //if true. this user is active user.
                        {
                            account.AccessFailedCount = 0; //To reset # of log in attemp failure.
                            account.AccountStatus_Id = 1; //even if status is 12 or 13. If password is correct, status change to 1.
                            log.Result = "User(status 12,13) with verified account, log in success. Status change to 1(active) and login to main page.";

                            dataContext.tb_login_logs.InsertOnSubmit(log);
                            dataContext.SubmitChanges();

                            Session["email"] = EmailTxt.Text; //session start
                            Response.Redirect("~/");
                        }
                        else if (account.AccountVerified == false) //if false. this user require account verify.
                        {
                            account.AccessFailedCount = 0; //To reset # of log in attemp failure.
                            account.AccountStatus_Id = 3; //status change to 3 and move to emailverification page.
                            log.Result = "User(status 12,13) without verified account, log in success. Status change to 3(on Hold) and move to email verification page.";

                            dataContext.tb_login_logs.InsertOnSubmit(log);
                            dataContext.SubmitChanges();

                            Session["emailVerify"] = EmailTxt.Text; //session start
                            Response.Redirect("emailVerification.aspx");
                        }
                    }
                    else if (account.AccountStatus_Id == 99) // 99 is locked.
                    {
                        log.Result = "Account locked";
                        MessageTxt.Text = "Access denied";
                    }
                    else //invalid account status.
                    {
                        log.Result = "attemp to login with invalid account status";
                        MessageTxt.Text = "Access denied";
                    }
                }
                else // if password is incorrect.
                {
                    if (account.AccessFailedCount < 3) //increase # of attemp to login with incorrect password until 3 times.
                    {
                        account.AccessFailedCount++;
                    }

                    if (account.AccessFailedCount == 1)
                    {
                        log.Result = "Incorrect Password (1)";
                        MessageTxt.Text = "Email or Password incorrect.(1)";
                    }

                    if (account.AccessFailedCount == 2)
                    {
                        log.Result = "Incorrect Password (2)";
                        MessageTxt.Text = "Email or Password incorrect.(2) If you failed one more time, your accout will be locked.";
                    }

                    if (account.AccessFailedCount == 3)
                    {
                        log.Result = "Incorrect Password (3) status change to locked";
                        account.AccountStatus_Id = 99; //account status change to 99 (locked).
                        MessageTxt.Text = "Email or Password Incorrect.(3) your accout is locked.";
                    }

                    if (account.AccessFailedCount > 3)
                    {
                        log.Result = "Account locked due to incorrect password";
                        MessageTxt.Text = "Access Denied";
                    }
                }
            }

            else //if account == null
            {
                MessageTxt.Text = "Invalid email or password.";
            }

            dataContext.tb_login_logs.InsertOnSubmit(log);
            dataContext.SubmitChanges();
        }
    }
}