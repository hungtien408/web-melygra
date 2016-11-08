<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true"
    CodeFile="tu-van.aspx.cs" Inherits="tu_van" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="colCotent" runat="Server">
    <div class="title-main bor-bot">
        <h1>
            Tư vấn chuyên gia</h1>
    </div>
    <div class="support-main">
        <asp:ListView ID="lstTuVan" runat="server" DataSourceID="odsTuVan" EnableModelValidation="True">
            <ItemTemplate>
                <div class="item-sp">
                    <div class="info-sp">
                        <ul>
                            <li>Ngày gửi:<%# string.Format("{0:dd/MM/yyyy}", Eval("CreateDate"))%></li>
                            <li>Người gửi: <%# Eval("UserName")%></li>
                            <li>Email: <%# Eval("Email") %></li>
                        </ul>
                    </div>
                    <div class="sp-box">
                        <h1>
                            Câu hỏi:</h1>
                        <div class="description">
                            <%# Eval("Content") %></div>
                        <div class="view-tl">
                            <a href="javascript:void(0);">Xem trả lời</a></div>
                        <div class="tl">
                            <asp:Label ID="lblAnswer" runat="server" Text='<%# Eval("Answer") %>'></asp:Label>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsTuVan" runat="server" SelectMethod="CommentSelectAll"
            TypeName="TLLib.Comment">
            <SelectParameters>
                <asp:Parameter Name="CommentID" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Keyword" Type="String" />
                <asp:Parameter Name="Link" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Content" Type="String" />
                <asp:Parameter Name="CreateDate" Type="String" />
                <asp:Parameter Name="UpdateDate" Type="String" />
                <asp:Parameter Name="FromDate" Type="String" />
                <asp:Parameter Name="ToDate" Type="String" />
                <asp:Parameter Name="Priority" Type="String" />
                <asp:Parameter DefaultValue="True" Name="IsApproved" Type="String" />
                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
