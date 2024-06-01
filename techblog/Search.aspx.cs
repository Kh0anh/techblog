using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using techblog.ViewModels;
namespace techblog
{
    public partial class Search : System.Web.UI.Page
    {
        public EntryListViewModel EntryList { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadAllEntry();

            if (Request.QueryString["category"] != null)
            {
                int id;
                if (int.TryParse(Request.QueryString["category"], out id))
                {
                    FindByCategory(id);
                }

            }
            if (Request.QueryString["author"] != null)
            {
                int id;
                if (int.TryParse(Request.QueryString["author"], out id))
                {
                    FindByAuthor(id);
                }
            }
            if (Request.QueryString["content"] != null)
            {
                FindByConten(Request.QueryString["content"]);
            }

            if (Request.QueryString["title"] != null)
            {
                FindByTitle(Request.QueryString["title"]);
            }
        }
        private void LoadAllEntry()
        {
            using (DBDataContext db = new DBDataContext())
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
        private void FindByCategory(int id)
        {
            EntryList.Posts = EntryList.Posts.Where(e => {
                var category = e.Categories.FirstOrDefault(c => c.ID == id);
                return category != null && category.ID == id;
            })
    .ToList();
        }
        private void FindByAuthor(int id)
        {
            EntryList.Posts = EntryList.Posts.Where(e => e.Author.ID == id).ToList();
        }
        private void FindByTitle(string content)
        {
            EntryList.Posts = EntryList.Posts.Where(e => e.Title.Contains(content)).ToList();
        }

        private void FindByConten(string content)
        {
            EntryList.Posts = EntryList.Posts.Where(e => e.Title.Contains(content)).ToList();
        }
    }
}