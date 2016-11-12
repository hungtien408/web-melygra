﻿using System;
using System.Collections.Generic;
using System.Data;
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
        var dtCart = Session["Cart2"] as DataTable;

        string msg = "<h3>MELYGRA: LIÊN HỆ</h3><br/>";
        msg += "<b>Loại hàng: </b>" + dropListLoaiHang.SelectedItem.Text.ToString() + "<br />";
        msg += "<b>Họ và tên: </b>" + txtHoTen.Text.Trim().ToString() + "<br />";
        msg += "<b>Số điện thoại: </b>" + txtPhone.Text.Trim().ToString() + "<br />";
        msg += "<b>Email: </b>" + txtEmail.Text.Trim().ToString() + "<br /><br />";
        msg += "<table style='font-size: 11px; font-family: Verdana; padding: 10px; border: 1px solid #C7D7DB; width: 100%;border-collapse: collapse;' cellpadding='0' cellspacing='0'>";
        //Body += "<tr><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Sản phẩm/Cart Items</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Cỡ/Size</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Số lượng/Qty</th><th align='center' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Giá/Item Price</th><th align='right' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Thành tiền/Item Total</th></tr>";
        msg += "<tr><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Sản phẩm/Cart Items</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Số lượng/Qty</th></tr>";

        foreach (DataRow dr in dtCart.Rows)
        {
            string ProductCode = dr["Tag"].ToString();
            string ProductID = dr["ProductID"].ToString();
            string ProductName = dr["ProductName"].ToString();
            string Quantity = dr["Quantity"].ToString();
            string Price = dr["Price"].ToString();
            string ProductOptionCategoryName = dr["ProductOptionCategoryName"].ToString();
            string ProductLengthName = dr["ProductLengthName"].ToString();
            double tPrice = Convert.ToDouble(Price) * Convert.ToDouble(Quantity);

            var itemPrice = string.Format("{0:##,###.##}", tPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VND";
            var sPrice = string.Format("{0:##,###.##}", dr["Price"]).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VND";
            //Amount += Convert.ToDouble(Price) * Convert.ToDouble(Quantity);
            msg += "<tr>";
            msg += "<td style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductName + "</td>";
            //Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductColorName + "</td>";
            msg += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + Quantity + "</td>";
            //msg += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + sPrice + "</td>";
            //msg += "<td align='right' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + itemPrice + "</td>";
            msg += "</tr>";
        }
        msg += "</table>";
        msg += "<div style='clear: both;'></div>";
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
    protected void dropListLoaiHang_SelectedIndexChanged(object sender, EventArgs e)
    {
        var oShoppingCart = new ShoppingCart2();
        oShoppingCart.CreateCart(
            dropListLoaiHang.SelectedItem.Value, 
            "", 
            dropListLoaiHang.SelectedItem.Text, 
            "", 
            "", 
            "", 
            "", 
            "", 
            "", 
            "", 
            "1", 
            "", 
            0, 
            false);
        ListView1.DataBind();
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {

        var item = e.Item as ListViewDataItem;

        var cmd = e.CommandName;
        if (cmd == "Remove")
        {
            var Quantity = (item.FindControl("hdnQuantity") as HiddenField).Value;
            var ProductID = (item.FindControl("hdnProductID") as HiddenField).Value;

            var oShoppingCart = new ShoppingCart2();
            oShoppingCart.DeleteItem(ProductID);
            ListView1.DataBind();
        }
    }
}