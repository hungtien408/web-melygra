<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sendquestion.ascx.cs"
    Inherits="sendquestion" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=3.5.40412.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2012.3.1016.35, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>
<div class="ques-box">
    <h1>
        GỬI CÂU HỎI</h1>
    <div class="form-ques">
        <div class="ques-w">
            <div class="ques-input">
                <asp:TextBox ID="txtTitle" CssClass="ques-textbox" runat="server"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" Enabled="True"
                    WatermarkText="Tiêu đề" TargetControlID="txtTitle">
                </asp:TextBoxWatermarkExtender>
                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator4" runat="server"
                    Display="Dynamic" ValidationGroup="SendAnswer" ControlToValidate="txtTitle" ErrorMessage="Thông tin bắt buộc!"
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="ques-w">
            <div class="ques-input">
                <asp:TextBox ID="txtHoTen" CssClass="ques-textbox" runat="server"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="txtHoTen_WatermarkExtender" runat="server" Enabled="True"
                    WatermarkText="Họ tên" TargetControlID="txtHoTen">
                </asp:TextBoxWatermarkExtender>
                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server"
                    Display="Dynamic" ValidationGroup="SendAnswer" ControlToValidate="txtHoTen" ErrorMessage="Thông tin bắt buộc!"
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="ques-w">
            <div class="ques-input">
                <asp:TextBox ID="txtEmail" CssClass="ques-textbox" runat="server"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="txtEmail_WatermarkExtender" runat="server" Enabled="True"
                    WatermarkText="Email" TargetControlID="txtEmail">
                </asp:TextBoxWatermarkExtender>
                <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator1"
                    runat="server" ValidationGroup="SendEmail" ControlToValidate="txtEmail" ErrorMessage="Email không đúng!"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                    ForeColor="Red"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                    ValidationGroup="SendAnswer" ControlToValidate="txtEmail" ErrorMessage="Thông tin bắt buộc!"
                    Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="ques-w">
            <div class="ques-input">
                <asp:TextBox ID="txtNoiDung" CssClass="ques-area" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="txtNoiDung_WatermarkExtender" runat="server" Enabled="True"
                    WatermarkText="Nội dung câu hỏi" TargetControlID="txtNoiDung">
                </asp:TextBoxWatermarkExtender>
                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                    ValidationGroup="SendAnswer" Display="Dynamic" ControlToValidate="txtNoiDung"
                    ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="ques-w">
            <div class="ques-input">
                <asp:TextBox ID="txtVerifyCode" CssClass="ques-textbox" runat="server"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="txtVerifyCode_WatermarkExtender" runat="server"
                    Enabled="True" WatermarkText="Mã xác nhận" TargetControlID="txtVerifyCode">
                </asp:TextBoxWatermarkExtender>
                <asp:RadCaptcha ID="RadCaptcha1" ValidatedTextBoxID="txtVerifyCode" ValidationGroup="SendAnswer"
                    runat="server" Display="Dynamic" ErrorMessage="Mã xác nhận: không chính xác."
                    CaptchaLinkButtonText="Refesh" CssClass="capchaans" EnableRefreshImage="False">
                    <CaptchaImage RenderImageOnly="True" Width="125" Height="35" BackgroundNoise="High"
                        BackgroundColor="White" TextColor="Black" FontFamily="Tohoma" TextLength="5" />
                </asp:RadCaptcha>
            </div>
        </div>
        <div class="ques-w">
            <div class="ques-btn">
                <asp:Button ID="btnSendAnswer" CssClass="ques-btn" runat="server" Text="Gửi câu hỏi"
                    ValidationGroup="SendAnswer" OnClick="btnSendAnswer_Click" />
            </div>
        </div>
        <div class="ques-w">
            <asp:Label runat="server" ID="lblMessage" ForeColor="red"></asp:Label>
        </div>
    </div>
</div>
