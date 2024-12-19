using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class ClassAlbum : Page
    {
        protected ListView lvPhotos;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPhotos();
            }
        }

        private void LoadPhotos()
        {
            var photos = new List<PhotoItem>
            {
                new PhotoItem { ImageUrl = ResolveUrl("Images/class1.jpg"), Title = "春游活动" },
                new PhotoItem { ImageUrl = ResolveUrl("~/Content/Images/class2.jpg"), Title = "运动会合影" },
                new PhotoItem { ImageUrl = ResolveUrl("~/Content/Images/class3.jpg"), Title = "课堂学习" },
                new PhotoItem { ImageUrl = ResolveUrl("~/Content/Images/class4.jpg"), Title = "元旦晚会" },
                new PhotoItem { ImageUrl = ResolveUrl("~/Content/Images/class5.jpg"), Title = "班级聚餐" },
                new PhotoItem { ImageUrl = ResolveUrl("~/Content/Images/class6.jpg"), Title = "毕业典礼" }
            };

            lvPhotos.DataSource = photos;
            lvPhotos.DataBind();
        }
    }

    public class PhotoItem
    {
        public string ImageUrl { get; set; }
        public string Title { get; set; }
    }
}