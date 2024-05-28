using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace techblog.Manage
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = UserName.Text;
            string password = Password.Text;

            //using (DBDataContext db = new DBDataContext())
            //{
            //    var user = db.Users.FirstOrDefault(u => u.UserName == username && u.Password == password);

            //    if (user != null)
            //    {
            //        // User found, set authentication cookie
            //        FormsAuthentication.SetAuthCookie(username, false);

            //        // Optionally, store user information in the session
            //        Session["UserID"] = user.ID;
            //        Session["UserName"] = user.UserName;
            //        Session["FullName"] = user.FullName;

            //        // Redirect to the protected page
            //        Response.Redirect("Post.aspx");
            //    }
            //    else
            //    {
            //        lblMessage.Text = "Tài khoản hoặc mật khẩu sai.";
            //    }
            //    Response.Redirect("Post.aspx");
            //}
        }
    }
}