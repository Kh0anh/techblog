﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace techblog.ViewModels
{
    public class AuthorViewModel : EntryListViewModel
    {
        public int ID { get; set; }
        public string Author { get; set; }
    }
}