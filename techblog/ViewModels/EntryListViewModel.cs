using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace techblog.ViewModels
{
    public class EntryListViewModel
    {
        public List<EntryViewModel> Posts;
        public int CurrentPage { get; set; }
        public int PageCount { get; set; }
    }
}