<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="bi-kip-phong-the.aspx.cs" Inherits="bi_kip_phong_the" %>
<%@ Register TagPrefix="uc2" TagName="video" Src="~/uc/video.ascx" %>
<%@ Register TagPrefix="uc3" TagName="bookonline" Src="~/uc/bookonline.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="colContent">
        <div class="title-main bor-bot bg1">
            <h1>
                Bí quyết phòng the</h1>
        </div>
        <div class="bikip-main">
            <asp:ListView ID="lstBiKipPhongThe" runat="server" DataSourceID="odsBiKipPhongThe"
                EnableModelValidation="True">
                <ItemTemplate>
                    <div class="bikip-item">
                        <div class="bikip-img">
                            <a href='<%# progressTitle(Eval("ProductName")) + "-bk-" + Eval("ProductID") + ".aspx" %>'>
                                <img id="Img2" alt='<%# Eval("ProductName") %> ' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                    visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                    runat="server" /></a>
                        </div>
                        <div class="bikip-name">
                            <a href='<%# progressTitle(Eval("ProductName")) + "-bk-" + Eval("ProductID") + ".aspx" %>'>
                                <%# Eval("ProductName") %></a>
                        </div>
                        <div class="view-box">
                            <a href='<%# progressTitle(Eval("ProductName")) + "-bk-" + Eval("ProductID") + ".aspx" %>'>
                                Xem thêm</a>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsBiKipPhongThe" runat="server" SelectMethod="ProductSelectAll"
                TypeName="TLLib.Product">
                <SelectParameters>
                    <asp:Parameter Name="StartRowIndex" Type="String" />
                    <asp:Parameter Name="EndRowIndex" Type="String" />
                    <asp:Parameter Name="Keyword" Type="String" />
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="PriceFrom" Type="String" />
                    <asp:Parameter Name="PriceTo" Type="String" />
                    <asp:Parameter DefaultValue="21" Name="CategoryID" Type="String" />
                    <asp:Parameter Name="ManufacturerID" Type="String" />
                    <asp:Parameter Name="OriginID" Type="String" />
                    <asp:Parameter Name="Tag" Type="String" />
                    <asp:Parameter Name="InStock" Type="String" />
                    <asp:Parameter Name="IsHot" Type="String" />
                    <asp:Parameter Name="IsNew" Type="String" />
                    <asp:Parameter Name="IsBestSeller" Type="String" />
                    <asp:Parameter Name="IsSaleOff" Type="String" />
                    <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                    <asp:Parameter Name="FromDate" Type="String" />
                    <asp:Parameter Name="ToDate" Type="String" />
                    <asp:Parameter Name="Priority" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
    <div class="colAside">
        <div class="book-onl">
            <div class="boook-text">
                <span>ĐẶT HÀNG</span></div>
            <div class="book-btn">
                <a class="btn-popup" href="#">Đặt ngay</a></div>
            <div class="popup">
                <uc3:bookonline runat="server" ID="bookonline" />
            </div>
        </div>
        <div class="video-main">
            <div class="wrapper-video">
                <uc2:video runat="server" ID="video" />
            </div>
            <div class="video-title">
                Quảng cáo Melygra
            </div>
        </div>
        <div class="link-fb">
            <img src="assets/images/fb-img.png" alt="" />
        </div>
    </div>
</asp:Content>
