using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace techblog.ViewModels
{
    public class EntryViewModel
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }

        public string Status { get; set; }
        public AuthorViewModel Author { get; set; }
        public List<CategoryViewModel> Categories { get; set; }
        public DateTime DateTime { get; set; }
    }
}