<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="thong-tin-dat-hang.aspx.cs" Inherits="thong_tin_dat_hang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Melygra</title>
    <meta name="description" content="Melygra" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="book-product">
          <h3 class="id-dathang">THÔNG TIN ĐẶT HÀNG</h3>
           <div class="colContent">
            <div class="thanh-toan-table table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Tên sản phẩm</th>
                            <th>Giá bán</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <p>Melygra không sâm</p>
                                <img src="assets/images/sp2.png" alt="" />
                            </td>
                            <td>199.000 VNĐ</td>
                            <td>
                                <select>
                                    <option value="value">1</option>
                                    <option value="value">2</option>
                                    <option value="value">3</option>
                                    <option value="value">4</option>
                                    <option value="value">5</option>
                                    <option value="value">6</option>
                                </select>
                            </td>
                            <td>199.000 VNĐ</td>
                        </tr>
                    </tbody>
                </table>
            </div>
               <div class="form-danghang">
                   <div class="info-kh">
                       <h1>Thông tin khách hàng</h1>
                       <div class="form-box">
                            <div class="kh-w">
                                <label class="kh-lb">Họ tên</label>
                                <div class="popup-input">
                                    <asp:TextBox ID="TextBox5" CssClass="kh-textbox" runat="server" placeholder=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="kh-w">
                                <label class="kh-lb">Email</label>
                                <div class="kh-input">
                                    <asp:TextBox ID="TextBox7" CssClass="kh-textbox" runat="server" placeholder=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="kh-w">
                                <label class="kh-lb">Số điện thoại</label>
                                <div class="kh-input">
                                    <asp:TextBox ID="TextBox6" CssClass="kh-textbox" runat="server" placeholder=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="kh-w">
                                <label class="kh-lb">Ghi chú</label>
                                <div class="kh-input">
                                    <asp:TextBox ID="TextBox4" CssClass="kh-area" runat="server" TextMode="MultiLine" placeholder=""></asp:TextBox>
                                </div>
                            </div>
                        </div>
                   </div>
                   <div class="info-dc">
                       <h1>Thông tin khách hàng</h1>
                        <div class="form-box1">
                            <div class="kh-w">
                                <label class="kh-lb">Địa chỉ</label>
                                <div class="popup-input">
                                    <asp:TextBox ID="TextBox1" CssClass="kh-textbox" runat="server" placeholder=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="kh-w">
                                <label class="kh-lb">Loại địa chỉ</label>
                                <select>
                                  <option value=""selected>Nhà riêng/Chung cư</option>
                                  <option value="">Nhà riêng</option>
                                  <option value="">Chung cư</option>
                                </select>
                            </div>
                            <div class="kh-w">
                                <label class="kh-lb">Tỉnh/Thành phố</label>
                                <select>
                                  <option value=""selected>Chọn Tỉnh/Thành phố</option>
                                  <option value="">2</option>
                                  <option value="">3</option>
                                </select>
                            </div>
                            <div class="kh-w">
                                <label class="kh-lb">Quận/Huyện</label>
                                <select>
                                  <option value=""selected>Chọn Quận/Huyện</option>
                                  <option value="">Nhà riêng</option>
                                  <option value="">Chung cư</option>
                                </select>
                            </div>
                           <p><span>*</span> Vui lòng điền đầy đủ thông tin khi đặt hàng</p>
                       </div>
                   </div>
               </div>
        </div>
         <div class="colAside">
            <div class="thanh-toan">
                <h3>Giá trị đơn đặt hàng</h3>
                <div class="thanh-toan-content">
                    <div class="top-thanh-toan">
                        <p>Tổng cộng:</p>
                        <span>199.000 VNĐ</span>
                    </div>
                    <div class="bot-thanh-toan">
                        <p>Thành tiền:</p>
                        <span>199.000 VNĐ</span>
                    </div>
                    <div class="btn-thanh-toan">
                        <asp:button ID="Button1" text="HỦY" CssClass="tt-textbox" runat="server" />
                        <asp:button ID="Button2" text="ĐẶT HÀNG" CssClass="tt-textbox" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

