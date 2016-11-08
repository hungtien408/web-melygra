<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true"
    CodeFile="gout.aspx.cs" Inherits="gout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="colCotent" runat="Server">
    <asp:HiddenField ID="hdnlink" runat="server" />
    <a class="a-link-cat" href="<%= hdnlink.Value %>"></a>
    <div class="wrapper-product">
        <div class="product-main">
            <h1>
                <span>
                    <asp:Label ID="lblName" runat="server" Text=""></asp:Label></span></h1>
        </div>
        <div class="product-main1">
            <div class="tab-product">
                <div class="tab-content">
                    <div class="tab-main">
                        <div class="slide-head">
                            <asp:ListView ID="lstImageGoutNew" runat="server" DataSourceID="odsGoutNew" EnableModelValidation="True">
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
                            <asp:ListView ID="lstGoutNew" runat="server" DataSourceID="odsGoutNew" EnableModelValidation="True">
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
                            <asp:ObjectDataSource ID="odsGoutNew" runat="server" SelectMethod="ProductSelectAll"
                                TypeName="TLLib.Product">
                                <SelectParameters>
                                    <asp:Parameter Name="StartRowIndex" Type="String" />
                                    <asp:Parameter Name="EndRowIndex" Type="String" />
                                    <asp:Parameter Name="Keyword" Type="String" />
                                    <asp:Parameter Name="ProductName" Type="String" />
                                    <asp:Parameter Name="Description" Type="String" />
                                    <asp:Parameter Name="PriceFrom" Type="String" />
                                    <asp:Parameter Name="PriceTo" Type="String" />
                                    <asp:QueryStringParameter Name="CategoryID" QueryStringField="pci" Type="String" />
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
                            <asp:ListView ID="lstGout" runat="server" DataSourceID="odsGout" EnableModelValidation="True">
                                <ItemTemplate>
                                    <div class="item">
                                        <div class="item-img">
                                            <a href='<%# progressTitle(Eval("ProductName")) + "-tt-" + Eval("ProductID") + ".aspx"%>'>
                                                <img id="Img1" alt='<%# Eval("ProductName") %> ' src='<%# "~/res/product/"
                                                    + Eval("ImageName") %>' visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString())
                                                    ? false : true %>' runat="server" />
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
                            <asp:ObjectDataSource ID="odsGout" runat="server" SelectMethod="ProductSelectAll"
                                TypeName="TLLib.Product">
                                <SelectParameters>
                                    <asp:Parameter Name="StartRowIndex" Type="String" />
                                    <asp:Parameter Name="EndRowIndex" Type="String" />
                                    <asp:Parameter Name="Keyword" Type="String" />
                                    <asp:Parameter Name="ProductName" Type="String" />
                                    <asp:Parameter Name="Description" Type="String" />
                                    <asp:Parameter Name="PriceFrom" Type="String" />
                                    <asp:Parameter Name="PriceTo" Type="String" />
                                    <asp:QueryStringParameter Name="CategoryID" QueryStringField="pci" Type="String" />
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
                                <%--<a href="#" class="current">1</a> <a href="#">2</a> <a href="#">3</a>
    <a href="#">...</a> <a href="#">30</a> <a href="#" class="next fa fa-caret-right"></a>--%>
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="5" PagedControlID="lstGout">
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
