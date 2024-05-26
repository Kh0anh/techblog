using System;
using System.Collections.Generic;
using System.Linq;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace techblog.Manage
{
    public partial class Post : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] == null || Session["Username"] == null || Session["FullName"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                SayHello.Text = String.Format("Xin chào, {0}",Session["FullName"].ToString());
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string rawContent = Request.Form["PostContent"];
            string Content = HttpUtility.HtmlDecode(rawContent);
            byte[] Image = FileUploadImage.FileBytes;
            string Title = PostTitle.Text;
            string Description = PostDescription.Text;

            if (Image.Length == 0)
            {
                Image = BitmapToByteArray(Properties.Resources.noimage);
            }

            using (DBDataContext db = new DBDataContext())
            {

            }
        }

        protected void ValidateFileUpload(object source, ServerValidateEventArgs args)
        {
            if (FileUploadImage.HasFile)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        private static byte[] BitmapToByteArray(Bitmap bitmap)
        {
            using (MemoryStream memoryStream = new MemoryStream())
            {
                bitmap.Save(memoryStream, ImageFormat.Png);
                return memoryStream.ToArray();
            }
        }
    }
}