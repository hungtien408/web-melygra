<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true"
    CodeFile="thong-tin-website.aspx.cs" Inherits="hinh_thuc_thanh_toan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="colCotent" runat="Server">
    <div class="wrapper-product">
        <asp:ListView ID="lstInfo" runat="server" DataSourceID="odsInfo" EnableModelValidation="True">
            <ItemTemplate>
                <div class="product-main">
                    <h1>
                        <span>
                            <%# Eval("ProductName") %></span></h1>
                </div>
                <div class="footer-content">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsInfo" runat="server" SelectMethod="ProductSelectOne"
            TypeName="TLLib.Product">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductID" QueryStringField="tw" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
