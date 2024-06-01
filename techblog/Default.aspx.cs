using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using techblog.ViewModels;

namespace techblog
{
    public partial class _Default : Page
    {
        public EntryListViewModel EntryList { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (EntryList == null)
            {
                LoadEntrys();
            }

            int c;
            if (Request.QueryString["start"] != null && int.TryParse(Request.QueryString["start"], out c))
            {
                if (EntryList.PageCount > c)
                {
                    EntryList.CurrentPage = c;
                }
            }
        }

        private void LoadEntrys()
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
                                                  Content = RecentPosts.Content,
                                                  Author = new AuthorViewModel { ID = RecentPosts.Author.ID, Author = String.Format("{0} {1}", RecentPosts.Author.FirstName, RecentPosts.Author.LastName) },
                                                  Categories = (from c in db.CategoryEntries
                                                                where c.EntryID == RecentPosts.ID
                                                                select new CategoryViewModel { ID = c.Category.ID, CategoryName = c.Category.CategoryName }).ToList()
                                              })
                           .ToList();
                EntryList = new EntryListViewModel
                {
                    Posts = Posts,
                    CurrentPage = 0
                };
            }
        }
    }
}