<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true"
    CodeFile="suc-khoe-tong-hop.aspx.cs" Inherits="suc_khoe_tong_hop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Melygra</title>
    <meta name="description" content="Melygra" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="colCotent" runat="Server">
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
        <div class="product-main1">
            <div class="tab-product">
                <div class="tab-content">
                    <div class="tab-main">
                        <div class="slide-head">
                            <asp:ListView ID="lstImageSKTHNew" runat="server" DataSourceID="odsSKTHNew" EnableModelValidation="True">
                                <ItemTemplate>
                                    <div>
                                        <img id="Img1" alt='<%# Eval("ProductName") %> ' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                            visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                            runat="server" /></div>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <div class="slider slider-for">
                                        <span runat="server" id="itemPlaceholder" />
                                    </div>
                                </LayoutTemplate>
                            </asp:ListView>
                            <asp:ListView ID="lstSKTHNew" runat="server" DataSourceID="odsSKTHNew" EnableModelValidation="True">
                                <ItemTemplate>
                                    <div>
                                        <h3>
                                            <%# Eval("ProductName") %></h3>
                                        <p>
                                            <%# TLLib.Common.SplitSummary(Eval("Description").ToString(), 120)%></p>
                                        <div class="readmore">
                                            <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx" %>'>
                                                Xem chi tiết</a></div>
                                    </div>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <div class="slider slider-nav">
                                        <span runat="server" id="itemPlaceholder" />
                                    </div>
                                </LayoutTemplate>
                            </asp:ListView>
                            <asp:ObjectDataSource ID="odsSKTHNew" runat="server" SelectMethod="ProductSelectAll"
                                TypeName="TLLib.Product">
                                <SelectParameters>
                                    <asp:Parameter Name="StartRowIndex" Type="String" />
                                    <asp:Parameter Name="EndRowIndex" Type="String" />
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
                                    <asp:Parameter Name="IsHot" Type="String" />
                                    <asp:Parameter DefaultValue="True" Name="IsNew" Type="String" />
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
                        <div class="cate-news">
                            <asp:ListView ID="lstSKTH" runat="server" DataSourceID="odsSKTH" EnableModelValidation="True">
                                <ItemTemplate>
                                    <div class="item">
                                        <div class="item-img">
                                            <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx" %>'>
                                                <img id="Img1" alt='<%# Eval("ProductName") %> ' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                                    visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                                    runat="server" />
                                            </a>
                                        </div>
                                        <div class="item-title">
                                            <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx" %>'>
                                                <%# Eval("ProductName") %></a>
                                            <p>
                                                <%# TLLib.Common.SplitSummary(Eval("Description").ToString(), 180)%></p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <span runat="server" id="itemPlaceholder" />
                                </LayoutTemplate>
                            </asp:ListView>
                            <asp:ObjectDataSource ID="odsSKTH" runat="server" SelectMethod="ProductSelectAll"
                                TypeName="TLLib.Product">
                                <SelectParameters>
                                    <asp:Parameter Name="StartRowIndex" Type="String" />
                                    <asp:Parameter Name="EndRowIndex" Type="String" />
                                    <asp:Parameter Name="Keyword" Type="String" />
                                    <asp:Parameter Name="ProductName" Type="String" />
                                    <asp:Parameter Name="Description" Type="String" />
                                    <asp:Parameter Name="PriceFrom" Type="String" />
                                    <asp:Parameter Name="PriceTo" Type="String" />
                                    <asp:Parameter Name="CategoryID" DefaultValue="5" Type="String" />
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
                            <div class="pager">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="5" PagedControlID="lstSKTH">
                                    <Fields>
                                        <asp:NumericPagerField ButtonCount="30" NumericButtonCssClass="numer-paging" CurrentPageLabelCssClass="current" />
                                        <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="false" ButtonCssClass="next fa fa-caret-right"
                                            ShowNextPageButton="true" ShowPreviousPageButton="false" RenderDisabledButtonsAsLabels="true"
                                            NextPageText="" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
