﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;

public partial class uc_bookonline : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void sendEmail()
    {
        string msg = "<h3>MELYGRA: LIÊN HỆ</h3><br/>";
        msg += "<b>Loại hàng: </b>" + dropListLoaiHang.SelectedItem.Text.ToString() + "<br />";
        msg += "<b>Họ và tên: </b>" + txtHoTen.Text.Trim().ToString() + "<br />";
        msg += "<b>Số điện thoại: </b>" + txtPhone.Text.Trim().ToString() + "<br />";
        msg += "<b>Email: </b>" + txtEmail.Text.Trim().ToString() + "<br />";
        Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", "vinacarepharma@gmail.com", "", "Contact MELYGRA", msg, true);
    }
    protected void btGui_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (RadCaptcha1.IsValid)
            {

                //send email         
                sendEmail();
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {alert('Cám ơn bạn đã đặt hàng online. Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất!')});", true);
                //lblMessage.Text = "Cám ơn bạn đã liên lạc với chúng tôi. Thông báo của bạn đã được gửi đi. Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất!";
                //lblMessage.Visible = true;
                //lblCheckResult.Text = "";
                //
                //Clear text
                //
                txtHoTen.Text = "";
                txtPhone.Text = "";
                txtEmail.Text = "";
            }
            else
            {
                //lblCheckResult.Text = "Chuỗi xác nhận chưa đúng !";
            }
        }
    }
}