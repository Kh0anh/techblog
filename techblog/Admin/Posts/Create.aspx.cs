using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using techblog.ViewModels;

namespace techblog.Admin.Posts
{
    public partial class Create : System.Web.UI.Page
    {
        public AuthorViewModel Author { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Author == null)
            {
                if (!User.Identity.IsAuthenticated)
                {
                    Response.Redirect("~/Admin/Login");
                }


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
                            Author = new AuthorViewModel
                            {
                                ID = user.ID,
                                Email = user.Email,
                                FirstName = user.FirstName,
                                LastName = user.LastName,
                                Role = user.Role
                            };
                        }
                        else
                        {
                            Response.Redirect("~/Admin/Login");
                        }
                    }
                }
                else
                {
                    Response.Redirect("~/Admin/Login");
                }
            }
        }
        protected void ContentValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (string.IsNullOrWhiteSpace(PostContent.Value))
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}