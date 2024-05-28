using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace techblog.ViewModels
{
    public class CategoryViewModel : EntryListViewModel
    {
        public int ID { get; set; }
        public string CategoryName { get; set; }
    }
}