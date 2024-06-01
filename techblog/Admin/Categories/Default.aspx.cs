using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using techblog.ViewModels;

namespace techblog.Admin.Categories
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

            if (Request.QueryString["delete"] != null)
            {
                int id;
                if (int.TryParse(Request.QueryString["delete"], out id))
                {
                    using (var db = new DBDataContext())
                    {
                        db.Categories.DeleteOnSubmit(db.Categories.SingleOrDefault(c => c.ID == id));
                        db.SubmitChanges();
                        Response.Redirect("#");
                    }
                }

            }
            BindCategoriesGrid();
        }

        private void BindCategoriesGrid()
        {
            using (var db = new DBDataContext())
            {
                List<CategoryViewModel> Categories = (from _Category in db.Categories
                                                      select new CategoryViewModel
                                                      {
                                                          ID = _Category.ID,
                                                          CategoryName = _Category.CategoryName
                                                      })
                              .ToList();
                CategoriesGridView.DataSource = Categories;
                CategoriesGridView.DataBind();
            }
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            using (DBDataContext db = new DBDataContext())
            {
                string name = CategoryName.Text;
                Category c = new Category
                {
                    CategoryName = name
                };
                db.Categories.InsertOnSubmit(c);
                db.SubmitChanges();
                Response.Redirect("#");
            }
        }
    }
}