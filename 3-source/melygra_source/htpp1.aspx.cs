using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class htpp1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["pvi"]))
            {
                var oProvince = new Province();
                var dv = oProvince.ProvinceSelectOne(Request.QueryString["pvi"]).DefaultView;

                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];

                lblThanhPho.Text = Server.HtmlDecode(row["ProvinceName"].ToString());

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

    protected string progressTitle(object input)
    {
        return TLLib.Common.ConvertTitle(input.ToString());
    }
}