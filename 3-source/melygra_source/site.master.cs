using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Page.Header.DataBind();
            string page = Request.Url.PathAndQuery.ToLower();

            string startScript = "<script type='text/javascript'>";
            string endScript = "')</script>";
            string activePage = "";

            if (page.Contains("san-pham.aspx?ci=") || page.Contains("chi-tiet-san-pham.aspx?pi="))
                activePage = "san-pham.aspx";
            else if (page.Contains("chi-tiet-tin-tuc.aspx?id="))
                activePage = "tin-tuc.aspx";
            else if (!page.EndsWith("default.aspx"))
                activePage = Path.GetFileName(page);

            if (!string.IsNullOrEmpty(activePage))
                runScript.InnerHtml = startScript + "changeActiveMenu('" + activePage + endScript;

            runScript.InnerHtml += startScript + "changeSubActiveMenu('" + Path.GetFileName(page) + endScript;
        }

        lblUserOnline.Text = Application["visitors_online"].ToString();
        lblTatCa.Text = Application["TatCa"].ToString();
    }

    protected string progressTitle(object input)
    {
        return TLLib.Common.ConvertTitle(input.ToString());
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("tim-kiem.aspx?kw=" + txtSearch.Text.Trim());
    }

    protected void btnSearch2_Click(object sender, EventArgs e)
    {
        Response.Redirect("tim-kiem.aspx?kw=" + txtSearch2.Text.Trim());
    }
}
