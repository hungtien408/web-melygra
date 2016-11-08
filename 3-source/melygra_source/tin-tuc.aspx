<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true"
    CodeFile="tin-tuc.aspx.cs" Inherits="tin_tuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="colCotent" runat="Server">
    <div class="wrapper-product">
        <div class="head-title">
            <h1>
                <span class="bg3">TIN TỨC</span></h1>
            <asp:ListView ID="lstNewCategory" runat="server" DataSourceID="odsNewCategory" EnableModelValidation="True">
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
            <asp:ObjectDataSource ID="odsNewCategory" runat="server" SelectMethod="ProductCategorySelectAll"
                TypeName="TLLib.ProductCategory">
                <SelectParameters>
                    <asp:Parameter DefaultValue="2" Name="parentID" Type="Int32" />
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
                        <asp:ListView ID="lstNewHot" runat="server" DataSourceID="odsNewHot" EnableModelValidation="True">
                            <ItemTemplate>
                                <div class="news-hot">
                                    <div class="news-img-hot">
                                        <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx" %>'>
                                            <img id="Img1" alt='<%# Eval("ProductName") %> ' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                                visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                                runat="server" />
                                        </a>
                                    </div>
                                    <div class="news-box-hot">
                                        <div class="news-name-hot">
                                            <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx" %>'>
                                                <%# Eval("ProductName") %></a></div>
                                        <div class="description">
                                            <%# TLLib.Common.SplitSummary(Eval("Description").ToString(), 120)%></div>
                                        <div class="view-detail">
                                            <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx" %>'>
                                                XEM CHI TIẾT</a>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <span runat="server" id="itemPlaceholder" />
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:ObjectDataSource ID="odsNewHot" runat="server" SelectMethod="ProductSelectAll"
                            TypeName="TLLib.Product">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
                                <asp:Parameter DefaultValue="1" Name="EndRowIndex" Type="String" />
                                <asp:Parameter Name="Keyword" Type="String" />
                                <asp:Parameter Name="ProductName" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="PriceFrom" Type="String" />
                                <asp:Parameter Name="PriceTo" Type="String" />
                                <asp:QueryStringParameter DefaultValue="2" QueryStringField="ttc" Name="CategoryID"
                                    Type="String" />
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
                        <div class="news-box">
                            <asp:ListView ID="lstNews" runat="server" DataSourceID="odsNews" EnableModelValidation="True">
                                <ItemTemplate>
                                    <div class="item-news">
                                        <div class="item-img">
                                            <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx" %>'>
                                                <img id="Img1" alt='<%# Eval("ProductName") %> ' src='<%# "~/res/product/" + Eval("ImageName") %>' 
                                                visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>' runat="server" /></a></div>
                                        <div class="item-name">
                                            <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx" %>'>
                                                <%# Eval("ProductName") %></a></div>
                                        <div class="description">
                                            <%# TLLib.Common.SplitSummary(Eval("Description").ToString(), 80)%></div>
                                    </div>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <span runat="server" id="itemPlaceholder" />
                                </LayoutTemplate>
                            </asp:ListView>
                            <asp:ObjectDataSource ID="odsNews" runat="server" SelectMethod="ProductSelectAll"
                                TypeName="TLLib.Product">
                                <SelectParameters>
                                    <asp:Parameter Name="StartRowIndex" Type="String" />
                                    <asp:Parameter Name="EndRowIndex" Type="String" />
                                    <asp:Parameter Name="Keyword" Type="String" />
                                    <asp:Parameter Name="ProductName" Type="String" />
                                    <asp:Parameter Name="Description" Type="String" />
                                    <asp:Parameter Name="PriceFrom" Type="String" />
                                    <asp:Parameter Name="PriceTo" Type="String" />
                                    <asp:QueryStringParameter DefaultValue="2" QueryStringField="ttc" Name="CategoryID"
                                        Type="String" />
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
                        <div class="pager">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12" PagedControlID="lstNews">
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
</asp:Content>
