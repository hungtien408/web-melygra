<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true"
    CodeFile="tin-tuc-chi-tiet.aspx.cs" Inherits="tin_tuc_chi_tiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="colCotent" runat="Server">
    <div class="wrapper-product">
        <div class="head-title">
            <h1>
                <span class="bg3">
                    <asp:Label ID="lblName" runat="server" Text=""></asp:Label></span></h1>
        </div>
        <asp:ListView ID="lstNewDetails" runat="server" DataSourceID="odsNewDetails" EnableModelValidation="True">
            <ItemTemplate>
                <div class="news-detail">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsNewDetails" runat="server" 
            SelectMethod="ProductSelectOne" TypeName="TLLib.Product">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductID" QueryStringField="tt" 
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
