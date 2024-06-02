using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace techblog.Admin.Login
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
//#if DEBUG
//            string email = "vedakinvn@gmail.com";
//            string password = "123";
//            using (DBDataContext db = new DBDataContext())
//            {
//                var user = db.Authors.FirstOrDefault(u => u.Email == email && u.Password == password);

//                if (user != null)
//                {
//                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, email, DateTime.Now, DateTime.Now.AddMinutes(30), false, user.ID.ToString(), FormsAuthentication.FormsCookiePath);
//                    string encryptedTicket = FormsAuthentication.Encrypt(ticket);
//                    HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
//                    Response.Cookies.Add(authCookie);

//                    string returnUrl = Request.QueryString["ReturnUrl"];
//                    if (string.IsNullOrEmpty(returnUrl))
//                    {
//                        returnUrl = "~/Admin";
//                    }
//                    Response.Redirect(returnUrl);
//                }
//            }
//#endif
            if (!IsPostBack)
            {
                if (Request.QueryString["logout"] != null)
                {
                    Logout();
                }
                if (User.Identity.IsAuthenticated)
                {
                    FormsIdentity formsIdentity = User.Identity as FormsIdentity;
                    if (formsIdentity != null)
                    {
                        FormsAuthenticationTicket ticket = formsIdentity.Ticket;
                        int userId;
                        if (!int.TryParse(ticket.UserData, out userId))
                        {
                            Response.Redirect("~/Admin/Login");
                        }

                        using (DBDataContext db = new DBDataContext())
                        {
                            var user = db.Authors.FirstOrDefault(u => u.ID == userId);

                            if (user != null)
                            {
                                Response.Redirect("~/Admin");
                            }
                        }
                    }
                }
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string email = Email.Text;
            string password = Password.Text;

            using (DBDataContext db = new DBDataContext())
            {
                var user = db.Authors.FirstOrDefault(u => u.Email == email && u.Password == password);

                if (user != null)
                {
                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, email, DateTime.Now, DateTime.Now.AddMinutes(30), false, user.ID.ToString(), FormsAuthentication.FormsCookiePath);
                    string encryptedTicket = FormsAuthentication.Encrypt(ticket);
                    HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
                    Response.Cookies.Add(authCookie);

                    Response.Redirect("~/Admin");
                }
                else
                {
                    lblMessage.Text = "Tài khoản hoặc mật khẩu sai.";
                }
            }
        }
        private void Logout()
        {
            FormsAuthentication.SignOut();

            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, "")
                {
                    Expires = DateTime.Now.AddYears(-1),
                    Path = FormsAuthentication.FormsCookiePath
                };
                Response.Cookies.Add(cookie);
            }
        }
    }
}