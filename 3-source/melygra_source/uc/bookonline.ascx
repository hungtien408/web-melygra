<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bookonline.ascx.cs" Inherits="uc_bookonline" %>
<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2012.3.1016.35, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=3.5.40412.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<div class="popup-content">
    <h1>
        ĐẶT HÀNG ONLINE</h1>
    <i>Vui lòng điền vào thông tin bên dưới để mua hàng</i>
    <div class="form-popup">
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
                DataTextField="ProductName" DataValueField="ProductID" AutoPostBack="True">
                <asp:ListItem>--Loại hàng--</asp:ListItem>
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
        <div class="popup-w">
            <div class="popup-btn">
                <asp:Button ID="btGui" ValidationGroup="SendEmail" OnClick="btGui_Click" CssClass="button-btn" runat="server" Text="TIẾN HÀNH ĐẶT HÀNG" />
            </div>
        </div>
    </div>
    <div class="popup-btn-close">
        <img src="assets/images/btn-close.png" alt="" />
    </div>
</div>
