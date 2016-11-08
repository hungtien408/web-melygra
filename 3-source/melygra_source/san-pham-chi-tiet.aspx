<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true"
    CodeFile="san-pham-chi-tiet.aspx.cs" Inherits="san_pham_chi_tiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="colCotent" runat="Server">
    <div class="product-main">
        <h1>
            <span>SẢN PHẨM</span></h1>
        <asp:ListView ID="lstProductDetails" runat="server" DataSourceID="odsProductDetails"
            EnableModelValidation="True" OnItemCommand="lstProductDetails_ItemCommand">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
                <asp:HiddenField ID="hdnProductID" Value='<%# Eval("ProductID") %>' runat="server" />
                <asp:HiddenField ID="hdnImageName" Value='<%# Eval("ImageName") %>' runat="server" />
                <asp:HiddenField ID="hdnPrice" Value='<%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "0" : Eval("Price") %>'
                    runat="server" />
                <asp:Label ID="lblProductName" Visible="False" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                <div class="bnt">
                    <div class="bnt-dh">
                        <%--<a href='<%# progressTitle(Eval("ProductName")) + "-dh-" + Eval("ProductID") + ".aspx" %>'>ĐẶT HÀNG NGAY!</a>--%>
                        <asp:LinkButton ID="lkbAddToCart" runat="server" CommandName="AddToCart" ValidationGroup="cart">ĐẶT HÀNG NGAY!</asp:LinkButton></div>
                    <div class="btn-tv">
                        <a href="javascript:void(0);">TƯ VẤN <strong>091 926 3399</strong></a></div>
                    <div class="btn-db">
                        <a href="he-thong-phan-phoi.aspx">ĐIỂM BÁN</a></div>
                </div>
            </ItemTemplate>
            <EmptyDataTemplate>
                <div class="wrapper-product">
                    <div class="pro-detail">
                        <div class="proimg">
                            <img src="assets/images/sp5.png" alt="" />
                        </div>
                        <div class="pro-info">
                            <h1>
                                Melygra</h1>
                            <h2>
                                <span>THÀNH PHẦN</span></h2>
                            <ul>
                                <li>
                                    <div class="li1">
                                        Cao Bá bệnh</div>
                                    <div class="li2">
                                        100mg</div>
                                </li>
                                <li>
                                    <div class="li1">
                                        Cao Maca Root</div>
                                    <div class="li2">
                                        25mg</div>
                                </li>
                                <li>
                                    <div class="li1">
                                        Cao Bạch tật lê</div>
                                    <div class="li2">
                                        75mg</div>
                                </li>
                                <li>
                                    <div class="li1">
                                        Cao Dâm dương hoắc</div>
                                    <div class="li2">
                                        25mg</div>
                                </li>
                                <li>
                                    <div class="li1">
                                        Cao Tiêu mao</div>
                                    <div class="li2">
                                        25mg</div>
                                </li>
                                <li>
                                    <div class="li1">
                                        Cao Nhân sâm (Ginseng)</div>
                                    <div class="li2">
                                        50mg</div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="wrapper-text">
                    <div class="text-box">
                        <h1>
                            Công dụng</h1>
                        <p>
                            <img src="assets/images/img-text1.png" alt="" />Giúp bổ phế, long đờm, giảm ho,
                            làm ấm đường hô hấp</p>
                        <p>
                            <img src="assets/images/img-text1.png" alt="" />Giúp giảm các triệu chứng ho do
                            viêm phế quản, ho do dị ứng, ho khan, ho có đờm</p>
                        <p>
                            <img src="assets/images/img-text1.png" alt="" />Hỗ trợ giảm nôn, trớ ở trẻ em</p>
                    </div>
                    <div class="text-box">
                        <h1>
                            Đối tượng sử dụng</h1>
                        <p>
                            <img src="assets/images/img-text2.png" alt="" style="padding: 0 6px 1px 0">Người
                            lớn, Trẻ em bị ho</p>
                        <p>
                            <img src="assets/images/img-text2.png" alt="" style="padding: 0 6px 1px 0">Viêm
                            phế quản
                        </p>
                        <p>
                            <img src="assets/images/img-text2.png" alt="" style="padding: 0 6px 1px 0">Viêm
                            đường hô hấp</p>
                    </div>
                    <div class="text-box">
                        <h1>
                            Hướng dẫn sử dụng</h1>
                        <p>
                            <img src="assets/images/img-text2.png" alt="" style="padding: 0 6px 1px 0">Trẻ từ
                            2 đến 5 tuổi: 2,5 - 5ml/lần, ngày 3 - 4 lần.</p>
                        <p>
                            <img src="assets/images/img-text2.png" alt="" style="padding: 0 6px 1px 0">Trẻ trên
                            5 tuổi và người lớn: 5 - 10ml/lần hoặc 1 - 2 gói/lần, ngày 3 - 4 lần.</p>
                        <p>
                            <img src="assets/images/img-text2.png" alt="" style="padding: 0 6px 1px 0">Trẻ dưới
                            2 tuổi: Hỏi ý kiến của bác sĩ trước khi sử dụng.</p>
                    </div>
                    <div class="text-box">
                        <h1>
                            Bảo quản</h1>
                        <p>
                            <img src="assets/images/img-text2.png" alt="" style="padding: 0 6px 1px 0">Nơi khô
                            ráo thoáng mát tránh ánh nắng chiếu trực tiếp.</p>
                    </div>
                    <div class="text-box">
                        <h1>
                            Thời hạn sử dụng</h1>
                        <p>
                            <img src="assets/images/img-text2.png" alt="" style="padding: 0 6px 1px 0">36 tháng
                            kể từ ngày sản xuất.
                        </p>
                        <p>
                            <img src="assets/images/img-text2.png" alt="" style="padding: 0 6px 1px 0">Ngày
                            sản xuất và hạn sử dụng ghi trên nhãn sản phẩm.</p>
                    </div>
                    <div class="text-box">
                        <h1>
                            Quy cách đóng gói</h1>
                        <p>
                            <img src="assets/images/img-text2.png" alt="" style="padding: 0 6px 1px 0">Gói 5ml</p>
                        <p>
                            <img src="assets/images/img-text2.png" alt="" style="padding: 0 6px 1px 0">Hộp 20
                            gói</p>
                        <p>
                            <img src="assets/images/img-text2.png" alt="" style="padding: 0 6px 1px 0">Chai
                            100ml.</p>
                    </div>
                    <div class="note">
                        <p>
                            ( <span>*</span> Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc
                            chữa bệnh )</p>
                    </div>
                </div>
            </EmptyDataTemplate>
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsProductDetails" runat="server" SelectMethod="ProductSelectOne"
            TypeName="TLLib.Product">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductID" QueryStringField="pi" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <div class="fb-main">
            <%--<img src="assets/images/fb.jpg" alt="" />--%>
            <div class="fb-comments" data-href='<%= Request.Url.Scheme + "://" + Page.Request.Url.Host + "/" + Request.Url.AbsolutePath.Substring(Request.Url.AbsolutePath.LastIndexOf("/", System.StringComparison.Ordinal) + 1) %>'
                data-width="675" data-numposts="5" data-colorscheme="light">
            </div>
        </div>
        <div class="product-involve">
            <div class="product-content">
                <h1>
                    Sản phẩm liên quan</h1>
                <div class="product-box">
                    <asp:ListView ID="lstProductSame" runat="server" DataSourceID="odsProductSame" EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="item">
                                <div class="pro-img">
                                    <a href='<%# progressTitle(Eval("ProductName")) + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                        <img id="Img1" alt='<%# Eval("ProductName") %> ' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                            visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                            runat="server" /></a>
                                </div>
                                <div class="pro-name">
                                    <a href='<%# progressTitle(Eval("ProductName")) + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                        <%# Eval("ProductName") %></a>
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsProductSame" runat="server" SelectMethod="ProductSameSelectAll"
                        TypeName="TLLib.Product">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="10" Name="RerultCount" Type="String" />
                            <asp:QueryStringParameter DefaultValue="" Name="ProductID" QueryStringField="pi"
                                Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
