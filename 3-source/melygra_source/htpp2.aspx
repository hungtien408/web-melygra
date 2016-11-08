<%@ Page Title="" Language="C#" MasterPageFile="~/site-htpp.master" AutoEventWireup="true"
    CodeFile="htpp2.aspx.cs" Inherits="htpp2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="colCotent" runat="Server">
    <div class="htpp2">
        <h1>
            <asp:Label ID="lblThanhPhoQuan" runat="server"></asp:Label></h1>
    </div>
    <div class="table-htpp2 table-responsive">
        <%--<table class="table">
        <thead>
          <tr>
            <th class="th1">STT</th>
            <th class="th2">QUẬN</th>
            <th class="th3">TÊN NHÀ THUỐC</th>
            <th class="th4">ĐỊA CHỈ</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="td1">1</td>
            <td class="td2">3</td>
            <td class="td3">Nhà thuốc Mỹ Châu</td>
            <td class="td4">389 Hai Bà Trưng, F8, Q.3</td>
          </tr>
          <tr>
            <td class="td1">2</td>
            <td class="td2">3</td>
            <td class="td3">Nhà thuốc Đại Phúc</td>
            <td class="td4">152 Trần Quốc Thảo, Q.3</td>
          </tr>
            <tr>
            <td class="td1">1</td>
            <td class="td2">3</td>
            <td class="td3">Nhà thuốc Mỹ Châu</td>
            <td class="td4">389 Hai Bà Trưng, F8, Q.3</td>
          </tr>
          <tr>
            <td class="td1">2</td>
            <td class="td2">3</td>
            <td class="td3">Nhà thuốc Đại Phúc</td>
            <td class="td4">152 Trần Quốc Thảo, Q.3</td>
          </tr>
            <tr>
            <td class="td1">1</td>
            <td class="td2">3</td>
            <td class="td3">Nhà thuốc Mỹ Châu</td>
            <td class="td4">389 Hai Bà Trưng, F8, Q.3</td>
          </tr>
          <tr>
            <td class="td1">2</td>
            <td class="td2">3</td>
            <td class="td3">Nhà thuốc Đại Phúc</td>
            <td class="td4">152 Trần Quốc Thảo, Q.3</td>
          </tr>
            <tr>
            <td class="td1">1</td>
            <td class="td2">3</td>
            <td class="td3">Nhà thuốc Mỹ Châu</td>
            <td class="td4">389 Hai Bà Trưng, F8, Q.3</td>
          </tr>
          <tr>
            <td class="td1">2</td>
            <td class="td2">3</td>
            <td class="td3">Nhà thuốc Đại Phúc</td>
            <td class="td4">152 Trần Quốc Thảo, Q.3</td>
          </tr>
            <tr>
            <td class="td1">1</td>
            <td class="td2">3</td>
            <td class="td3">Nhà thuốc Mỹ Châu</td>
            <td class="td4">389 Hai Bà Trưng, F8, Q.3</td>
          </tr>
          <tr>
            <td class="td1">2</td>
            <td class="td2">3</td>
            <td class="td3">Nhà thuốc Đại Phúc</td>
            <td class="td4">152 Trần Quốc Thảo, Q.3</td>
          </tr>
        </tbody>
      </table>--%>
        <asp:ListView ID="lstPhanPhoiDetails" runat="server" DataSourceID="odsPhanPhoiDetails"
            GroupItemCount="1" EnableModelValidation="True">
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server">
                    </td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td class="td1">
                    <%# Container.DataItemIndex + 1 %>
                </td>
                <td class="td2">
                    <%# Eval("DistrictName") %>
                </td>
                <td class="td3">
                    <%# Eval("Company")%>
                </td>
                <td class="td4">
                    <%# Eval("Address1")%>
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table id="Table1" class="table" runat="server">
                    <thead>
                        <tr>
                            <th class="th1">
                                STT
                            </th>
                            <th class="th2">
                                QUẬN
                            </th>
                            <th class="th3">
                                TÊN NHÀ THUỐC
                            </th>
                            <th class="th4">
                                ĐỊA CHỈ
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="groupPlaceholderContainer" runat="server">
                            <td id="groupPlaceholder" runat="server">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsPhanPhoiDetails" runat="server" SelectMethod="AddressBook1SelectAll"
            TypeName="TLLib.AddressBook1">
            <SelectParameters>
                <asp:Parameter Name="AddressBookID" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="HomePhone" Type="String" />
                <asp:Parameter Name="CellPhone" Type="String" />
                <asp:Parameter Name="Fax" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Company" Type="String" />
                <asp:Parameter Name="Address1" Type="String" />
                <asp:Parameter Name="Address2" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="CountryID" Type="String" />
                <asp:QueryStringParameter Name="ProvinceID" QueryStringField="pvi" Type="String" />
                <asp:QueryStringParameter Name="DistrictID" QueryStringField="dsi" Type="String" />
                <asp:Parameter Name="IsPrimary" Type="String" />
                <asp:Parameter Name="IsPrimaryBilling" Type="String" />
                <asp:Parameter Name="IsPrimaryShipping" Type="String" />
                <asp:Parameter Name="RoleName" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
