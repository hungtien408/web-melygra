<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="thong-tin-dat-hang.aspx.cs" Inherits="thong_tin_dat_hang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Melygra</title>
    <meta name="description" content="Melygra" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="book-product">
        <h3 class="id-dathang">
            THÔNG TIN ĐẶT HÀNG</h3>
        <div class="colContent">
            <div class="thanh-toan-table table-responsive">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="odsCart" EnableModelValidation="True"
                            OnItemCommand="ListView1_ItemCommand" OnDataBound="ListView1_DataBound">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <p>
                                            <%# Eval("ProductName")%></p>
                                        <img id="Img1" alt='<%# Eval("ProductName") %> ' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                            visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                            runat="server" />
                                    </td>
                                    <td>
                                        <asp:HiddenField ID="hdnCartProductID" Value='<%# Eval("ProductID") %>' runat="server" />
                                        <asp:HiddenField ID="hdnCartPrice" Value='<%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "0" : Eval("Price") %>'
                                            runat="server" />
                                        <%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "0" : string.Format("{0:##,###.##}", Eval("Price")).Replace('.', '*').Replace(',', '.').Replace('*', ',') %>
                                        VNĐ
                                    </td>
                                    <td>
                                        <%--<asp:DropDownList ID="dropSoLuong" CssClass="selectb" runat="server" OnSelectedIndexChanged="dropSoLuong_SelectedIndexChanged"
                                            AutoPostBack="True">
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                        </asp:DropDownList>--%>
                                        <asp:TextBox ID="txtQuantity" CssClass="kh-textbox" runat="server" Text='<%# Eval("Quantity") %>'
                                            OnTextChanged="txtQuantity_TextChanged" AutoPostBack="true"></asp:TextBox>
                                        <asp:HiddenField ID="hdnQuantity" runat="server" Value='<%# Eval("Quantity") %>' />
                                    </td>
                                    <td>
                                        <%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "0 VNĐ" : "<strong>" + (string.Format("{0:##,###.##}", Convert.ToInt16(string.IsNullOrEmpty(Eval("Quantity").ToString()) ? 0 : Eval("Quantity")) * Convert.ToDouble(string.IsNullOrEmpty(Eval("Price").ToString()) ? 0 : Eval("Price"))).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> VNĐ"%>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <div class="note">
                                    Chưa có sản phẩm trong giỏ hàng của bạn! <a href="san-pham.aspx">Mua sản phẩm</a>.
                                </div>
                            </EmptyDataTemplate>
                            <LayoutTemplate>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>
                                                Tên sản phẩm
                                            </th>
                                            <th>
                                                Giá bán
                                            </th>
                                            <th>
                                                Số lượng
                                            </th>
                                            <th>
                                                Thành tiền
                                            </th>
                                        </tr>
                                    </thead>
                                    <tfoot class="hidden">
                                        <tr>
                                            <td colspan="2" class="col-1 hide-mo">
                                            </td>
                                            <td colspan="4" class="col-2">
                                                <div class="box-price">
                                                    <span>thành tiền</span> <span class="price"><strong>
                                                        <asp:Label ID="lblTotalPrice" runat="server"></asp:Label>
                                                        <asp:HiddenField ID="hdnTotalPrice" runat="server" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6">
                                                <div class="box-price">
                                                    <span>tổng tiền</span> <span class="price"><strong>
                                                        <asp:Label ID="lblSumTotalPrice" runat="server"></asp:Label>
                                                        <asp:HiddenField ID="hdnSumTotalPrice" runat="server" />
                                                </div>
                                            </td>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <span runat="server" id="itemPlaceholder"></span>
                                    </tbody>
                                </table>
                            </LayoutTemplate>
                        </asp:ListView>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <%--<asp:ObjectDataSource ID="odsSanPhamChiTiet" runat="server" SelectMethod="ProductSelectOne"
                    TypeName="TLLib.Product">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ProductID" QueryStringField="dh" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>--%>
                <asp:ObjectDataSource ID="odsCart" runat="server" SelectMethod="Cart" TypeName="ShoppingCart">
                </asp:ObjectDataSource>
            </div>
            <div class="bnt-muathem">
                <asp:Button ID="btnBuyMore" Text="MUA THÊM" CssClass="tt-textbox" runat="server"
                    OnClick="btnBuyMore_Click" /></div>
            <div class="form-danghang">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="info-kh">
                            <h1>
                                Thông tin khách hàng</h1>
                            <div class="form-box">
                                <div class="kh-w">
                                    <label class="kh-lb">
                                        Họ tên <span style="color: red;">(*)</span></label>
                                    <div class="popup-input">
                                        <asp:TextBox ID="txtFullName" CssClass="kh-textbox" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server"
                                            Display="Dynamic" ValidationGroup="SendInfo" ControlToValidate="txtFullName"
                                            ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="kh-w">
                                    <label class="kh-lb">
                                        Email <span style="color: red;">(*)</span></label>
                                    <div class="kh-input">
                                        <asp:TextBox ID="txtEmail" CssClass="kh-textbox" runat="server" placeholder=""></asp:TextBox>
                                        <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator1"
                                            runat="server" ValidationGroup="SendInfo" ControlToValidate="txtEmail" ErrorMessage="Email không đúng!"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                                            ForeColor="Red"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                                            ValidationGroup="SendInfo" ControlToValidate="txtEmail" ErrorMessage="Thông tin bắt buộc!"
                                            Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="kh-w">
                                    <label class="kh-lb">
                                        Số điện thoại <span style="color: red;">(*)</span></label>
                                    <div class="kh-input">
                                        <asp:TextBox ID="txtPhone" CssClass="kh-textbox" runat="server" placeholder=""></asp:TextBox>
                                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                                            Display="Dynamic" ValidationGroup="SendInfo" ControlToValidate="txtPhone" ErrorMessage="Thông tin bắt buộc!"
                                            ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="kh-w">
                                    <label class="kh-lb">
                                        Địa chỉ <span style="color: red;">(*)</span></label>
                                    <div class="popup-input">
                                        <asp:TextBox ID="txtAddress" CssClass="kh-textbox" runat="server" placeholder=""></asp:TextBox>
                                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator5" runat="server"
                                            ValidationGroup="SendInfo" ControlToValidate="txtAddress" ErrorMessage="Thông tin bắt buộc!"
                                            Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="info-dc">
                            <h1>
                                Thông tin khách hàng</h1>
                            <div class="form-box1">
                                <%--<div class="kh-w">
                                    <label class="kh-lb">
                                        Loại địa chỉ</label>
                                    <asp:DropDownList ID="dropLoaiDiaChi" CssClass="selectb" runat="server">
                                        <asp:ListItem>Nhà riêng/Chung cư</asp:ListItem>
                                        <asp:ListItem>Nhà riêng</asp:ListItem>
                                        <asp:ListItem>Chung cư</asp:ListItem>
                                    </asp:DropDownList>
                                </div>--%>
                                <div class="kh-w">
                                    <label class="kh-lb">
                                        Tỉnh/Thành phố</label>
                                    <asp:DropDownList ID="dropTinhThanh" CssClass="selectb" runat="server" DataSourceID="odsTinhThanh"
                                        DataTextField="ProvinceName" DataValueField="ProvinceID" AutoPostBack="True">
                                        <asp:ListItem>Chọn Tỉnh/Thành Phố</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="odsTinhThanh" runat="server" SelectMethod="ProvinceSelectAll"
                                        TypeName="TLLib.Province">
                                        <SelectParameters>
                                            <asp:Parameter Name="ProvinceID" Type="String" />
                                            <asp:Parameter Name="ProvinceName" Type="String" />
                                            <asp:Parameter Name="ShortName" Type="String" />
                                            <asp:Parameter Name="CountryID" Type="String" />
                                            <asp:Parameter Name="Priority" Type="String" />
                                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </div>
                                <div class="kh-w">
                                    <label class="kh-lb">
                                        Quận/Huyện</label>
                                    <asp:DropDownList ID="dropListQuan" CssClass="selectb" runat="server" DataSourceID="odsQuan"
                                        DataTextField="DistrictName" DataValueField="DistrictID" AutoPostBack="True">
                                        <asp:ListItem>Chọn Quận/Huyện</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="odsQuan" runat="server" SelectMethod="DistrictSelectAll"
                                        TypeName="TLLib.District">
                                        <SelectParameters>
                                            <asp:Parameter Name="DistrictName" Type="String" />
                                            <asp:ControlParameter ControlID="dropTinhThanh" Name="ProvinceIDs" PropertyName="SelectedValue"
                                                Type="String" />
                                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                            <asp:Parameter Name="Priority" Type="String" />
                                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </div>
                                <div class="kh-w">
                                    <label class="kh-lb">
                                        Ghi chú</label>
                                    <div class="kh-input">
                                        <asp:TextBox ID="txtNote" CssClass="kh-area" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                                <p>
                                    <span>*</span> Vui lòng điền đầy đủ thông tin khi đặt hàng</p>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="colAside">
            <div class="thanh-toan">
                <h3>
                    Giá trị đơn đặt hàng</h3>
                <div class="thanh-toan-content">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <div class="top-thanh-toan">
                                <p>
                                    Tổng cộng:</p>
                                <span>
                                    <asp:Label ID="lblTongCong" runat="server" Text="0"></asp:Label>
                                </span>
                            </div>
                            <%--<div class="bot-thanh-toan">
                                <p>
                                    Thành tiền:</p>
                                <span>
                                    <asp:Label ID="lblThanhTien2" runat="server" Text="0"></asp:Label>
                                    VNĐ</span>
                            </div>--%>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="btn-thanh-toan">
                        <asp:Button ID="btnHuy" Text="HỦY" CssClass="tt-textbox" runat="server" OnClick="btnHuy_Click" />
                        <asp:Button ID="btnDatHang" Text="ĐẶT HÀNG" CssClass="tt-textbox" runat="server"
                            ValidationGroup="SendInfo" OnClick="btnDatHang_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
