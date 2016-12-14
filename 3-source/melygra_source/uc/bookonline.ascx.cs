using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI.AutoCompleteBox;
using TLLib;

public partial class uc_bookonline : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            dropListLoaiHang.SelectedIndex = -1;
        }
    }

    private void sendEmail()
    {
        var dtCart = Session["Cart2"] as DataTable;

        string msg = "<h3>MELYGRA: LIÊN HỆ</h3><br/>";
        msg += "<b>Loại hàng: </b>" + dropListLoaiHang.SelectedItem.Text.ToString() + "<br />";
        msg += "<b>Họ và tên: </b>" + txtHoTen.Text.Trim().ToString() + "<br />";
        msg += "<b>Số điện thoại: </b>" + txtPhone.Text.Trim().ToString() + "<br />";
        msg += "<b>Email: </b>" + txtEmail.Text.Trim().ToString() + "<br /><br />";
        //msg += "<b>Ghi chú: </b>" + txtContent.Text.Trim().ToString() + "<br /><br />";
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
        Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", "marketing.vinacarepharma@gmail.com", "", "Contact MELYGRA", msg, true);

    }
    protected void DropDownList_DataBound(object sender, EventArgs e)
    {
        var ddl = (DropDownList)sender;
        ddl.Items.Insert(0, new ListItem("-- Loại hàng --", ""));
    }
    protected void btGui_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (RadCaptcha1.IsValid)
            {
                var oOrders = new Orders();
                var oOrderDetail = new OrderDetail();
                var dtCart = Session["Cart2"] as DataTable;
                var OrderNumber = DateTime.Now.ToString("ddMMyy") + Guid.NewGuid().GetHashCode().ToString("X").Substring(0, 4);

                oOrders.OrdersInsert2(
                               OrderNumber,
                               txtEmail.Text,
                               txtEmail.Text,
                               txtHoTen.Text,
                               txtPhone.Text,
                               "1",
                               "1",
                               "1",
                               "",
                               "",
                               "",
                               "",
                               "1",
                               "",
                               txtAddress.Text,
                               "1"
                               );

                foreach (DataRow dr in dtCart.Rows)
                {
                    string ProductID = dr["ProductID"].ToString();
                    string Quantity = dr["Quantity"].ToString();
                    string Price = dr["Price"].ToString();
                    string CreateBy = txtEmail.Text;
                    //string ProductName = dr["ProductName"].ToString();

                    oOrderDetail.OrderDetailInsert(
                       OrderNumber,
                       ProductID,
                       Quantity,
                       Price,
                       CreateBy,
                       "",
                       ""
                    );
                }

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
                txtAddress.Text = "";
                txtEmail.Text = "";
                ShoppingCart2 shopCart2 = new ShoppingCart2();
                shopCart2.DeleteAllItem();
                Session["Cart2"] = null;
            }
            
        }
        else
        {
            //lblCheckResult.Text = "Chuỗi xác nhận chưa đúng !";
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {$('.btn-popup').trigger('click');});", true);
        }
    }
    protected void dropListLoaiHang_SelectedIndexChanged(object sender, EventArgs e)
    {
        var oShoppingCart = new ShoppingCart2();
        var oProduct = new Product();
        var dataPrice = oProduct.ProductSelectOne(dropListLoaiHang.SelectedItem.Value.ToString()).DefaultView;
        double Price = Convert.ToDouble(dataPrice[0]["Price"].ToString());
        if (dropListLoaiHang.SelectedItem.Value != null && dropListLoaiHang.SelectedItem.Value != "")
        {
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
                Price,
                false);
        }
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

    protected void txtQuantity_TextChanged(object sender, EventArgs e)
    {
        var textbox = (TextBox)sender;
        var parent = textbox.NamingContainer;

        var oShoppingCart = new ShoppingCart2();

        var Quantity = (parent.FindControl("txtQuantity") as TextBox).Text.Trim();
        var ProductID = (parent.FindControl("hdnProductID") as HiddenField).Value;
        var ProductOptionCategoryID = "";//(parent.FindControl("hdnCartProductOptionCategoryID") as HiddenField).Value;
        var ProductLengthID = "";//(parent.FindControl("hdnCartProductLengthID") as HiddenField).Value;
        int Quantity1 = Int32.Parse(Quantity);
        if (Quantity1 > 0 && Quantity1 < 12)
        {
            oShoppingCart.UpdateQuantity(ProductID, ProductLengthID, ProductOptionCategoryID, Quantity);
            ListView1.DataBind();
        }
        else
        {
            Quantity = "1";
            ScriptManager.RegisterClientScriptBlock((TextBox)sender, sender.GetType(), "runtime", "alert('Bạn nhập quá số lượng cho phép (1 - 12)')", true);
        }
    }
}