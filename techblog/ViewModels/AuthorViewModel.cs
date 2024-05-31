using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace techblog.ViewModels
{
    public class AuthorViewModel : EntryListViewModel
    {
        public int ID { get; set; }
        public string Author { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int Role { get; set; }
    }
}