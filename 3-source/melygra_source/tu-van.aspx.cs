using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class tu_van : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "Tư Vấn Chuyên Gia";
            var meta = new HtmlMeta()
            {
                Name = "description",
                Content = "Tư Vấn Chuyên Gia"
            };
            Header.Controls.Add(meta);
        }
    }
}