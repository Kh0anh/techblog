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
    public partial class Default : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                BindPosts();
            }
        }

        private void BindPosts()
        {
            using (var db = new DBDataContext())
            {
                List<EntryViewModel> Posts = (from RecentPosts in db.Entries
                                              orderby RecentPosts.CreatedAt descending
                                              select new EntryViewModel
                                              {
                                                  ID = RecentPosts.ID,
                                                  Title = RecentPosts.Title,
                                                  DateTime = RecentPosts.CreatedAt,
                                                  Categories = (from c in db.CategoryEntries
                                                                where c.EntryID == RecentPosts.ID
                                                                select new CategoryViewModel { ID = c.Category.ID, CategoryName = c.Category.Name }).ToList()
                                              })
                              .ToList();

                PostsGridView.DataSource = Posts;
                PostsGridView.DataBind();
            }
        }
    }
}