﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class san_pham_chi_tiet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string strTitle, strDescription, strMetaTitle, strMetaDescription;
            if (!string.IsNullOrEmpty(Request.QueryString["pi"]))
            {
                var oProduct = new Product();
                var dv = oProduct.ProductSelectOne(Request.QueryString["pi"]).DefaultView;

                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];

                strTitle = Server.HtmlDecode(row["ProductName"].ToString());
                strDescription = Server.HtmlDecode(row["Description"].ToString());
                strMetaTitle = Server.HtmlDecode(row["MetaTittle"].ToString());
                strMetaDescription = Server.HtmlDecode(row["MetaDescription"].ToString());

                //hdnSanPham.Value = progressTitle(dv[0]["ProductCategoryName"].ToString()) + "-pci-" + dv[0]["ProductCategoryID"].ToString() + ".aspx";
            }
            else
            {
                strTitle = strMetaTitle = "Sản Phẩm";
                strDescription = "";
                strMetaDescription = "";
            }
            Page.Title = !string.IsNullOrEmpty(strMetaTitle) ? strMetaTitle : strTitle;
            var meta = new HtmlMeta() { Name = "description", Content = !string.IsNullOrEmpty(strMetaDescription) ? strMetaDescription : strDescription };
            Header.Controls.Add(meta);

            //lblName.Text = strTitle;
            //lblSanPham1.Text = strTitle;
            //lblSanPham2.Text = strTitle;
        }
    }

    protected string progressTitle(object input)
    {
        return TLLib.Common.ConvertTitle(input.ToString());
    }

    protected void lstProductDetails_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        var item = e.Item as ListViewDataItem;
        var cmd = e.CommandName;
        var ProductOptionCategoryID = "";//(item.FindControl("hdnProductOptionCategoryID") as HiddenField).Value;
        var ProductOptionCategoryName = "";//(item.FindControl("hdnProductOptionCategoryName") as HiddenField).Value;
        var ProductID = (item.FindControl("hdnProductID") as HiddenField).Value;
        var ProductName = (item.FindControl("lblProductName") as Label).Text;
        var ProductNameEn = "";//(item.FindControl("lblProductNameEn") as Label).Text;
        var ImageName = (item.FindControl("hdnImageName") as HiddenField).Value;
        var ProductCode = "";//(item.FindControl("hdnProductCode") as HiddenField).Value;
        var ProductLengthID = "";//(item.FindControl("hdnProductLengthID") as HiddenField).Value;
        var ProductLengthName = "";//(item.FindControl("hdnProductLengthName") as HiddenField).Value;
        var Quantity = "1";
        double Price = Convert.ToDouble((item.FindControl("hdnPrice") as HiddenField).Value);
        string ProductSizeColorID1 = "";
        string QuantityList = "";
        int SizeColorQuantity1 = 0;
        var oProductSizeColor = new ProductSizeColor();
        var oShoppingCart = new ShoppingCart();

        if (cmd == "AddToCart")
        {
            //try
            //{
            //    if (ProductID != "")
            //    {

            //        if (oShoppingCart.CartSelectOne(ProductID).DefaultView.Count > 0)
            //        {
            //            //var dv = oProductSizeColor.ProductSizeColorSelectAll(ProductLengthID, ProductOptionCategoryID, ProductID, "True",
            //            //                                                 "True", "", "True").DefaultView;
            //            //ProductSizeColorID1 = dv[0]["ProductSizeColorID"].ToString();
            //            //SizeColorQuantity1 = Convert.ToInt32(dv[0]["Quantity"].ToString()) - Convert.ToInt32(dv[0]["QuantitySale"].ToString());
            //            //for (int i = 1; i <= SizeColorQuantity1; i++)
            //            //{
            //            //    QuantityList = QuantityList + i + ",";
            //            //}
            //            var dv = oShoppingCart.CartSelectOne(ProductID).DefaultView;
            //            int iQuantityAdd = Convert.ToInt32(dv[0]["Quantity"].ToString()) + 1;
            //            oShoppingCart.UpdateQuantity(ProductID, ProductLengthID, ProductOptionCategoryID,
            //                iQuantityAdd.ToString());
            //        }
            //        else
            //        {
            //            oShoppingCart.CreateCart(ProductID,
            //            ImageName,
            //            ProductName,
            //            ProductNameEn,
            //            ProductCode,
            //            ProductOptionCategoryID,
            //            ProductOptionCategoryName,
            //            ProductLengthID,
            //            ProductLengthName,
            //            ProductSizeColorID1,
            //            Quantity,
            //            SizeColorQuantity1.ToString(),
            //            Price,
            //            false
            //            );
            //        }
            //    }

            //}
            //catch (Exception ex)
            //{

            //}

            oShoppingCart.CreateCart(ProductID,
                        ImageName,
                        ProductName,
                        ProductNameEn,
                        ProductCode,
                        ProductOptionCategoryID,
                        ProductOptionCategoryName,
                        ProductLengthID,
                        ProductLengthName,
                        ProductSizeColorID1,
                        Quantity,
                        SizeColorQuantity1.ToString(),
                        Price,
                        false
                        );

            //ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", "myconfirmPopup('" + "<strong>" + ProductName + " - " + ProductCode + " - " + ProductOptionCategoryName + "</strong><br/> đã được thêm vào giỏ hàng" + "')", true);
            Response.Redirect("thong-tin-dat-hang.aspx");
        }
    }
}