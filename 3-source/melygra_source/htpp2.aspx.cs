using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class htpp2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["pvi"]))
            {
                var oProvince = new Province();
                var oDistrict = new District();
                var dv = oProvince.ProvinceSelectOne(Request.QueryString["pvi"]).DefaultView;
                var dv2 = oDistrict.DistrictSelectOne(Request.QueryString["dsi"]).DefaultView;

                lblThanhPhoQuan.Text = dv[0]["ProvinceName"].ToString() + " - " + dv2[0]["DistrictName"].ToString();

            }

            Page.Title = "Hệ Thống Phân Phối";
            var meta = new HtmlMeta()
            {
                Name = "description",
                Content = "Hệ Thống Phân Phối"
            };
            Header.Controls.Add(meta);
        }
    }
}