<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="san-pham.aspx.cs" Inherits="san_pham" %>
<%@ Register TagPrefix="uc2" TagName="video" Src="~/uc/video.ascx" %>
<%@ Register TagPrefix="uc3" TagName="bookonline" Src="~/uc/bookonline.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="colContent">
        <div class="product-main">
            <h1>
                <span>SẢN PHẨM</span></h1>
            <div class="cate-news">
                <asp:ListView ID="lstProduct" runat="server" DataSourceID="odsProduct" EnableModelValidation="True">
                    <ItemTemplate>
                        <div class="item">
                            <div class="item-img">
                                <a href='<%# progressTitle(Eval("ProductName")) + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                    <img id="Img1" alt='<%# Eval("ProductName") %> ' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                        visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                        runat="server" />
                                </a>&nbsp;</div>
                            <div class="item-title">
                                <a href='<%# progressTitle(Eval("ProductName")) + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                    <%# Eval("ProductName") %></a>
                                <p>
                                    <%# TLLib.Common.SplitSummary(Eval("Description").ToString(), 120)%></p>
                                <div class="view-sp">
                                    <a href='<%# progressTitle(Eval("ProductName")) + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                        Xem thêm</a></div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsProduct" runat="server" SelectMethod="ProductSelectAll"
                    TypeName="TLLib.Product">
                    <SelectParameters>
                        <asp:Parameter Name="StartRowIndex" Type="String" />
                        <asp:Parameter Name="EndRowIndex" Type="String" />
                        <asp:Parameter Name="Keyword" Type="String" />
                        <asp:Parameter Name="ProductName" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="PriceFrom" Type="String" />
                        <asp:Parameter Name="PriceTo" Type="String" />
                        <asp:Parameter DefaultValue="3" Name="CategoryID" Type="String" />
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
        <%--<div class="product-info">
            <h1>
                Kiến thức bệnh học</h1>
            <asp:ListView ID="lstKienThuc" runat="server" DataSourceID="odsKienThuc" EnableModelValidation="True">
                <ItemTemplate>
                    <div class="item-product">
                        <div class="item-img">
                            <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx" %>'>
                                <img id="Img1" alt='<%# Eval("ProductName") %> ' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                        visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                        runat="server" /></a></div>
                        <div class="item-name">
                            <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx" %>'><%# Eval("ProductName") %></a></div>
                        <div class="description">
                            <%# TLLib.Common.SplitSummary(Eval("Description").ToString(), 110)%></div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsKienThuc" runat="server" 
                SelectMethod="ProductSelectAll" TypeName="TLLib.Product">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
                    <asp:Parameter DefaultValue="3" Name="EndRowIndex" Type="String" />
                    <asp:Parameter Name="Keyword" Type="String" />
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="PriceFrom" Type="String" />
                    <asp:Parameter Name="PriceTo" Type="String" />
                    <asp:Parameter DefaultValue="6" Name="CategoryID" Type="String" />
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
        </div>--%>
    </div>
    <div class="colAside">
        <div class="book-onl">
            <div class="boook-text">
                <span>ĐẶT HÀNG</span></div>
            <div class="book-btn">
                <a class="btn-popup" href="javascript:void(0);">Đặt ngay</a></div>
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
        <div class="distribution-aside">
            <div class="dis-name">
                HỆ THỐNG <span>PHÂN PHỐI</span>
            </div>
            <div class="phone-aside">
                TỔNG ĐÀI TƯ VẤN <span>(08) 3962 1798</span>
            </div>
        </div>
    </div>
</asp:Content>
