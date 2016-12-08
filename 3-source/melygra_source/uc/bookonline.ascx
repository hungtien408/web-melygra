<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bookonline.ascx.cs" Inherits="uc_bookonline" %>
<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2012.3.1016.35, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=3.5.40412.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<div class="popup-content">
    <h1>
        ĐẶT HÀNG ONLINE</h1>
    <i>Vui lòng điền vào thông tin bên dưới để mua hàng</i>
    <div class="form-popup">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="from-danghang">
                    <div class="popup-w">
                        <label class="popup-lb">
                            Loại hàng</label>
                        <%--<select>
                    <option value="" selected>--Loại hàng--</option>
                    <option value="">Loại 1</option>
                    <option value="">Loại 2</option>
                    <option value="">Loại 3</option>
                </select>--%>
                        <asp:DropDownList ID="dropListLoaiHang" CssClass="selectb" runat="server" DataSourceID="odsLoaiHang"
                            DataTextField="ProductName" DataValueField="ProductID" AutoPostBack="True" OnSelectedIndexChanged="dropListLoaiHang_SelectedIndexChanged" OnDataBound="DropDownList_DataBound">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="odsLoaiHang" runat="server" SelectMethod="ProductSelectAll"
                            TypeName="TLLib.Product">
                            <SelectParameters>
                                <asp:Parameter Name="StartRowIndex" Type="String" />
                                <asp:Parameter Name="EndRowIndex" Type="String" />
                                <asp:Parameter Name="Keyword" Type="String" />
                                <asp:Parameter Name="ProductName" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="PriceFrom" Type="String" />
                                <asp:Parameter Name="PriceTo" Type="String" />
                                <asp:Parameter DefaultValue="3" Name="CategoryID" Type="String" />
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
                    <div class="popup-w">
                    <div class="table-book table-responsive">
                        <%--<table>
                            <tr>
                                <th class="book-name">
                                    Sản phẩm
                                </th>
                                <th class="book-number">
                                    Số lượng
                                </th>
                                <th class="book-cancel">
                                    Hủy
                                </th>
                            </tr>
                            <tr>
                                <td class="book-name1">
                                    MelyGra
                                </td>
                                <td class="book-number1">
                                    <asp:TextBox ID="txtQuantity" type="number" CssClass="text-number" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtQuantity"
                                        Display="Dynamic" ErrorMessage="Vui lòng nhập số!" ValidationExpression="^[0-9]+$"
                                        ValidationGroup="Information"></asp:RegularExpressionValidator>
                                </td>
                                <td class="book-cancel1">
                                    <a href="#"><span class="fa fa-times"></span></a>
                                </td>
                            </tr>
                            <tr>
                                <td class="book-name1">
                                    MelyGra 1H
                                </td>
                                <td class="book-number1">
                                    <asp:TextBox ID="TextBox2" type="number" CssClass="text-number" runat="server"></asp:TextBox>
                                </td>
                                <td class="book-cancel1">
                                    <a href="#"><span class="fa fa-times"></span></a>
                                </td>
                            </tr>
                            <tr>
                                <td class="book-name1">
                                    Trùng thảo bổ thậnn Vinacare
                                </td>
                                <td class="book-number1">
                                    <asp:TextBox ID="TextBox3" type="number" CssClass="text-number" runat="server"></asp:TextBox>
                                </td>
                                <td class="book-cancel1">
                                    <a href="#"><span class="fa fa-times"></span></a>
                                </td>
                            </tr>
                            <tr>
                                <td class="book-name1">
                                    MelyGra 1H
                                </td>
                                <td class="book-number1">
                                    <asp:TextBox ID="TextBox4" type="number" CssClass="text-number" runat="server"></asp:TextBox>
                                </td>
                                <td class="book-cancel1">
                                    <a href="#"><span class="fa fa-times"></span></a>
                                </td>
                            </tr>
                            <tr>
                                <td class="book-name1">
                                    Trùng thảo bổ thận Vinacare
                                </td>
                                <td class="book-number1">
                                    <asp:TextBox ID="TextBox5" type="number" CssClass="text-number" runat="server"></asp:TextBox>
                                </td>
                                <td class="book-cancel1">
                                    <a href="#"><span class="fa fa-times"></span></a>
                                </td>
                            </tr>
                        </table>--%>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="odsCart" EnableModelValidation="True"
                            OnItemCommand="ListView1_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td class="book-name1">
                                        <%# Eval("ProductName")%>
                                        <asp:HiddenField ID="hdnProductID" runat="server" Value='<%# Eval("ProductID") %>' />
                                    </td>
                                    <td class="book-number1">
                                        <asp:TextBox ID="txtQuantity" type="number" CssClass="text-number" runat="server"
                                            Text='<%# Eval("Quantity") %>' OnTextChanged="txtQuantity_TextChanged" AutoPostBack="True"></asp:TextBox>
                                        <asp:HiddenField ID="hdnQuantity" runat="server" Value='<%# Eval("Quantity") %>' />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtQuantity"
                                            Display="Dynamic" ErrorMessage="Vui lòng nhập số!" ValidationExpression="^[0-9]+$"
                                            ValidationGroup="SendEmail"></asp:RegularExpressionValidator>
                                        <asp:RangeValidator ID="RangeValidator" runat="server" ErrorMessage="Bạn nhập quá số lượng cho phép (1 - 12)"
                                            ControlToValidate="txtQuantity" MaximumValue="12" MinimumValue="1" Type="Integer"
                                            ValidationGroup="SendEmail" Display="Dynamic"></asp:RangeValidator>
                                    </td>
                                    <td class="book-cancel1">
                                        <%--<a href="#"><span class="fa fa-times"></span></a>--%>
                                        <asp:LinkButton ID="btnDelete" CommandName="Remove" runat="server"><span class="fa fa-times"></span></asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table>
                                    <thead>
                                        <tr>
                                            <th class="book-name">
                                                Sản phẩm
                                            </th>
                                            <th class="book-number">
                                                Số lượng
                                            </th>
                                            <th class="book-cancel">
                                                Hủy
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <span runat="server" id="itemPlaceholder"></span>
                                    </tbody>
                                </table>
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:ObjectDataSource ID="odsCart" runat="server" SelectMethod="Cart" TypeName="ShoppingCart2">
                        </asp:ObjectDataSource>
                    </div>
                </div>
                </div>
                <div class="form-thongtin">
                    <div class="popup-w">
                        <label class="popup-lb">
                            Họ tên</label>
                        <div class="popup-input">
                            <asp:TextBox ID="txtHoTen" CssClass="contact-textbox" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server"
                                Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtHoTen" ErrorMessage="Thông tin bắt buộc!"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="popup-w">
                        <label class="popup-lb">
                            Địa chỉ</label>
                        <div class="popup-input">
                            <asp:TextBox ID="txtAddress" CssClass="contact-textbox" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator4" runat="server"
                                ValidationGroup="SendEmail" Display="Dynamic" ControlToValidate="txtAddress"
                                ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="popup-w">
                        <label class="popup-lb">
                            Số điện thoại</label>
                        <div class="popup-input">
                            <asp:TextBox ID="txtPhone" CssClass="contact-textbox" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                                ValidationGroup="SendEmail" Display="Dynamic" ControlToValidate="txtPhone" ErrorMessage="Thông tin bắt buộc!"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="popup-w">
                        <label class="popup-lb">
                            Email</label>
                        <div class="popup-input">
                            <asp:TextBox ID="txtEmail" CssClass="contact-textbox" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator1"
                                runat="server" ValidationGroup="SendEmail" ControlToValidate="txtEmail" ErrorMessage="Sai định dạng email!"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                                ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                                ValidationGroup="SendEmail" ControlToValidate="txtEmail" ErrorMessage="Thông tin bắt buộc!"
                                Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                      <div class="popup-w">
                        <label class="popup-lb">
                            Mã xác nhận</label>
                        <div class="popup-input">
                            <asp:TextBox ID="txtVerifyCode" CssClass="contact-textbox text-capcha" runat="server"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="txtVerifyCode_WatermarkExtender" runat="server"
                                Enabled="True" WatermarkText="Mã xác nhận" TargetControlID="txtVerifyCode">
                            </asp:TextBoxWatermarkExtender>
                            <asp:RadCaptcha ID="RadCaptcha1" ValidatedTextBoxID="txtVerifyCode" ValidationGroup="SendEmail"
                                runat="server" Display="Dynamic" ErrorMessage="Mã xác nhận: không chính xác."
                                CaptchaLinkButtonText="Refesh" CssClass="capcha" EnableRefreshImage="False">
                                <CaptchaImage RenderImageOnly="True" Width="125" Height="35" BackgroundNoise="High"
                                    BackgroundColor="White" TextColor="Black" FontFamily="Tohoma" TextLength="5" />
                            </asp:RadCaptcha>
                        </div>
                    </div>
                    <%--<div class="popup-w">
                        <label class="popup-lb">
                            Ghi chú</label>
                        <div class="popup-input">
                            <asp:TextBox ID="txtContent" CssClass="contact-textbox" runat="server" TextMode="MultiLine" Rows="2" Width="100%"></asp:TextBox>
                        </div>
                    </div>--%>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
      
        <div class="popup-w">
            <div class="popup-btn">
                <asp:Button ID="btGui" ValidationGroup="SendEmail" OnClick="btGui_Click" CssClass="button-btn"
                    runat="server" Text="ĐẶT HÀNG" />
            </div>
        </div>
    </div>
    <div class="popup-btn-close">
        <img src="assets/images/btn-close.png" alt="" />
    </div>
</div>
