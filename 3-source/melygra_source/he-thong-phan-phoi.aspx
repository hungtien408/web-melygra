<%@ Page Title="" Language="C#" MasterPageFile="~/site-htpp.master" AutoEventWireup="true"
    CodeFile="he-thong-phan-phoi.aspx.cs" Inherits="htpp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="colCotent" runat="Server">
    <div class="search-content">
        <div class="htpp-main">
            <div class="htpp-box">
                <div class="htpp-title">
                    <span>MIỀN BẮC</span></div>
                <div class="thpp-list">
                    <asp:ListView ID="lstMienBac" runat="server" DataSourceID="odsMienBac" EnableModelValidation="True">
                        <ItemTemplate>
                            <li><a href='<%# progressTitle(Eval("ProvinceName")) + "-pvi-" + Eval("ProvinceID") + ".aspx" %>'>
                                <%# Eval("ProvinceName")%></a></li>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <ul>
                                <li runat="server" id="itemPlaceholder"></li>
                            </ul>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsMienBac" runat="server" SelectMethod="ProvinceSelectAll"
                        TypeName="TLLib.Province">
                        <SelectParameters>
                            <asp:Parameter Name="ProvinceID" Type="String" />
                            <asp:Parameter Name="ProvinceName" Type="String" />
                            <asp:Parameter Name="ShortName" Type="String" />
                            <asp:Parameter DefaultValue="2" Name="CountryID" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
            <div class="htpp-box">
                <div class="htpp-title">
                    <span>MIỀN TRUNG</span></div>
                <div class="thpp-list">
                    <asp:ListView ID="lstMienTrung" runat="server" DataSourceID="odsMienTrung" EnableModelValidation="True">
                        <ItemTemplate>
                            <li><a href='<%# progressTitle(Eval("ProvinceName")) + "-pvi-" + Eval("ProvinceID") + ".aspx" %>'>
                                <%# Eval("ProvinceName")%></a></li>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <ul>
                                <li runat="server" id="itemPlaceholder"></li>
                            </ul>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsMienTrung" runat="server" SelectMethod="ProvinceSelectAll"
                        TypeName="TLLib.Province">
                        <SelectParameters>
                            <asp:Parameter Name="ProvinceID" Type="String" />
                            <asp:Parameter Name="ProvinceName" Type="String" />
                            <asp:Parameter Name="ShortName" Type="String" />
                            <asp:Parameter DefaultValue="3" Name="CountryID" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
            <div class="htpp-box">
                <div class="htpp-title">
                    <span>MIỀN NAM</span></div>
                <div class="thpp-list">
                    <asp:ListView ID="lstMienNam" runat="server" DataSourceID="odsMienNam" EnableModelValidation="True">
                        <ItemTemplate>
                            <li><a href='<%# progressTitle(Eval("ProvinceName")) + "-pvi-" + Eval("ProvinceID") + ".aspx" %>'>
                                <%# Eval("ProvinceName")%></a></li>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <ul>
                                <li runat="server" id="itemPlaceholder"></li>
                            </ul>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsMienNam" runat="server" SelectMethod="ProvinceSelectAll"
                        TypeName="TLLib.Province">
                        <SelectParameters>
                            <asp:Parameter Name="ProvinceID" Type="String" />
                            <asp:Parameter Name="ProvinceName" Type="String" />
                            <asp:Parameter Name="ShortName" Type="String" />
                            <asp:Parameter DefaultValue="4" Name="CountryID" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
