using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Diagnostics;
using techblog.ViewModels;

namespace techblog.Admin.Posts
{
    public partial class Create : System.Web.UI.Page
    {
        public AuthorViewModel Author { get; set; }

        //public List<CategoryViewModel> _ListCategory = new List<CategoryViewModel>();
        //public List<CategoryViewModel> ListCategory
        //{
        //    set
        //    {
        //        _ListCategory = value;

        //        string text = string.Empty;
        //        for (int i = 0; i < _ListCategory.Count; i++)
        //        {
        //            text += _ListCategory[i].CategoryName;
        //            if (i < _ListCategory.Count - 1)
        //            {
        //                text += ", ";
        //            }
        //        }
        //        CategoriesList.Text = text;
        //    }
        //    get
        //    {
        //        return _ListCategory;
        //    }
        //}
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

            BindCategoriesDropdown();
        }
        private void BindCategoriesDropdown()
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
                CategoryDropdown.DataSource = Categories;
                CategoryDropdown.DataTextField = "CategoryName";
                CategoryDropdown.DataValueField = "ID";
                CategoryDropdown.DataBind();
                CategoryDropdown.Items.Insert(0, new ListItem("-- Chọn --", ""));
            }
        }
        protected void btnPublish_Click(object sender, EventArgs e)
        {
            using (DBDataContext db = new DBDataContext())
            {
                DateTime date = DateTime.Now;
                Entry _entry = new Entry
                {
                    AuthorID = Author.ID,
                    Title = textTitle.Text,
                    Content = HttpUtility.HtmlDecode(Request.Form["PostContent"]),
                    Status = StatusDropDownList.Text == "Published" ? (byte)1 : (byte)0,
                    UpdatedAt = date,
                    CreatedAt = date
                };
                textTitle.Text = "";

                db.Entries.InsertOnSubmit(_entry);
                db.SubmitChanges();

                List<Category> cList = (from _Category in db.Categories
                                            select _Category).ToList();

                Random random = new Random();
                int randomNumber = random.Next(0, cList.Count());
                int id;
                //if (int.TryParse(CategoryDropdown.SelectedValue, out id))
                if (true)
                {
                    CategoryEntry ce = new CategoryEntry
                    {
                        EntryID = _entry.ID,
                        CategoryID = cList[randomNumber].ID
                    };

                    db.CategoryEntries.InsertOnSubmit(ce);
                    db.SubmitChanges();
                }
            }
        }

        //protected void btnSelect_Click(object sender, EventArgs e)
        //{
        //    using (DBDataContext db = new DBDataContext())
        //    {
        //        int id;
        //        if (int.TryParse(CategoryDropdown.SelectedValue, out id))
        //        {
        //            var o = db.Categories.SingleOrDefault(c => c.ID == id);
        //            ListCategory.Add(new CategoryViewModel
        //            {
        //                CategoryName = o.CategoryName,
        //                ID = o.ID
        //            });
        //        }
        //    }
        //}
    }
}