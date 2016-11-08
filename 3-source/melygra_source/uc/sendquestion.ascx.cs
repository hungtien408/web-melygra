using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;

public partial class sendquestion : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSendAnswer_Click(object sender, EventArgs e)
    {
        if (RadCaptcha1.IsValid)
        {
            var oComment = new Comment();
            int i = oComment.CommentInsert(txtHoTen.Text.Trim(), "", txtTitle.Text.Trim(), "", "", txtEmail.Text.Trim(),
                txtNoiDung.Text.Trim(), "", "", "", "", "", "");
            if (i > 0)
            {
                txtTitle.Text = "";
                txtHoTen.Text = "";
                txtEmail.Text = "";
                txtNoiDung.Text = "";
                lblMessage.Text = "Gửi câu hỏi thành công !";
            }
        }
    }
}