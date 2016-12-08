using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;

public partial class thong_tin_dat_hang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //var oProduct = new Product();
        //var dv = oProduct.ProductSelectOne(Request.QueryString["dh"]).DefaultView;
        //lblThanhTien.Text = string.Format("{0:##,###.##}", Convert.ToDecimal(dv[0]["Price"].ToString()) * Convert.ToDecimal(dropSoLuong.SelectedItem.Text)).Replace('.', '*').Replace(',', '.').Replace('*', ',');
        //lblTongCong.Text = string.Format("{0:##,###.##}", Convert.ToDecimal(dv[0]["Price"].ToString()) * Convert.ToDecimal(dropSoLuong.SelectedItem.Text)).Replace('.', '*').Replace(',', '.').Replace('*', ',');
        //lblThanhTien2.Text = string.Format("{0:##,###.##}", Convert.ToDecimal(dv[0]["Price"].ToString()) * Convert.ToDecimal(dropSoLuong.SelectedItem.Text)).Replace('.', '*').Replace(',', '.').Replace('*', ',');
    }
    protected void dropSoLuong_SelectedIndexChanged(object sender, EventArgs e)
    {
        var textbox = (TextBox)sender;
        var parent = textbox.NamingContainer;

        var oShoppingCart = new ShoppingCart();

        var Quantity = (parent.FindControl("txtQuantity") as TextBox).Text.Trim();
        var ProductID = (parent.FindControl("hdnCartProductID") as HiddenField).Value;
        var ProductOptionCategoryID = (parent.FindControl("hdnCartProductOptionCategoryID") as HiddenField).Value;
        var ProductLengthID = (parent.FindControl("hdnCartProductLengthID") as HiddenField).Value;
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

        //var oProduct = new Product();
        //var dv = oProduct.ProductSelectOne(Request.QueryString["dh"]).DefaultView;
        //lblThanhTien.Text = string.Format("{0:##,###.##}", Convert.ToDecimal(dv[0]["Price"].ToString()) * Convert.ToDecimal(dropSoLuong.SelectedItem.Text)).Replace('.', '*').Replace(',', '.').Replace('*', ',');
        //lblTongCong.Text = string.Format("{0:##,###.##}", Convert.ToDecimal(dv[0]["Price"].ToString()) * Convert.ToDecimal(dropSoLuong.SelectedItem.Text)).Replace('.', '*').Replace(',', '.').Replace('*', ',');
        //lblThanhTien2.Text = string.Format("{0:##,###.##}", Convert.ToDecimal(dv[0]["Price"].ToString()) * Convert.ToDecimal(dropSoLuong.SelectedItem.Text)).Replace('.', '*').Replace(',', '.').Replace('*', ',');
    }
    protected void ListView1_DataBound(object sender, EventArgs e)
    {
        var dtCart = Session["Cart"] as DataTable;
        if (dtCart != null)
        {
            var lblTotalPrice = ListView1.FindControl("lblTotalPrice") as Label;
            var hdnTotalPrice = ListView1.FindControl("hdnTotalPrice") as HiddenField;

            var lblSumTotalPrice = ListView1.FindControl("lblSumTotalPrice") as Label;
            var hdnSumTotalPrice = ListView1.FindControl("hdnSumTotalPrice") as HiddenField;
            var lblShippingPrice = ListView1.FindControl("lblShippingPrice") as Label;


            var hdnShippingPrice = ListView1.FindControl("hdnShippingPrice") as HiddenField;

            var iShippingPrice = "0";// Convert.ToDouble(string.IsNullOrEmpty(dv[0]["ShippingPrice"].ToString()) ? "0" : dv[0]["ShippingPrice"].ToString());
            double TotalPrice = 0;
            double SumTotalPrice = 0;
            double ShippingPrice = 0;

            if (lblTotalPrice != null)
            {
                foreach (DataRow dr in dtCart.Rows)
                {
                    var Quantity = Convert.ToInt32(string.IsNullOrEmpty(dr["Quantity"].ToString()) ? 0 : dr["Quantity"]);
                    var Price = Convert.ToDouble(string.IsNullOrEmpty(dr["Price"].ToString()) ? 0 : dr["Price"]);
                    TotalPrice += Quantity * Price;
                }

                ShippingPrice = Convert.ToDouble(iShippingPrice);
                //ShippingPrice = 20000;
                SumTotalPrice = TotalPrice + ShippingPrice;
                hdnTotalPrice.Value = TotalPrice.ToString();
                hdnSumTotalPrice.Value = SumTotalPrice.ToString();
                lblTotalPrice.Text = string.IsNullOrEmpty(TotalPrice.ToString()) ? "<strong>0</strong> VNĐ" : "<strong>" + (string.Format("{0:##,###.##}", TotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> VNĐ";
                lblSumTotalPrice.Text = string.IsNullOrEmpty(SumTotalPrice.ToString()) ? "<strong>0</strong> VNĐ" : "<strong>" + (string.Format("{0:##,###.##}", SumTotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> VNĐ";
                lblTongCong.Text = string.IsNullOrEmpty(SumTotalPrice.ToString()) ? "<strong>0</strong> VNĐ" : "<strong>" + (string.Format("{0:##,###.##}", SumTotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> VNĐ";
                //lblShippingPrice.Text = iShippingPrice.ToString() == "0" ? "<strong>0</strong> vnđ" : "<strong>" + (string.Format("{0:##,###.##}", iShippingPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> vnđ";
                //hdnShippingPrice.Value = ShippingPrice.ToString();
            }
        }
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        var item = e.Item as ListViewDataItem;
        var cmd = e.CommandName;
        if (cmd == "Remove")
        {
            var ProductID = (item.FindControl("hdnCartProductID") as HiddenField).Value;
            var ProductOptionCategoryID = (item.FindControl("hdnCartProductOptionCategoryID") as HiddenField).Value;
            var ProductLengthID = (item.FindControl("hdnCartProductLengthID") as HiddenField).Value;

            var oShoppingCart = new ShoppingCart();
            oShoppingCart.DeleteItem(ProductID, ProductOptionCategoryID, ProductLengthID);
            ListView1.DataBind();
        }
    }

    protected void txtQuantity_TextChanged(object sender, EventArgs e)
    {
        var textbox = (TextBox)sender;
        var parent = textbox.NamingContainer;

        var oShoppingCart = new ShoppingCart();

        var Quantity = (parent.FindControl("txtQuantity") as TextBox).Text.Trim();
        var ProductID = (parent.FindControl("hdnCartProductID") as HiddenField).Value;
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

    protected void btnDatHang_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            var oOrders = new Orders();
            var oOrderDetail = new OrderDetail();
            var oAddressBook = new AddressBook();
            var oProduct = new Product();
            var dv = oProduct.ProductSelectOne(Request.QueryString["dh"]).DefaultView;
            var dtCart = Session["Cart"] as DataTable;
            var OrderNumber = DateTime.Now.ToString("ddMMyy") + Guid.NewGuid().GetHashCode().ToString("X").Substring(0, 4);

            oOrders.OrdersInsert2(
                           OrderNumber,
                           txtEmail.Text,
                           txtEmail.Text,
                           txtFullName.Text,
                           txtPhone.Text,
                           "1",
                           "1",
                           "1",
                           dropTinhThanh.SelectedValue.ToString(),
                           dropListQuan.SelectedValue.ToString(),
                           txtNote.Text,
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

            string Body = "<div style='width: 100%; font-size: 14px; font-family: Arial;'>";
            //Body += "<h3 style='color: rgb(204,102,0); font-size: 22px; border-bottom-color: gray; border-bottom-width: 1px;border-bottom-style: dashed; margin-bottom: 20px; font-family: Times New Roman;'>";
            //Body += "Cảm ơn bạn đã đăng ký tham gia English Camp 2015";
            //Body += "</h3>";
            Body += "<p>Họ và tên: " + txtFullName.Text + "</p>";
            Body += "<p>Email: " + txtEmail.Text + "</p>";
            Body += "<p>Điện thoại: " + txtPhone.Text + "</p>";
            Body += "<p>Địa chỉ: " + txtAddress.Text + "</p>";
            //Body += "<p>Loại địa chỉ: " + dropLoaiDiaChi.SelectedItem.Text + "</p>";
            Body += "<p>Tỉnh/Thành phố: " + dropTinhThanh.SelectedItem.Text + "</p>";
            Body += "<p>Quận/Huyện: " + dropListQuan.SelectedItem.Text + "</p>";
            Body += "</div>";

            Body += "<table style='font-size: 11px; font-family: Verdana; padding: 10px; border: 1px solid #C7D7DB; width: 100%;border-collapse: collapse;' cellpadding='0' cellspacing='0'>";
            //Body += "<tr><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Sản phẩm/Cart Items</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Cỡ/Size</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Số lượng/Qty</th><th align='center' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Giá/Item Price</th><th align='right' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Thành tiền/Item Total</th></tr>";
            Body += "<tr><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Sản phẩm/Cart Items</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Số lượng/Qty</th><th align='center' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Giá/Item Price</th><th align='right' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Thành tiền/Item Total</th></tr>";

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
                Body += "<tr>";
                Body += "<td style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductName + "</td>";
                //Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductColorName + "</td>";
                Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + Quantity + "</td>";
                Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + sPrice + "</td>";
                Body += "<td align='right' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + itemPrice + "</td>";
                Body += "</tr>";
            }
            Body += "</table>";
            Body += "<div style='clear: both;'></div>";
            Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", txtEmail.Text, "marketing.vinacarepharma@gmail.com", "Đặt Hàng MELYGRA", Body, true);

            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {alert('Chúc mừng bạn đã đặt hàng thành công !')});", true);

            txtFullName.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            //dropSoLuong.SelectedIndex = 0;
            txtAddress.Text = "";
            txtNote.Text = "";
            dropTinhThanh.SelectedIndex = 0;
            dropListQuan.SelectedIndex = 0;
            var oShoppingCart = new ShoppingCart();
            oShoppingCart.DeleteAllItem();
            Session["Cart"] = null;
            ListView1.DataBind();
        }
    }
    protected void btnHuy_Click(object sender, EventArgs e)
    {
        //txtFullName.Text = "";
        //txtPhone.Text = "";
        //txtEmail.Text = "";
        //dropSoLuong.SelectedIndex = 0;
        //txtAddress.Text = "";
        ////lblThanhTien.Text = "0";
        ////lblThanhTien2.Text = "0";
        ////lblTongCong.Text = "0";
        //var oProduct = new Product();
        //var dv = oProduct.ProductSelectOne(Request.QueryString["dh"]).DefaultView;
        //lblThanhTien.Text = string.Format("{0:##,###.##}", Convert.ToDecimal(dv[0]["Price"].ToString()) * Convert.ToDecimal(dropSoLuong.SelectedItem.Text)).Replace('.', '*').Replace(',', '.').Replace('*', ',');
        //lblTongCong.Text = string.Format("{0:##,###.##}", Convert.ToDecimal(dv[0]["Price"].ToString()) * Convert.ToDecimal(dropSoLuong.SelectedItem.Text)).Replace('.', '*').Replace(',', '.').Replace('*', ',');
        //lblThanhTien2.Text = string.Format("{0:##,###.##}", Convert.ToDecimal(dv[0]["Price"].ToString()) * Convert.ToDecimal(dropSoLuong.SelectedItem.Text)).Replace('.', '*').Replace(',', '.').Replace('*', ',');
        //dropTinhThanh.SelectedIndex = 0;
        //dropListQuan.SelectedIndex = 0;
        var oShoppingCart = new ShoppingCart();
        oShoppingCart.DeleteAllItem();
        Session["Cart"] = null;
    }

    protected void btnBuyMore_Click(object sender, EventArgs e)
    {
        Response.Redirect("san-pham.aspx");
    }
}