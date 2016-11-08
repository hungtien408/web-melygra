<%@ Page Title="" Language="C#" MasterPageFile="~/ad/template/adminEn.master" AutoEventWireup="true"
    CodeFile="tuvanchuyengia.aspx.cs" Inherits="ad_single_article" %>

<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <link href="../assets/styles/rating.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        var tableView = null;
        function RowDblClick(sender, eventArgs) {
            sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
        }

        function RowMouseOver(sender, eventArgs) {
            var selectedRows = sender.get_masterTableView().get_selectedItems();
            var elem = $get(eventArgs.get_id());
            if (selectedRows.length > 0)
                for (var i = 0; i < selectedRows.length; i++) {
                    var selectedID = selectedRows[i].get_id();

                    if (selectedID != eventArgs.get_id())
                        elem.className += (" rgSelectedRow");
                }
            else
                elem.className += (" rgSelectedRow");
        }

        function RowMouseOut(sender, eventArgs) {
            var className = "rgSelectedRow";
            var elem = $get(eventArgs.get_id());

            var selectedRows = sender.get_masterTableView().get_selectedItems();

            if (selectedRows.length > 0)
                for (var i = 0; i < selectedRows.length; i++) {
                    var selectedID = selectedRows[i].get_id();
                    if (selectedID != eventArgs.get_id())
                        removeCssClass(className, elem);
                }
            else
                removeCssClass(className, elem);
        }

        function removeCssClass(className, element) {
            element.className = element.className.replace(className, "").replace(/^\s+/, '').replace(/\s+$/, '');
        }

        function pageLoad(sender, args) {
            tableView = $find("<%= RadGrid1.ClientID %>").get_masterTableView();
        }

        function RadComboBox1_SelectedIndexChanged(sender, args) {
            tableView.set_pageSize(sender.get_value());
        }

        function changePage(argument) {
            tableView.page(argument);
        }

        function RadNumericTextBox1_ValueChanged(sender, args) {
            tableView.page(sender.get_value());
        }

        //On insert and update buttons click temporarily disables ajax to perform upload actions
        function conditionalPostback(sender, eventArgs) {
            var theRegexp = new RegExp("\.lnkUpdate$|\.lnkUpdateTop$|\.PerformInsertButton$", "ig");
            if (eventArgs.get_eventTarget().match(theRegexp)) {
                var upload = $find(window['UploadId']);

                //AJAX is disabled only if file is selected for upload
                if (upload.getFileInputs()[0].value != "") {
                    eventArgs.set_enableAjax(false);
                }
            }
            else if (eventArgs.get_eventTarget().indexOf("ExportToExcelButton") >= 0 || eventArgs.get_eventTarget().indexOf("ExportToWordButton") >= 0 || eventArgs.get_eventTarget().indexOf("ExportToPdfButton") >= 0)
                eventArgs.set_enableAjax(false);
        }

        function validateRadUpload(source, e) {
            e.IsValid = false;

            var upload = $find(source.parentNode.getElementsByTagName('div')[0].id);
            var inputs = upload.getFileInputs();
            for (var i = 0; i < inputs.length; i++) {
                //check for empty string or invalid extension
                if (upload.isExtensionValid(inputs[i].value)) {
                    e.IsValid = true;
                    break;
                }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">
    <h3 class="mainTitle">
        <img alt="" src="../assets/images/comment.png" class="vam" />
        Tư Vấn Chuyên Gia
    </h3>
    <asp:RadAjaxPanel ID="RadAjaxPanel1" runat="server" ClientEvents-OnRequestStart="conditionalPostback">
        <asp:Panel ID="pnlSearch" DefaultButton="btnSearch" runat="server">
            <table class="search">
                <tr>
                    <td class="left">
                        Từ khóa
                    </td>
                    <td>
                        <asp:RadTextBox ID="txtSearchKeyword" runat="server" Width="130px" EmptyMessage="Từ khóa...">
                        </asp:RadTextBox>
                    </td>
                    <td class="left invisible">
                        Link
                    </td>
                    <td class="invisible">
                        <asp:RadTextBox ID="txtSearchLink" runat="server" Width="130px" EmptyMessage="Link...">
                        </asp:RadTextBox>
                    </td>
                    <td class="left invisible">
                        User
                    </td>
                    <td class="invisible">
                        <asp:RadComboBox Filter="Contains" ID="ddlSearchUser" CssClass="dropdownlist" Width="134px"
                            runat="server" DataSourceID="ObjectDataSource2" OnDataBound="DropDownList_DataBound"
                            EmptyMessage="- Tất cả -" DataTextField="UserName" DataValueField="UserName">
                        </asp:RadComboBox>
                        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="UserSelectAll"
                            TypeName="TLLib.User">
                            <SelectParameters>
                                <asp:Parameter Name="UserName" Type="String" />
                                <asp:Parameter Name="Email" Type="String" />
                                <asp:Parameter Name="Role" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="left invisible">
                        Từ ngày
                    </td>
                    <td class="invisible">
                        <asp:RadDatePicker ID="dpFromDate" runat="server" Calendar-CultureInfo="vi-VN" Culture="vi-VN"
                            ShowPopupOnFocus="True" Width="138px">
                            <Calendar ID="Calendar1" runat="server">
                                <SpecialDays>
                                    <asp:RadCalendarDay Repeatable="Today">
                                        <ItemStyle CssClass="rcToday" />
                                    </asp:RadCalendarDay>
                                </SpecialDays>
                            </Calendar>
                        </asp:RadDatePicker>
                    </td>
                    <td class="left invisible">
                        Đến ngày
                    </td>
                    <td class="invisible">
                        <asp:RadDatePicker ID="dpToDate" runat="server" Calendar-CultureInfo="vi-VN" Culture="vi-VN"
                            ShowPopupOnFocus="True" Width="138px">
                            <Calendar ID="Calendar2" runat="server">
                                <SpecialDays>
                                    <asp:RadCalendarDay Repeatable="Today">
                                        <ItemStyle CssClass="rcToday" />
                                    </asp:RadCalendarDay>
                                </SpecialDays>
                            </Calendar>
                        </asp:RadDatePicker>
                    </td>
                    <td class="left">
                        Đã duyệt
                    </td>
                    <td>
                        <asp:RadComboBox ID="ddlSearchIsApproved" runat="server" EmptyMessage="- Tất cả -"
                            Filter="Contains" Width="134px">
                            <Items>
                                <asp:RadComboBoxItem Value="" />
                                <asp:RadComboBoxItem Text="Đã duyệt" Value="True" />
                                <asp:RadComboBoxItem Text="Chưa duyệt" Value="False" />
                            </Items>
                        </asp:RadComboBox>
                    </td>
                    <td class="left invisible">
                        Hiển thị
                    </td>
                    <td class="invisible">
                        <asp:RadComboBox ID="ddlSearchIsAvailable" runat="server" EmptyMessage="- Tất cả -"
                            Filter="Contains" Width="134px">
                            <Items>
                                <asp:RadComboBoxItem Value="" />
                                <asp:RadComboBoxItem Text="Có" Value="True" />
                                <asp:RadComboBoxItem Text="Không" Value="False" />
                            </Items>
                        </asp:RadComboBox>
                    </td>
                </tr>
            </table>
            <div align="right" style="padding: 5px 0 5px 0; border-bottom: 1px solid #ccc; margin-bottom: 10px">
                <asp:RadButton ID="btnSearch" runat="server" Text="Tìm kiếm">
                    <Icon PrimaryIconUrl="~/ad/assets/images/find.png" />
                </asp:RadButton>
            </div>
        </asp:Panel>
        <asp:Label ID="lblError" ForeColor="Red" runat="server"></asp:Label>
        <asp:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" Culture="vi-VN" AllowMultiRowSelection="True"
            AllowSorting="True" DataSourceID="ObjectDataSource1" GridLines="Horizontal" AutoGenerateColumns="False"
            AllowAutomaticDeletes="True" ShowStatusBar="True" OnItemCommand="RadGrid1_ItemCommand"
            OnItemDataBound="RadGrid1_ItemDataBound" CssClass="grid" AllowAutomaticUpdates="True"
            CellSpacing="0">
            <ClientSettings EnableRowHoverStyle="true">
                <Selecting AllowRowSelect="True" UseClientSelectColumnOnly="True" />
                <ClientEvents OnRowDblClick="RowDblClick" />
                <Resizing AllowColumnResize="true" ClipCellContentOnResize="False" />
            </ClientSettings>
            <ExportSettings IgnorePaging="true" OpenInNewWindow="true" ExportOnlyData="true"
                Excel-Format="ExcelML" Pdf-AllowCopy="true">
            </ExportSettings>
            <MasterTableView CommandItemDisplay="TopAndBottom" DataSourceID="ObjectDataSource1"
                InsertItemPageIndexAction="ShowItemOnCurrentPage" AllowMultiColumnSorting="True"
                DataKeyNames="CommentID">
                <PagerStyle AlwaysVisible="true" Mode="NextPrevNumericAndAdvanced" PageButtonCount="10"
                    FirstPageToolTip="Trang đầu" LastPageToolTip="Trang cuối" NextPagesToolTip="Trang kế"
                    NextPageToolTip="Trang kế" PagerTextFormat="Đổi trang: {4} &nbsp;Trang <strong>{0}</strong> / <strong>{1}</strong>, Kết quả <strong>{2}</strong> - <strong>{3}</strong> trong <strong>{5}</strong>."
                    PageSizeLabelText="Kết quả mỗi trang:" PrevPagesToolTip="Trang trước" PrevPageToolTip="Trang trước" />
                <CommandItemTemplate>
                    <div class="command">
                        <div style="float: right">
                            <asp:Button ID="ExportToExcelButton" runat="server" CssClass="rgExpXLS" CommandName="ExportToExcel"
                                AlternateText="Excel" ToolTip="Xuất ra Excel" />
                            <asp:Button ID="ExportToPdfButton" runat="server" CssClass="rgExpPDF" CommandName="ExportToPdf"
                                AlternateText="PDF" ToolTip="Xuất ra PDF" />
                            <asp:Button ID="ExportToWordButton" runat="server" CssClass="rgExpDOC" CommandName="ExportToWord"
                                AlternateText="Word" ToolTip="Xuất ra Word" />
                        </div>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="InitInsert" Visible='<%# !RadGrid1.MasterTableView.IsItemInserted %>'
                            CssClass="item"><img class="vam" alt="" src="../assets/images/add.png" /> Thêm mới</asp:LinkButton>|
                        <%--<asp:LinkButton ID="LinkButton3" runat="server" CommandName="PerformInsert" Visible='<%# RadGrid1.MasterTableView.IsItemInserted %>'><img class="vam" alt="" src="../assets/images/accept.png" /> Thêm</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="btnCancel" runat="server" CommandName="CancelAll" Visible='<%# RadGrid1.EditIndexes.Count > 0 || RadGrid1.MasterTableView.IsItemInserted %>'><img class="vam" alt="" src="../assets/images/delete-icon.png" /> Hủy</asp:LinkButton>&nbsp;&nbsp;--%>
                        <asp:LinkButton ID="btnEditSelected" runat="server" CommandName="EditSelected" Visible='<%# RadGrid1.EditIndexes.Count == 0 %>'
                            CssClass="item"><img width="12px" class="vam" alt="" src="../assets/images/tools.png" /> Sửa</asp:LinkButton>|
                        <%--<asp:LinkButton ID="btnUpdateEdited" runat="server" CommandName="UpdateEdited" Visible='<%# RadGrid1.EditIndexes.Count > 0 %>'><img class="vam" alt="" src="../assets/images/accept.png" /> Cập nhật</asp:LinkButton>&nbsp;&nbsp;--%>
                        <asp:LinkButton ID="LinkButton1" OnClientClick="javascript:return confirm('Xóa tất cả dòng đã chọn?')"
                            runat="server" CommandName="DeleteSelected" CssClass="item"><img class="vam" alt="" title="Xóa tất cả dòng được chọn" src="../assets/images/delete-icon.png" /> Xóa</asp:LinkButton>|
                        <asp:LinkButton ID="LinkButton6" runat="server" CommandName="QuickUpdate" Visible='<%# RadGrid1.EditIndexes.Count == 0 %>'
                            CssClass="item"><img class="vam" alt="" src="../assets/images/accept.png" /> Sửa nhanh</asp:LinkButton>|
                        <asp:LinkButton ID="LinkButton4" runat="server" CommandName="RebindGrid" CssClass="item"><img class="vam" alt="" src="../assets/images/reload.png" /> Làm mới</asp:LinkButton>
                    </div>
                    <div class="clear">
                    </div>
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </CommandItemTemplate>
                <Columns>
                    <asp:GridClientSelectColumn FooterText="CheckBoxSelect footer" HeaderStyle-Width="1%"
                        UniqueName="CheckboxSelectColumn" />
                    <asp:GridTemplateColumn HeaderStyle-Width="1%" HeaderText="STT">
                        <ItemTemplate>
                            <%# Container.DataSetIndex + 1 %>
                            <%--<asp:HiddenField ID="hdnImageName" runat="server" Value='<%# Eval("ImageName") %>' />--%>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridBoundColumn DataField="CommentID" SortExpression="CommentID" HeaderText="ID"
                        Visible="false">
                    </asp:GridBoundColumn>
                    <asp:GridTemplateColumn HeaderText="Tiêu Đề" DataField="Title" SortExpression="Title"
                        ItemStyle-VerticalAlign="Top" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Tiêu Đề (Tiếng Anh)" DataField="TitleEn" SortExpression="TitleEn"
                        ItemStyle-VerticalAlign="Top" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblTitleEn" runat="server" Text='<%# Eval("TitleEn") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Họ và Tên" DataField="UserName,Content" SortExpression="UserName"
                        ItemStyle-VerticalAlign="Top">
                        <ItemTemplate>
                            <%--<a href='<%# Eval("Link")%>' target="_blank">--%><b>
                                <%--<asp:Label ID="lblTitle" runat="server" Text='<%# !string.IsNullOrEmpty(Eval("Title").ToString()) ? Eval("Title") : Eval("Link")%>'></asp:Label>--%>
                                <asp:Label ID="lblUserName" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                            </b>
                            <%--</a>--%>
                            <br />
                            <asp:Label ID="lblContent" runat="server" Text='<%# TLLib.Common.SplitSummary(Eval("Content").ToString().Replace(Environment.NewLine, "<br />"),200) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Phone" DataField="Phone" SortExpression="Phone"
                        ItemStyle-VerticalAlign="Top" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Email" DataField="Email" SortExpression="Email"
                        ItemStyle-VerticalAlign="Top">
                        <ItemTemplate>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Date" DataField="CreateDate" SortExpression="CreateDate"
                        ItemStyle-VerticalAlign="Top">
                        <ItemTemplate>
                            <%# TLLib.Common.ChangeDate(Eval("CreateDate"))%>
                            <%--bởi:
                        <br />
                        <a href='<%# Request.Url.AbsolutePath + "?usn=" + Eval("UserName")%>'>
                            <%# Eval("UserName")%></a>
                        <br />
                        <%# Membership.GetUser( Eval("UserName").ToString()).Email %>--%>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn DataField="Priority" HeaderStyle-Width="1%" HeaderText="Thứ tự"
                        SortExpression="Priority">
                        <ItemTemplate>
                            <asp:RadNumericTextBox ID="txtPriority" runat="server" Width="70px" Text='<%# Bind("Priority") %>'
                                ShowSpinButtons="true" MinValue="0" EmptyMessage="Thứ tự..." Type="Number">
                                <NumberFormat AllowRounding="false" DecimalDigits="0" GroupSeparator="." />
                            </asp:RadNumericTextBox>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Duyệt" DataField="IsApproved" SortExpression="IsApproved">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkIsApproved" runat="server" Checked='<%# Eval("IsApproved") == DBNull.Value ? false : Convert.ToBoolean(Eval("IsApproved"))%>'
                                CssClass="checkbox" />
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Hiển thị" DataField="IsAvailable" SortExpression="IsAvailable">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkIsAvailable" runat="server" Checked='<%# Eval("IsAvailable") == DBNull.Value ? false : Convert.ToBoolean(Eval("IsAvailable"))%>'
                                CssClass="checkbox" />
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <%--<asp:GridTemplateColumn DataField="ImageName" HeaderText="Ảnh" SortExpression="ImageName">
                        <ItemTemplate>
                            <asp:Panel ID="Panel1" runat="server" Visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'>
                                <img alt="" src='<%# "~/res/comment/thumbs/" + Eval("ImageName") %>' width="80" runat="server"
                                    visible='<%# string.IsNullOrEmpty(Eval("ImageName").ToString()) ? false : true %>' />
                                <asp:LinkButton ID="lnkDeleteImage" runat="server" rel='<%#  Eval("CommentID") + "#" + Eval("ImageName") %>'
                                    CommandName="DeleteImage" OnClientClick="return confirm('Xóa ảnh này ?')">
                                <img alt="Xóa ảnh" title="Xóa ảnh" src="../assets/images/delete-icon.png" />
                                </asp:LinkButton>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>--%>
                </Columns>
                <EditFormSettings EditFormType="Template">
                    <FormTemplate>
                        <asp:Panel ID="Panel1" runat="server" DefaultButton="lnkUpdate">
                            <h3 class="searchTitle">
                                Thông Tin Tư Vấn Chuyên Gia</h3>
                            <asp:HiddenField ID="hdnCommentID" runat="server" Value='<%# Eval("CommentID") %>' />
                            <%--<asp:HiddenField ID="hdnOldImageName" runat="server" Value='<%# Eval("ImageName") %>' />--%>
                            <div class="edit">
                                <asp:RadButton ID="lnkUpdateTop" runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'
                                    Text='<%# (Container is GridEditFormInsertItem) ? "Thêm" : "Cập nhật" %>'>
                                    <Icon PrimaryIconUrl="~/ad/assets/images/ok.png" />
                                </asp:RadButton>
                                &nbsp;&nbsp;
                                <asp:RadButton ID="btnCancel" runat="server" CommandName='Cancel' Text='Hủy'>
                                    <Icon PrimaryIconUrl="~/ad/assets/images/cancel.png" />
                                </asp:RadButton>
                                <hr />
                            </div>
                            <table class="search">
                                <tr class="invisible">
                                    <td class="left" valign="top">
                                        Ảnh đại diện
                                    </td>
                                    <td runat="server">
                                        <asp:RadUpload ID="FileImageName" runat="server" ControlObjectsVisibility="None"
                                            Culture="vi-VN" Language="vi-VN" InputSize="69" AllowedFileExtensions=".jpg,.jpeg,.gif,.png" />
                                        <p style="color: #4e98df; font-size: 11px; font-weight: bold;">
                                            Size 270 x 198</p>
                                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Sai định dạng ảnh (*.jpg, *.jpeg, *.gif, *.png)"
                                            ClientValidationFunction="validateRadUpload" Display="Dynamic"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left">
                                        Thứ tự
                                    </td>
                                    <td>
                                        <asp:RadNumericTextBox ID="txtPriority" runat="server" Width="500px" Text='<%# Bind("Priority") %>'
                                            EmptyMessage="Thứ tự..." Type="Number">
                                            <NumberFormat AllowRounding="false" DecimalDigits="0" GroupSeparator="." />
                                        </asp:RadNumericTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">
                                        Họ và tên
                                    </td>
                                    <td>
                                        <%--<a href='<%# Eval("Link").ToString().StartsWith("http://") ? Eval("Link") : "http://" + Eval("Link")%>'>
                                            <b>
                                                <asp:Label ID="lblTitle" runat="server" Text='<%# !string.IsNullOrEmpty(Eval("Title").ToString()) ? Eval("Title") : Eval("Link")%>'></asp:Label>
                                            </b></a>--%>
                                        <asp:TextBox ID="txtUserName" runat="server" Text='<%# Bind("UserName") %>' Width="500px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr class="invisible">
                                    <td class="left" valign="top">
                                        Số điện thoại
                                    </td>
                                    <td>
                                        <b>
                                            <%--<asp:Label ID="lblPhone" runat="server" Text='<%# Bind("Phone")%>'></asp:Label>--%>
                                            <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>' Width="500px"></asp:TextBox>
                                        </b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">
                                        Email
                                    </td>
                                    <td>
                                        <b>
                                            <%--<asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email")%>'></asp:Label>--%>
                                            <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email")%>' Width="500px"></asp:TextBox>
                                            <asp:RegularExpressionValidator ValidationGroup="AddNewUser" ID="RegularExpressionValidator1"
                                                runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Sai định dạng email."
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        </b>
                                    </td>
                                </tr>
                                <tr class="invisible">
                                    <td colspan="2">
                                        <h3>
                                            (Ngôn Ngữ Tiếng Việt)</h3>
                                        <hr />
                                    </td>
                                </tr>
                                <tr class="invisible">
                                    <td class="left" valign="top">
                                        Tiêu đề
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTitle" runat="server" Text='<%# Bind("Title") %>' Width="500px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr class="invisible">
                                    <td colspan="2">
                                        <a href='<%# Request.Url.AbsolutePath + "?usn=" + Eval("UserName")%>'>
                                            <%# Eval("UserName")%></a>
                                        <%--<%# TLLib.Common.ChangeDate(Eval("CreateDate"))%>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">
                                        Câu hỏi
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Width="500" Height="200"
                                            Text='<%# Bind("Content")%>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">
                                        Trả lời
                                    </td>
                                    <td>
                                        <asp:RadEditor ID="txtAnswer" ContentFilters="ConvertCharactersToEntities,ConvertToXhtml,OptimizeSpans,IndentHTMLContent,ConvertFontToSpan,IECleanAnchors,FixUlBoldItalic,RemoveScripts,FixEnclosingP"
                                            runat="server" Language="vi-VN" Skin="Office2007" Width="98%" Content='<%# Bind("Answer") %>'>
                                            <ImageManager DeletePaths="~/Uploads/Image/" UploadPaths="~/Uploads/Image/" ViewPaths="~/Uploads/Image/"
                                                MaxUploadFileSize="1024000" />
                                            <FlashManager DeletePaths="~/Uploads/Video/" UploadPaths="~/Uploads/Video/" ViewPaths="~/Uploads/Video/" />
                                            <DocumentManager DeletePaths="~/Uploads/File/" UploadPaths="~/Uploads/File/" ViewPaths="~/Uploads/File/"
                                                MaxUploadFileSize="1024000" />
                                            <MediaManager DeletePaths="~/Uploads/Media/" UploadPaths="~/Uploads/Media/" ViewPaths="~/Uploads/Media/" />
                                            <TemplateManager DeletePaths="~/Uploads/Template/" UploadPaths="~/Uploads/Template/"
                                                ViewPaths="~/Uploads/Template/" />
                                        </asp:RadEditor>
                                    </td>
                                </tr>
                                <tr class="invisible">
                                    <td colspan="2">
                                        <h3>
                                            (Ngôn Ngữ Tiếng Anh)</h3>
                                        <hr />
                                    </td>
                                </tr>
                                <tr class="invisible">
                                    <td class="left" valign="top">
                                        Tiêu đề
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTitleEn" runat="server" Text='<%# Bind("TitleEn") %>' Width="500px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr class="invisible">
                                    <td class="left" valign="top">
                                        Câu hỏi
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtContentEn" runat="server" TextMode="MultiLine" Width="500" Height="200"
                                            Text='<%# Bind("ContentEn")%>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr class="invisible">
                                    <td class="left" valign="top">
                                        Trả lời
                                    </td>
                                    <td>
                                        <asp:RadEditor ID="txtAnswerEn" ContentFilters="ConvertCharactersToEntities,ConvertToXhtml,OptimizeSpans,IndentHTMLContent,ConvertFontToSpan,IECleanAnchors,FixUlBoldItalic,RemoveScripts,FixEnclosingP"
                                            runat="server" Language="vi-VN" Skin="Office2007" Width="98%" Content='<%# Bind("AnswerEn") %>'>
                                            <ImageManager DeletePaths="~/Uploads/Image/" UploadPaths="~/Uploads/Image/" ViewPaths="~/Uploads/Image/"
                                                MaxUploadFileSize="1024000" />
                                            <FlashManager DeletePaths="~/Uploads/Video/" UploadPaths="~/Uploads/Video/" ViewPaths="~/Uploads/Video/" />
                                            <DocumentManager DeletePaths="~/Uploads/File/" UploadPaths="~/Uploads/File/" ViewPaths="~/Uploads/File/"
                                                MaxUploadFileSize="1024000" />
                                            <MediaManager DeletePaths="~/Uploads/Media/" UploadPaths="~/Uploads/Media/" ViewPaths="~/Uploads/Media/" />
                                            <TemplateManager DeletePaths="~/Uploads/Template/" UploadPaths="~/Uploads/Template/"
                                                ViewPaths="~/Uploads/Template/" />
                                        </asp:RadEditor>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" colspan="2">
                                        <asp:CheckBox ID="chkIsApproved" runat="server" CssClass="checkbox" Text=" Duyệt"
                                            Checked='<%# (Container is GridEditFormInsertItem) ? true : (string.IsNullOrEmpty(Eval("IsApproved").ToString()) ? false : Eval("IsApproved")) %>' />
                                        &nbsp;&nbsp;
                                        <asp:CheckBox ID="chkIsAvailable" runat="server" CssClass="checkbox" Text=" Hiển thị"
                                            Checked='<%# (Container is GridEditFormInsertItem) ? true : (string.IsNullOrEmpty(Eval("IsAvailable").ToString()) ? false : Eval("IsAvailable")) %>' />
                                    </td>
                                </tr>
                            </table>
                            <div class="edit">
                                <hr />
                                <asp:RadButton ID="lnkUpdate" runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'
                                    Text='<%# (Container is GridEditFormInsertItem) ? "Thêm" : "Cập nhật" %>'>
                                    <Icon PrimaryIconUrl="~/ad/assets/images/ok.png" />
                                </asp:RadButton>
                                &nbsp;&nbsp;
                                <asp:RadButton ID="RadButton1" runat="server" CommandName='Cancel' Text='Hủy'>
                                    <Icon PrimaryIconUrl="~/ad/assets/images/cancel.png" />
                                </asp:RadButton>
                            </div>
                        </asp:Panel>
                        <asp:RadInputManager ID="RadInputManager2" runat="server">
                            <asp:NumericTextBoxSetting AllowRounding="False" Culture="vi-VN" EmptyMessage="Thứ tự ..."
                                Type="Number" DecimalDigits="0">
                                <TargetControls>
                                    <asp:TargetInput ControlID="txtPriority" />
                                </TargetControls>
                            </asp:NumericTextBoxSetting>
                        </asp:RadInputManager>
                    </FormTemplate>
                </EditFormSettings>
            </MasterTableView>
            <HeaderStyle Font-Bold="True" />
            <HeaderContextMenu EnableImageSprites="True" CssClass="GridContextMenu GridContextMenu_Default">
            </HeaderContextMenu>
        </asp:RadGrid>
    </asp:RadAjaxPanel>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="CommentSelectAll"
        TypeName="TLLib.Comment" DeleteMethod="CommentDelete" UpdateMethod="CommentUpdate">
        <DeleteParameters>
            <asp:Parameter Name="CommentID" Type="String" />
        </DeleteParameters>
        <SelectParameters>
            <asp:Parameter Name="CommentID" Type="String" />
            <asp:ControlParameter ControlID="ddlSearchUser" Name="UserName" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="txtSearchKeyword" Name="Keyword" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtSearchLink" Name="Link" PropertyName="Text" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Content" Type="String" />
            <asp:Parameter Name="CreateDate" Type="String" />
            <asp:Parameter Name="UpdateDate" Type="String" />
            <asp:ControlParameter ControlID="dpFromDate" Name="FromDate" PropertyName="SelectedDate"
                Type="String" />
            <asp:ControlParameter ControlID="dpToDate" Name="ToDate" PropertyName="SelectedDate"
                Type="String" />
            <asp:Parameter Name="Priority" Type="String" />
            <asp:ControlParameter ControlID="ddlSearchIsApproved" Name="IsApproved" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="ddlSearchIsAvailable" Name="IsAvailable" PropertyName="SelectedValue"
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CommentID" Type="String" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Link" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="TitleEn" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Content" Type="String" />
            <asp:Parameter Name="ContentEn" Type="String" />
            <asp:Parameter Name="Answer" Type="String" />
            <asp:Parameter Name="AnswerEn" Type="String" />
            <asp:Parameter Name="Priority" Type="String" />
            <asp:Parameter Name="IsApproved" Type="String" />
            <asp:Parameter Name="IsAvailable" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:RadProgressManager ID="RadProgressManager1" runat="server" />
    <asp:RadProgressArea ID="ProgressArea1" runat="server" Culture="vi-VN" DisplayCancelButton="True"
        HeaderText="Đang tải" Skin="Office2007" Style="position: fixed; top: 50% !important;
        left: 50% !important; margin: -93px 0 0 -188px;" />
</asp:Content>
