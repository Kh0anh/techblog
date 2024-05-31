using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using techblog.ViewModels;

namespace techblog
{
    public partial class _Post : Page
    {
        public EntryViewModel Entry { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Entry = null;

            int ID;
            if (Request.QueryString["start"] != null && int.TryParse(Request.QueryString["id"], out ID))
            {
                LoadEntry(ID);
            }
        }

        private void LoadEntry(int ID)
        {
            using (var db = new DBDataContext())
            {
                var _Entry = db.Entries.First(e => e.ID == ID);
                Entry = new EntryViewModel
                {
                    Title = _Entry.Title,
                    DateTime = _Entry.CreatedAt,
                    Content = _Entry.Content,
                    Author = new AuthorViewModel { ID = _Entry.Author.ID, Author = String.Format("{0} {1}", _Entry.Author.FirstName, _Entry.Author.LastName) },
                    Categories = (from c in db.CategoryEntries
                                  where c.EntryID == _Entry.ID
                                  select new CategoryViewModel { ID = c.Category.ID, CategoryName = c.Category.Name }).ToList()
                };
            }
        }
    }
}