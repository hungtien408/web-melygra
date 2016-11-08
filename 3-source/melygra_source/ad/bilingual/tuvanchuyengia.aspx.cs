using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using TLLib;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Data;

public partial class ad_single_article : System.Web.UI.Page
{

    #region Common Method

    protected void DropDownList_DataBound(object sender, EventArgs e)
    {
        var cbo = (RadComboBox)sender;
        cbo.Items.Insert(0, new RadComboBoxItem(""));
    }

    void DeleteImage(string strImageName)
    {
        if (!string.IsNullOrEmpty(strImageName))
        {
            var strImagePath = Server.MapPath("~/res/article/" + strImageName);
            var strThumbImagePath = Server.MapPath("~/res/article/thumbs/" + strImageName);

            if (File.Exists(strImagePath))
                File.Delete(strImagePath);
            if (File.Exists(strThumbImagePath))
                File.Delete(strThumbImagePath);
        }
    }

    #endregion

    #region Event

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            RadGrid1.MasterTableView.SortExpressions.Clear();
            GridSortExpression sortExpr1 = new GridSortExpression();
            sortExpr1.FieldName = "CreateDate";
            sortExpr1.SortOrder = GridSortOrder.Descending;
            RadGrid1.MasterTableView.SortExpressions.AddSortExpression(sortExpr1);

            string strUserName = Request.QueryString["usn"];
            if (!string.IsNullOrEmpty(strUserName))
                ddlSearchUser.SelectedValue = strUserName;
        }
    }
    public void RadGrid1_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        if (e.Item is GridCommandItem)
        {
            GridCommandItem commandItem = (e.Item as GridCommandItem);
            PlaceHolder container = (PlaceHolder)commandItem.FindControl("PlaceHolder1");
            Label label = new Label();
            label.Text = "&nbsp;&nbsp;";

            container.Controls.Add(label);

            for (int i = 65; i <= 65 + 25; i++)
            {
                LinkButton linkButton1 = new LinkButton();

                LiteralControl lc = new LiteralControl("&nbsp;&nbsp;");

                linkButton1.Text = "" + (char)i;

                linkButton1.CommandName = "alpha";
                linkButton1.CommandArgument = "" + (char)i;

                container.Controls.Add(linkButton1);
                container.Controls.Add(lc);
            }

            LiteralControl lcLast = new LiteralControl("&nbsp;");
            container.Controls.Add(lcLast);

            LinkButton linkButtonAll = new LinkButton();
            linkButtonAll.Text = "Tất cả";
            linkButtonAll.CommandName = "NoFilter";
            container.Controls.Add(linkButtonAll);
        }
    }
    protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
    {
        if (e.CommandName == "alpha" || e.CommandName == "NoFilter")
        {
            String value = null;
            switch (e.CommandName)
            {
                case ("alpha"):
                    {
                        value = string.Format("{0}%", e.CommandArgument);
                        break;
                    }
                case ("NoFilter"):
                    {
                        value = "%";
                        break;
                    }
            }
            ObjectDataSource1.SelectParameters["Title"].DefaultValue = value;
            ObjectDataSource1.DataBind();
            RadGrid1.Rebind();
        }
        else if (e.CommandName == "QuickUpdate")
        {
            string CommentID, Priority, IsAvailable, IsApproved;
            var oComment = new Comment();

            foreach (GridDataItem item in RadGrid1.Items)
            {
                CommentID = item.GetDataKeyValue("CommentID").ToString();
                Priority = ((RadNumericTextBox)item.FindControl("txtPriority")).Text.Trim();
                IsApproved = ((CheckBox)item.FindControl("chkIsApproved")).Checked.ToString();
                IsAvailable = ((CheckBox)item.FindControl("chkIsAvailable")).Checked.ToString();

                oComment.CommentQuickUpdate(
                    CommentID,
                    IsApproved,
                    IsAvailable,
                    Priority
                );
            }
        }
        //else if (e.CommandName == "DeleteSelected")
        //{
        //    string OldImageName;
        //    var oComment = new Comment();

        //    foreach (GridDataItem item in RadGrid1.SelectedItems)
        //    {
        //        OldImageName = ((HiddenField)item.FindControl("hdnImageName")).Value;
        //        DeleteImage(OldImageName);
        //    }
        //}
        else if (e.CommandName == "PerformInsert" || e.CommandName == "Update")
        {
            var command = e.CommandName;
            var row = command == "PerformInsert" ? (GridEditFormInsertItem)e.Item : (GridEditFormItem)e.Item;
            var FileImageName = (RadUpload)row.FindControl("FileImageName");
            var oComment = new Comment();

            string strCommentID = ((HiddenField)row.FindControl("hdnCommentID")).Value;
            //string strOldImageName = ((HiddenField)row.FindControl("hdnOldImageName")).Value;
            //string strImageName = FileImageName.UploadedFiles.Count > 0 ? FileImageName.UploadedFiles[0].GetName() : "";
            string strPriority = "";// ((RadNumericTextBox)row.FindControl("txtPriority")).Text.Trim();
            //string strTitle = ((Label)row.FindControl("lblTitle")).Text.Trim();
            string strTitle = ((TextBox)row.FindControl("txtTitle")).Text.Trim();
            string strTitleEn = ((TextBox)row.FindControl("txtTitleEn")).Text.Trim();
            string strUserName = ((TextBox)row.FindControl("txtUserName")).Text.Trim();
            string strPhone = ((TextBox)row.FindControl("txtPhone")).Text.Trim();
            string strEmail = ((TextBox)row.FindControl("txtEmail")).Text.Trim();
            string strConvertedCommentTitle = Common.ConvertTitle(strTitle);
            string strContent = ((TextBox)row.FindControl("txtContent")).Text.Trim();
            string strContentEn = ((TextBox)row.FindControl("txtContentEn")).Text.Trim();
            string strAnswer = HttpUtility.HtmlDecode(FCKEditorFix.Fix(((RadEditor)row.FindControl("txtAnswer")).Content.Trim()));
            string strAnswerEn = HttpUtility.HtmlDecode(FCKEditorFix.Fix(((RadEditor)row.FindControl("txtAnswerEn")).Content.Trim()));
            string strIsAvailable = ((CheckBox)row.FindControl("chkIsAvailable")).Checked.ToString();
            string strIsApproved = ((CheckBox)row.FindControl("chkIsApproved")).Checked.ToString();


            if (e.CommandName == "PerformInsert")
            {
                oComment.CommentInsert(
                strUserName,
                    "",
                strTitle,
                strTitleEn,
                strPhone,
                strEmail,
                strContent,
                strContentEn,
                strAnswer,
                strAnswerEn,
                strPriority,
                strIsApproved,
                strIsAvailable
                    );

                //string strFullPath = "~/res/comment/" + strImageName;
                //if (!string.IsNullOrEmpty(strImageName))
                //{
                //    FileImageName.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                //    ResizeCropImage.ResizeByCondition(strFullPath, 450, 306);
                //    string bgColor = "#ffffff";
                //    ResizeCropImage.CreateThumbNailWithBackGroundColor("~/res/comment/", "~/res/comment/thumbs/", strImageName, 156, 156, bgColor);
                //}
                RadGrid1.Rebind();
            }
            else
            {
                var dsUpdateParam = ObjectDataSource1.UpdateParameters;
                //var strOldImagePath = Server.MapPath("~/res/comment/" + strOldImageName);
                //var strOldThumbImagePath = Server.MapPath("~/res/comment/thumbs/" + strOldImageName);

                dsUpdateParam["UserName"].DefaultValue = strUserName;
                dsUpdateParam["Title"].DefaultValue = strTitle;
                dsUpdateParam["TitleEn"].DefaultValue = strTitleEn;
                dsUpdateParam["Content"].DefaultValue = strContent;
                dsUpdateParam["ContentEn"].DefaultValue = strContentEn;
                dsUpdateParam["Answer"].DefaultValue = strAnswer;
                dsUpdateParam["AnswerEn"].DefaultValue = strAnswerEn;
                //dsUpdateParam["ConvertedCommentTitle"].DefaultValue = strConvertedCommentTitle;
                //dsUpdateParam["ImageName"].DefaultValue = strImageName;
                dsUpdateParam["IsApproved"].DefaultValue = strIsApproved;
                dsUpdateParam["IsAvailable"].DefaultValue = strIsAvailable;

                //if (!string.IsNullOrEmpty(strImageName))
                //{
                //    if (File.Exists(strOldImagePath))
                //        File.Delete(strOldImagePath);
                //    if (File.Exists(strOldThumbImagePath))
                //        File.Delete(strOldThumbImagePath);

                //    strImageName = (string.IsNullOrEmpty(strConvertedCommentTitle) ? "" : strConvertedCommentTitle + "-") + strCommentID + strImageName.Substring(strImageName.LastIndexOf('.'));

                //    string strFullPath = "~/res/comment/" + strImageName;

                //    FileImageName.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                //    ResizeCropImage.ResizeByCondition(strFullPath, 450, 306);
                //    string bgColor = "#ffffff";
                //    ResizeCropImage.CreateThumbNailWithBackGroundColor("~/res/comment/", "~/res/comment/thumbs/", strImageName, 156, 156, bgColor);
                //}
            }
        }
        //if (e.CommandName == "DeleteImage")
        //{
        //    var oComment = new Comment();
        //    var lnkDeleteImage = (LinkButton)e.CommandSource;
        //    var s = lnkDeleteImage.Attributes["rel"].ToString().Split('#');
        //    var strCommentID = s[0];
        //    var strImageName = s[1];

        //    oComment.CommentImageDelete(strCommentID);
        //    DeleteImage(strImageName);
        //    RadGrid1.Rebind();
        //}
    }
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridEditableItem && e.Item.IsInEditMode)
        {
            var itemtype = e.Item.ItemType;
            var row = itemtype == GridItemType.EditFormItem ? (GridEditFormItem)e.Item : (GridEditFormInsertItem)e.Item;
            var FileImageName = (RadUpload)row.FindControl("FileImageName");
            var dv = (DataView)ObjectDataSource1.Select();
            var CommentID = ((HiddenField)row.FindControl("hdnCommentID")).Value;

            if (!string.IsNullOrEmpty(CommentID))
            {
                dv.RowFilter = "CommentID = " + CommentID;
            }
            RadAjaxPanel1.ResponseScripts.Add(string.Format("window['UploadId'] = '{0}';", FileImageName.ClientID));
        }
    }

    #endregion

}