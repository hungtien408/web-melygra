<%@ Control Language="C#" AutoEventWireup="true" CodeFile="video.ascx.cs" Inherits="uc_video" %>
<asp:ListView ID="lstVideo" runat="server" DataSourceID="odsVideo" EnableModelValidation="True">
    <ItemTemplate>
        <div class="video-details">
            <img src="../assets/images/video1.png" alt="" style="display: block; width: 100%;" />
            <%--<div id="jwplayer3">
            </div>
            <script type="text/javascript">
                        $(document).ready(function () {
                            jwplayer('jwplayer3').setup({
                                image: '<%# string.IsNullOrEmpty(Eval("ImagePath").ToString()) ? "" : "res/video/thumbs/" + Eval("ImagePath") %>',
                                file: '<%# string.IsNullOrEmpty(Eval("VideoPath").ToString()) ? Eval("GLobalEmbedScript") : "res/video/" + Eval("VideoPath") %>',
                                flashplayer: "assets/js/jwplayer.flash.swf",
                                width: '100%',
                                aspectratio: '16:9',
                                primary: "html5",
                                width: '100%',
                            });
                        });
            </script>--%>
        </div>
    </ItemTemplate>
    <LayoutTemplate>
        <span runat="server" id="itemPlaceholder" />
    </LayoutTemplate>
</asp:ListView>
<asp:ObjectDataSource ID="odsVideo" runat="server" SelectMethod="VideoSelectAll"
    TypeName="TLLib.Video">
    <SelectParameters>
        <asp:Parameter Name="Title" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="VideoCategoryID" Type="String" />
        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
        <asp:Parameter Name="Priority" Type="String" />
        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
