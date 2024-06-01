using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using techblog.ViewModels;

namespace techblog.Admin
{
    public partial class _Default : Page
    {
        public int PostCount = 10;
        public int CategoryCount = 8;
        public int AuthorCount = 3;

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
                GetCount();
                BindRecentPosts();
                BindCategories();
            }
        }

        private void GetCount()
        {
            using (var db = new DBDataContext())
            {
                PostCount = db.Entries.Count();
                CategoryCount = db.Categories.Count();
                AuthorCount = db.Authors.Count();
            }
        }

        private void BindRecentPosts()
        {
            using (var db = new DBDataContext())
            {
                List<EntryViewModel> Posts = (from RecentPosts in db.Entries
                                              orderby RecentPosts.CreatedAt descending
                                              select new EntryViewModel
                                              {
                                                  Title = RecentPosts.Title,
                                                  DateTime = RecentPosts.CreatedAt,
                                                  Categories = (from c in db.CategoryEntries
                                                                where c.EntryID == RecentPosts.ID
                                                                select new CategoryViewModel { ID = c.Category.ID, CategoryName = c.Category.CategoryName }).ToList()
                                              }).Take(10)
                              .ToList();

                RecentPostsGrid.DataSource = Posts;
                RecentPostsGrid.DataBind();
            }
        }

        private void BindCategories()
        {
            using (var db = new DBDataContext())
            {
                List<CategoryViewModel> Categories = (from Categorie in db.Categories
                                                      select new CategoryViewModel
                                                      {
                                                          ID = Categorie.ID,
                                                          CategoryName = Categorie.CategoryName
                                                      })
                           .ToList();

                NewPostCategory.DataSource = Categories;
                NewPostCategory.DataTextField = "ID";
                NewPostCategory.DataValueField = "CategoryName";
                NewPostCategory.DataBind();

            }
        }

        protected void SaveNewPostButton_Click(object sender, EventArgs e)
        {
            try
            {
                using (var db = new DBDataContext())
                {
                    Entry entry = new Entry
                    {
                        //AuthorID = ""
                    };
                }
            }
            catch { }
        }
    }
}