<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="bi-kip-phong-the-2.aspx.cs" Inherits="bi_kip_phong_the" %>

<%@ Register TagPrefix="uc2" TagName="video" Src="~/uc/video.ascx" %>
<%@ Register TagPrefix="uc3" TagName="bookonline" Src="~/uc/bookonline.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="colContent">
        <div class="title-main bor-bot bg1">
            <h1>
                Bí quyết phòng the</h1>
        </div>
        <div class="bikip-main">
            <asp:ListView ID="lstBiKipPhongThe" runat="server" DataSourceID="odsBiKipPhongThe"
                EnableModelValidation="True">
                <ItemTemplate>
                    <asp:HiddenField ID="hdnProductID" runat="server" Value='<%# Eval("ProductID") %>' />
                    <asp:ListView ID="lstBKDetails" runat="server" DataSourceID="odsBKDetails" EnableModelValidation="True">
                        <ItemTemplate>
                            <span class="Field_input">
                                <asp:HiddenField ID="hdnLinkDownload" runat="server" Value='<%# "assets/web/viewer.aspx?file=" + Request.Url.Scheme +"://"+ Request.Url.Host + "/res/product/download/" + Eval("LinkDownload") %>' />
                            </span>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsBKDetails" runat="server" SelectMethod="ProductDownloadSelectAll"
                        TypeName="TLLib.ProductDownload">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hdnProductID" Name="ProductID" PropertyName="Value"
                                Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <div class="bikip-item">
                        <div class="bikip-img">
                            <%--<a href='<%# progressTitle(Eval("ProductName")) + "-bk-" + Eval("ProductID") + ".aspx" %>'>--%>
                            <%--<a href='<%# "assets/web/viewer.aspx?file=res/product/download/" + Eval("LinkDownload") %>'>--%>
                            <a href="">
                                <img id="Img2" alt='<%# Eval("ProductName") %> ' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                    visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                    runat="server" /></a>
                        </div>
                        <div class="bikip-name">
                            <%--<a href='<%# progressTitle(Eval("ProductName")) + "-bk-" + Eval("ProductID") + ".aspx" %>'>
                                <%# Eval("ProductName") %></a>--%>
                            <a href="">
                                <%# Eval("ProductName") %></a>
                        </div>
                        <div class="view-box">
                            <%--<a href='<%# progressTitle(Eval("ProductName")) + "-bk-" + Eval("ProductID") + ".aspx" %>'>
                                Xem thêm</a>--%>
                            <a href="">Xem thêm</a>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <style>
                .bikip-main .Field_input {
                    position: absolute;
                }
            </style>
            <script type="text/javascript">
                $(document).ready(function () {
                    //debugger;
                    var x = $('.bikip-main .Field_input').length; // 2
                    var x = $('.bikip-main .bikip-item').length; // 2
                    console.log(x);
                    for (var i = 0; i <= x; i++) {
                        $('.bikip-main span.Field_input:nth-of-type(' + i + ')').attr('id', i);
                        $('.bikip-main div.bikip-item:nth-of-type(' + i + ')').attr('data-id', i);
                    }
                    $('.bikip-main span.Field_input').each(function () {
                        var x = $(this).attr('id');
                        var link_val = $(this).find('input[type="hidden"]').val();
                        //console.log(link_val);

                        $('.bikip-main div.bikip-item[data-id ="' + x + '"]').find('a').attr('href', link_val);
                    });
                });
                //$("[id$='hdnLinkDownload']").each(function () {
                //    var a = $(this).val();
                //    $('.bikip-item a').attr("href", a);
                //});
            </script>
            <asp:ObjectDataSource ID="odsBiKipPhongThe" runat="server" SelectMethod="ProductSelectAll"
                TypeName="TLLib.Product">
                <SelectParameters>
                    <asp:Parameter Name="StartRowIndex" Type="String" />
                    <asp:Parameter Name="EndRowIndex" Type="String" />
                    <asp:Parameter Name="Keyword" Type="String" />
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="PriceFrom" Type="String" />
                    <asp:Parameter Name="PriceTo" Type="String" />
                    <asp:Parameter DefaultValue="21" Name="CategoryID" Type="String" />
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
    </div>
    <div class="colAside">
        <div class="book-onl">
            <div class="boook-text">
                <span>ĐẶT HÀNG</span></div>
            <div class="book-btn">
                <a class="btn-popup" href="javascript:void(0);">Đặt ngay</a></div>
            <div class="popup">
                <uc3:bookonline runat="server" ID="bookonline" />
            </div>
        </div>
        <div class="video-main">
            <div class="wrapper-video">
                <uc2:video runat="server" ID="video" />
            </div>
            <div class="video-title">
                Quảng cáo Melygra
            </div>
        </div>
        <div class="link-fb">
            <%--<img src="assets/images/fb-img.png" alt="" />--%>
            <div id="facebook">
                <div class="fb-page" data-href="https://www.facebook.com/bacsibezut" data-small-header="false"
                    data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"
                    data-show-posts="false">
                    <div class="fb-xfbml-parse-ignore">
                        <blockquote cite="https://www.facebook.com/bacsibezut">
                            <a href="https://www.facebook.com/bacsibezut">Bezut</a></blockquote>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
