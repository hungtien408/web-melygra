<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="san-pham.aspx.cs" Inherits="san_pham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>Melygra</title>
    <meta name="description" content="Melygra" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="colContent">
          <div class="product-main">
              <h1><span>SẢN PHẨM</span></h1>
              <div class="cate-news">
                <div class="item">
                    <div class="item-img">
                        <a href="san-pham-chi-tiet.aspx">
                            <img src="assets/images/sp1.png" alt="">
                        </a>
                    </div>
                    <div class="item-title">
                        <a href="san-pham-chi-tiet.aspx">Melygra</a>
                        <p>Melygra là sản phẩm thảo dược giúp hỗ trợ làm giảm triệu chứng ho ở trẻ. Với các thành phần chính: cao...</p>
                        <div class="view-sp"><a href="san-pham-chi-tiet.aspx">Xem thêm</a></div>
                    </div>
                </div>
                <div class="item">
                    <div class="item-img">
                        <a href="san-pham-chi-tiet.aspx">
                            <img src="assets/images/sp2.png" alt="">
                        </a>
                    </div>
                    <div class="item-title">
                        <a href="san-pham-chi-tiet.aspx">Melygra không sâm</a>
                        <p>Melygra là sản phẩm thảo dược giúp hỗ trợ làm giảm triệu chứng ho ở trẻ. Với các thành phần chính: cao...</p>
                        <div class="view-sp"><a href="san-pham-chi-tiet.aspx">Xem thêm</a></div>
                    </div>
                </div>
            </div>
          </div>
          <div class="product-info">
              <h1>Kiến thức bệnh học</h1>
              <div class="item-product">
                  <div class="item-img"><a href="#"><img src="assets/images/news-2.jpg" alt=""></a></div>      
                  <div class="item-name"><a href="#">4 bệnh liên quan đến đường ruột, tiêu hóa thường gặp nhất</a></div>
                  <div class="description">Những cơn ho dai dẳng kéo dài luôn là nỗi ám ảnh không chỉ của riêng trẻ mà còn cả với các bậc phụ huynh...</div>
              </div>
              <div class="item-product">
                  <div class="item-img"><a href="#"><img src="assets/images/sp3.jpg" alt=""></a></div>      
                  <div class="item-name"><a href="#">4 bệnh liên quan đến đường ruột, tiêu hóa thường gặp nhất</a></div>
                  <div class="description">Những cơn ho dai dẳng kéo dài luôn là nỗi ám ảnh không chỉ của riêng trẻ mà còn cả với các bậc phụ huynh...</div>
              </div>
              <div class="item-product">
                  <div class="item-img"><a href="#"><img src="assets/images/sp4.jpg" alt=""></a></div>      
                  <div class="item-name"><a href="#">4 bệnh liên quan đến đường ruột, tiêu hóa thường gặp nhất</a></div>
                  <div class="description">Những cơn ho dai dẳng kéo dài luôn là nỗi ám ảnh không chỉ của riêng trẻ mà còn cả với các bậc phụ huynh...</div>
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
         <div class="distribution-aside">
           <div class="dis-name">
               HỆ THỐNG <span>PHÂN PHỐI</span>
           </div>
           <div class="phone-aside">
               TỔNG ĐÀI TƯ VẤN <span>(08) 3962 1798</span>
           </div>
       </div>
      </div>
</asp:Content>

