<%@ Page Title="" Language="C#" MasterPageFile="~/site-htpp.master" AutoEventWireup="true"
    CodeFile="htpp1.aspx.cs" Inherits="htpp1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="colCotent" runat="Server">
    <div class="search-content">
        <div class="htpp-1">
            <div class="htpp-name">
                <asp:Label ID="lblThanhPho" runat="server"></asp:Label></div>
            <div class="htpp-bg htpp-pad">
                <asp:ListView ID="lstQuan" runat="server" DataSourceID="odsQuan" EnableModelValidation="True">
                    <ItemTemplate>
                        <li><a href='<%# progressTitle(Eval("DistrictName")) + "-pvi-" + Eval("ProvinceID") + "-dsi-" + Eval("DistrictID") + ".aspx" %>'>
                            <%# Eval("DistrictName")%></a></li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul>
                            <li runat="server" id="itemPlaceholder"></li>
                        </ul>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsQuan" runat="server" SelectMethod="DistrictSelectAll"
                    TypeName="TLLib.District">
                    <SelectParameters>
                        <asp:Parameter Name="DistrictName" Type="String" />
                        <asp:QueryStringParameter QueryStringField="pvi" Name="ProvinceIDs" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </div>
</asp:Content>
