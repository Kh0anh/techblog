using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace techblog.Models
{
    public class rPost
    {
        public int ID { get; set; }
        public string Author { get; set; }
        public string Title { get; set; }

        public string Description  { get; set; }
        public string Content { get; set; }
        public string CreateAt { get; set; }
        public int View { get; set; }
        public string Image { get; set; }
    }
}