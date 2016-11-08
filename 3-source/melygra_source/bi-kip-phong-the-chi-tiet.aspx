<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="bi-kip-phong-the-chi-tiet.aspx.cs" Inherits="bi_kip_phong_the_chi_tiet" %>
<%@ Register Src="~/uc/video.ascx" TagPrefix="uc2" TagName="video" %>
<%@ Register Src="~/uc/bookonline.ascx" TagPrefix="uc3" TagName="bookonline" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="colContent">
        <div class="title-main bor-bot bg1">
            <h1>
                <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label></h1>
        </div>
        <asp:ListView ID="lstBKDetails" runat="server" DataSourceID="odsBKDetails" EnableModelValidation="True">
            <ItemTemplate>
                <div class="file-pdf">
                    <a class="media" href='<%# "res/product/download/" + Eval("LinkDownload") %>'></a>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsBKDetails" runat="server" SelectMethod="ProductDownloadSelectAll"
            TypeName="TLLib.ProductDownload">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductID" QueryStringField="bk" Type="String" />
                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                <asp:Parameter Name="Priority" Type="String" />
                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
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
        <div class="recipe-aside">
            <div class="rec-img">
                <a href="bi-kip-phong-the.aspx">
                    <img src="assets/images/rec2.png" alt="" /></a>
            </div>
            <div class="rec-name">
                <a href="bi-kip-phong-the.aspx">Bí kíp <span>PHÒNG THE</span></a>
            </div>
        </div>
        <div class="link-fb">
            <img src="assets/images/fb-img.png" alt="" />
        </div>
    </div>
</asp:Content>
