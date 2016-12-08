<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Melygra</title>
    <meta name="description" content="Melygra" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" runat="Server">
    <div id="banner">
        <div id="sliderBanner">
            <asp:ListView ID="lstBannerMain" runat="server" DataSourceID="odsBannerMain" EnableModelValidation="True">
                <ItemTemplate>
                    <div class="slide">
                        <img id="Img1" alt='<%# Eval("FileName") %> ' src='<%# "~/res/advertisement/" + Eval("FileName") %>'
                            visible='<%# string.IsNullOrEmpty( Eval("FileName").ToString()) ? false : true %>'
                            runat="server" />
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsBannerMain" runat="server" SelectMethod="AdsBannerSelectAll"
                TypeName="TLLib.AdsBanner">
                <SelectParameters>
                    <asp:Parameter Name="StartRowIndex" Type="String" />
                    <asp:Parameter Name="EndRowIndex" Type="String" />
                    <asp:Parameter DefaultValue="5" Name="AdsCategoryID" Type="String" />
                    <asp:Parameter Name="CompanyName" Type="String" />
                    <asp:Parameter Name="Website" Type="String" />
                    <asp:Parameter Name="FromDate" Type="String" />
                    <asp:Parameter Name="ToDate" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                    <asp:Parameter Name="Priority" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="colCotent" runat="Server">
    <div class="wrapper-product">
        <div class="head-title">
            <h1>
                <span class="bg1">SINH LÝ NAM</span></h1>
            <asp:ListView ID="lstSinhLyNam" runat="server" DataSourceID="odsSinhLyNam" EnableModelValidation="True">
                <ItemTemplate>
                    <li><a href='<%# progressTitle(Eval("ProductCategoryName")) + "-pci-" + Eval("ProductCategoryID") + ".aspx" %>'>
                        <%# Eval("ProductCategoryName") %></a></li>
                </ItemTemplate>
                <LayoutTemplate>
                    <ul class="nav nav-tabs tabpro tabpro1" role="tablist">
                        <li runat="server" id="itemPlaceholder"></li>
                    </ul>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsSinhLyNam" runat="server" SelectMethod="ProductCategorySelectAll"
                TypeName="TLLib.ProductCategory">
                <SelectParameters>
                    <asp:Parameter DefaultValue="4" Name="parentID" Type="Int32" />
                    <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                    <asp:Parameter Name="IsShowOnMenu" Type="String" />
                    <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <div class="product-main">
            <div class="tab-product">
                <div class="tab-content">
                    <div class="tab-main">
                        <asp:ListView ID="lstSinhLyNamHome" runat="server" DataSourceID="odsSinhLyNamHome"
                            EnableModelValidation="True">
                            <ItemTemplate>
                                <div class="tab-box">
                                    <div class="tab-img">
                                        <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx" %>'>
                                            <img id="Img2" alt='<%# Eval("ProductName") %> ' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                                visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                                runat="server" /></a>
                                        <div class="tab-title">
                                            <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx" %>'>
                                                <%# Eval("ProductName") %></a>
                                        </div>
                                    </div>
                                    <div class="description">
                                        <%# TLLib.Common.SplitSummary(Eval("Description").ToString(), 180)%>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <span runat="server" id="itemPlaceholder" />
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:ObjectDataSource ID="odsSinhLyNamHome" runat="server" SelectMethod="ProductSelectAll"
                            TypeName="TLLib.Product">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
                                <asp:Parameter DefaultValue="1" Name="EndRowIndex" Type="String" />
                                <asp:Parameter Name="Keyword" Type="String" />
                                <asp:Parameter Name="ProductName" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="PriceFrom" Type="String" />
                                <asp:Parameter Name="PriceTo" Type="String" />
                                <asp:Parameter DefaultValue="4" Name="CategoryID" Type="String" />
                                <asp:Parameter Name="ManufacturerID" Type="String" />
                                <asp:Parameter Name="OriginID" Type="String" />
                                <asp:Parameter Name="Tag" Type="String" />
                                <asp:Parameter Name="InStock" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="IsHot" Type="String" />
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
                        <div class="tab-list">
                            <asp:ListView ID="lstSinhLyNamHome2" runat="server" DataSourceID="odsSinhLyNamHome2"
                                EnableModelValidation="True">
                                <ItemTemplate>
                                    <div class="item">
                                        <div class="img">
                                            <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx" %>'>
                                                <img id="Img2" alt='<%# Eval("ProductName") %> ' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                                    visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                                    runat="server" /></a>
                                        </div>
                                        <div class="title">
                                            <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx" %>'>
                                                <%# Eval("ProductName") %></a>
                                            <p>
                                                <%# TLLib.Common.SplitSummary(Eval("Description").ToString(), 90)%></p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <span runat="server" id="itemPlaceholder" />
                                </LayoutTemplate>
                            </asp:ListView>
                        </div>
                        <asp:ObjectDataSource ID="odsSinhLyNamHome2" runat="server" SelectMethod="ProductSelectAll"
                            TypeName="TLLib.Product">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="2" Name="StartRowIndex" Type="String" />
                                <asp:Parameter DefaultValue="4" Name="EndRowIndex" Type="String" />
                                <asp:Parameter Name="Keyword" Type="String" />
                                <asp:Parameter Name="ProductName" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="PriceFrom" Type="String" />
                                <asp:Parameter Name="PriceTo" Type="String" />
                                <asp:Parameter DefaultValue="4" Name="CategoryID" Type="String" />
                                <asp:Parameter Name="ManufacturerID" Type="String" />
                                <asp:Parameter Name="OriginID" Type="String" />
                                <asp:Parameter Name="Tag" Type="String" />
                                <asp:Parameter Name="InStock" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="IsHot" Type="String" />
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
                    <div class="view-all">
                        <a href="sinh-ly-nam.aspx">Xem thêm </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="wrapper-product">
        <div class="head-title">
            <h1>
                <span class="bg2">SỨC KHỎE TỔNG HỢP</span></h1>
            <asp:ListView ID="lstSucKhoeTongHop" runat="server" DataSourceID="odsSucKhoeTongHop"
                EnableModelValidation="True">
                <ItemTemplate>
                    <li><a href='<%# progressTitle(Eval("ProductCategoryName")) + "-pci-" + Eval("ProductCategoryID") + ".aspx" %>'>
                        <%# Eval("ProductCategoryName") %></a></li>
                </ItemTemplate>
                <LayoutTemplate>
                    <ul class="nav nav-tabs tabpro" role="tablist">
                        <li runat="server" id="itemPlaceholder"></li>
                    </ul>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsSucKhoeTongHop" runat="server" SelectMethod="ProductCategorySelectAll"
                TypeName="TLLib.ProductCategory">
                <SelectParameters>
                    <asp:Parameter DefaultValue="5" Name="parentID" Type="Int32" />
                    <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                    <asp:Parameter Name="IsShowOnMenu" Type="String" />
                    <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <div class="product-main">
            <div class="tab-product">
                <div class="tab-content">
                    <div class="tab-main">
                        <asp:ListView ID="lstSucKhoeTongHopHome" runat="server" DataSourceID="odsSucKhoeTongHopHome"
                            EnableModelValidation="True">
                            <ItemTemplate>
                                <div class="tab-box">
                                    <div class="tab-img">
                                        <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx" %>'>
                                            <img id="Img2" alt='<%# Eval("ProductName") %> ' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                                visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                                runat="server" /></a>
                                        <div class="tab-title">
                                            <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx" %>'>
                                                <%# Eval("ProductName") %></a>
                                        </div>
                                    </div>
                                    <div class="description">
                                        <%# TLLib.Common.SplitSummary(Eval("Description").ToString(), 180)%>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <span runat="server" id="itemPlaceholder" />
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:ObjectDataSource ID="odsSucKhoeTongHopHome" runat="server" SelectMethod="ProductSelectAll"
                            TypeName="TLLib.Product">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
                                <asp:Parameter DefaultValue="1" Name="EndRowIndex" Type="String" />
                                <asp:Parameter Name="Keyword" Type="String" />
                                <asp:Parameter Name="ProductName" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="PriceFrom" Type="String" />
                                <asp:Parameter Name="PriceTo" Type="String" />
                                <asp:Parameter DefaultValue="5" Name="CategoryID" Type="String" />
                                <asp:Parameter Name="ManufacturerID" Type="String" />
                                <asp:Parameter Name="OriginID" Type="String" />
                                <asp:Parameter Name="Tag" Type="String" />
                                <asp:Parameter Name="InStock" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="IsHot" Type="String" />
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
                        <div class="tab-list">
                            <asp:ListView ID="lstSucKhoeTongHopHome2" runat="server" DataSourceID="odsSucKhoeTongHopHome2"
                                EnableModelValidation="True">
                                <ItemTemplate>
                                    <div class="item">
                                        <div class="img">
                                            <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx" %>'>
                                                <img id="Img2" alt='<%# Eval("ProductName") %> ' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                                    visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                                    runat="server" /></a>
                                        </div>
                                        <div class="title">
                                            <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx" %>'>
                                                <%# Eval("ProductName") %></a>
                                            <p>
                                                <%# TLLib.Common.SplitSummary(Eval("Description").ToString(), 90)%></p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <span runat="server" id="itemPlaceholder" />
                                </LayoutTemplate>
                            </asp:ListView>
                        </div>
                        <asp:ObjectDataSource ID="odsSucKhoeTongHopHome2" runat="server" SelectMethod="ProductSelectAll"
                            TypeName="TLLib.Product">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="2" Name="StartRowIndex" Type="String" />
                                <asp:Parameter DefaultValue="4" Name="EndRowIndex" Type="String" />
                                <asp:Parameter Name="Keyword" Type="String" />
                                <asp:Parameter Name="ProductName" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="PriceFrom" Type="String" />
                                <asp:Parameter Name="PriceTo" Type="String" />
                                <asp:Parameter DefaultValue="5" Name="CategoryID" Type="String" />
                                <asp:Parameter Name="ManufacturerID" Type="String" />
                                <asp:Parameter Name="OriginID" Type="String" />
                                <asp:Parameter Name="Tag" Type="String" />
                                <asp:Parameter Name="InStock" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="IsHot" Type="String" />
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
                    <div class="view-all">
                        <a href="suc-khoe-tong-hop.aspx">Xem thêm </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="wrapper-product">
        <div class="head-title">
            <h1>
                <span class="bg3">TIN TỨC</span></h1>
            <asp:ListView ID="lstNews" runat="server" DataSourceID="odsNews" EnableModelValidation="True">
                <ItemTemplate>
                    <li><a href='<%# progressTitle(Eval("ProductCategoryName")) + "-ttc-" + Eval("ProductCategoryID") + ".aspx" %>'>
                        <%# Eval("ProductCategoryName") %></a></li>
                </ItemTemplate>
                <LayoutTemplate>
                    <ul class="nav nav-tabs tabpro" role="tablist">
                        <li runat="server" id="itemPlaceholder"></li>
                    </ul>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsNews" runat="server" SelectMethod="ProductCategorySelectAll"
                TypeName="TLLib.ProductCategory">
                <SelectParameters>
                    <asp:Parameter DefaultValue="2" Name="parentID" Type="Int32" />
                    <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                    <asp:Parameter Name="IsShowOnMenu" Type="String" />
                    <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <div class="product-main">
            <div class="tab-product">
                <div class="tab-content">
                    <div class="tab-main">
                        <asp:ListView ID="lstNewHome" runat="server" DataSourceID="odsNewHome" EnableModelValidation="True">
                            <ItemTemplate>
                                <div class="tab-box">
                                    <div class="tab-img">
                                        <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx" %>'>
                                            <img id="Img2" alt='<%# Eval("ProductName") %> ' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                                visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                                runat="server" /></a>
                                        <div class="tab-title">
                                            <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx" %>'>
                                                <%# Eval("ProductName") %></a>
                                        </div>
                                    </div>
                                    <div class="description">
                                        <%# TLLib.Common.SplitSummary(Eval("Description").ToString(), 180)%>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <span runat="server" id="itemPlaceholder" />
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:ObjectDataSource ID="odsNewHome" runat="server" SelectMethod="ProductSelectAll"
                            TypeName="TLLib.Product">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
                                <asp:Parameter DefaultValue="1" Name="EndRowIndex" Type="String" />
                                <asp:Parameter Name="Keyword" Type="String" />
                                <asp:Parameter Name="ProductName" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="PriceFrom" Type="String" />
                                <asp:Parameter Name="PriceTo" Type="String" />
                                <asp:Parameter DefaultValue="2" Name="CategoryID" Type="String" />
                                <asp:Parameter Name="ManufacturerID" Type="String" />
                                <asp:Parameter Name="OriginID" Type="String" />
                                <asp:Parameter Name="Tag" Type="String" />
                                <asp:Parameter Name="InStock" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="IsHot" Type="String" />
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
                        <div class="tab-list">
                            <asp:ListView ID="lstNewHome2" runat="server" DataSourceID="odsNewHome2" EnableModelValidation="True">
                                <ItemTemplate>
                                    <div class="item">
                                        <div class="img">
                                            <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx" %>'>
                                                <img id="Img2" alt='<%# Eval("ProductName") %> ' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                                    visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                                    runat="server" /></a>
                                        </div>
                                        <div class="title">
                                            <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx" %>'>
                                                <%# TLLib.Common.SplitSummary(Eval("ProductName").ToString(), 60)%></a>
                                            <p>
                                                <%# TLLib.Common.SplitSummary(Eval("Description").ToString(), 90)%></p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <span runat="server" id="itemPlaceholder" />
                                </LayoutTemplate>
                            </asp:ListView>
                        </div>
                        <asp:ObjectDataSource ID="odsNewHome2" runat="server" SelectMethod="ProductSelectAll"
                            TypeName="TLLib.Product">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="2" Name="StartRowIndex" Type="String" />
                                <asp:Parameter DefaultValue="4" Name="EndRowIndex" Type="String" />
                                <asp:Parameter Name="Keyword" Type="String" />
                                <asp:Parameter Name="ProductName" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="PriceFrom" Type="String" />
                                <asp:Parameter Name="PriceTo" Type="String" />
                                <asp:Parameter DefaultValue="2" Name="CategoryID" Type="String" />
                                <asp:Parameter Name="ManufacturerID" Type="String" />
                                <asp:Parameter Name="OriginID" Type="String" />
                                <asp:Parameter Name="Tag" Type="String" />
                                <asp:Parameter Name="InStock" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="IsHot" Type="String" />
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
                    <div class="view-all">
                        <a href="tin-tuc.aspx">Xem thêm </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="product-content">
        <h1>
            SẢN PHẨM</h1>
        <div class="product-box">
            <asp:ListView ID="lstProduct" runat="server" DataSourceID="odsProduct" EnableModelValidation="True">
                <ItemTemplate>
                    <div class="item">
                        <div class="pro-img">
                            <a href='<%# progressTitle(Eval("ProductName")) + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                <img id="Img3" alt='<%# Eval("ProductName") %> ' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                    visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                    runat="server" /></a>
                        </div>
                        <div class="pro-name">
                            <a href='<%# progressTitle(Eval("ProductName")) + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                <%# Eval("ProductName") %></a>
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
</asp:Content>
