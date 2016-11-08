<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="bi-kip-phong-the.aspx.cs" Inherits="bi_kip_phong_the" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Melygra</title>
    <meta name="description" content="Melygra" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="colContent">
          <div class="title-main bor-bot bg1">
           <h1>Bí quyết phòng the</h1>
       </div>
        <div class="bikip-main">
            <div class="bikip-item">
                <div class="bikip-img">
                    <a href="#"><img src="assets/images/hinh7.png" alt="" /></a>
                </div>
                <div class="bikip-name">
                    <a href="#">Bí kíp phòng the từ Ấn Độ Kama Sutra</a>
                </div>
                <div class="view-box">
                     <a href="#">Xem thêm</a>
                 </div>
            </div>
            <div class="bikip-item">
                <div class="bikip-img">
                    <a href="#"><img src="assets/images/hinh8.png" alt="" /></a>
                </div>
                <div class="bikip-name">
                    <a href="#">Bí quyết hành sự Tố Nữ Kinh</a>
                </div>
                <div class="view-box">
                     <a href="#">Xem thêm</a>
                 </div>
            </div>
        </div>

     </div>
     <div class="colAside">
         <div class="book-onl">
          <div class="boook-text"><span>ĐẶT HÀNG</span></div>
          <div class="book-btn"><a class="btn-popup" href="#">Đặt ngay</a></div>
          <div class="popup">
            <div class="popup-content">
                <h1>ĐẶT HÀNG ONLINE</h1>
                <i>Vui lòng điền vào thông tin bên dưới để mua hàng</i>
                <div class="form-popup">
                    <div class="popup-w">
                        <label class="popup-lb">Loại hàng</label>
                        <select>
                          <option value=""selected>--Loại hàng--</option>
                          <option value="">Loại 1</option>
                          <option value="">Loại 2</option>
                          <option value="">Loại 3</option>
                        </select>
                    </div>
                    <div class="popup-w">
                        <label class="popup-lb">Họ tên</label>
                        <div class="popup-input">
                            <asp:TextBox ID="TextBox5" CssClass="contact-textbox" runat="server" placeholder=""></asp:TextBox>
                        </div>
                    </div>
                     <div class="popup-w">
                        <label class="popup-lb">Số điện thoại</label>
                        <div class="popup-input">
                            <asp:TextBox ID="TextBox6" CssClass="contact-textbox" runat="server" placeholder=""></asp:TextBox>
                        </div>
                    </div>
                     <div class="popup-w">
                        <label class="popup-lb">Email</label>
                        <div class="popup-input">
                            <asp:TextBox ID="TextBox7" CssClass="contact-textbox" runat="server" placeholder=""></asp:TextBox>
                        </div>
                    </div>
                    <div class="popup-w">
                        <div class="popup-btn">
                            <asp:button ID="Button2" CssClass="button-btn" runat="server" text="TIẾN HÀNH ĐẶT HÀNG" />
                        </div>
                    </div>
                </div>
                <div class="popup-btn-close">
                    <img src="assets/images/btn-close.png" alt=""/>
                </div>
            </div>
        </div>
      </div>
         <div class="video-main">
            <div class="wrapper-video">
                <div class="video-details">
                    <div id="jwplayer3"></div>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            jwplayer('jwplayer3').setup({
                                image: "assets/images/video1.png",
                                //image: '<%# "res/product/" + Eval("ImageName") %>',
                                //file: '<%# !string.IsNullOrEmpty( Eval("VideoPath").ToString()) ? "res/product/video/" + Eval("VideoPath") : ""%>',
                                file: "https://youtu.be/PDZH-x2nNRM",
                                flashplayer: "assets/js/jwplayer.flash.swf",
                                width: '100%',
                                aspectratio: '16:9',
                                primary: "html5",
                                width: '100%',
                            });
                        });
                    </script>
                </div>
            </div>
            <div class="video-title">
              Quảng cáo Melygra
            </div>
        </div>
         <div class="link-fb">
            <img src="assets/images/fb-img.png" alt=""/>
        </div>
     </div>
</asp:Content>

