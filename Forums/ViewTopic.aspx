<%@ Page Title="View Topic" Language="C#" MasterPageFile="~/MasterPages/Layout.master" AutoEventWireup="true" CodeFile="ViewTopic.aspx.cs" Inherits="Forums_ViewTopic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent1" runat="Server">
    <br />
    <div class="table90 textcenter" runat="server" id="Top">
        <a href="../NavigationViews/Forums.aspx">CHDBits论坛</a>-->
        <a href="<%= GetForumURL() %>">
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </a>-->
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <br />
    </div>
    <br />
    <asp:Table runat="server" CssClass="table90 textleft" ID="countAndNewTopic">
        <asp:TableRow>
            <asp:TableCell CssClass="padding5">此主题共被查看<asp:Label runat="server" ID="ViewCountLabel" Font-Bold="true"></asp:Label>次</asp:TableCell>
            <asp:TableCell CssClass="padding5 textright">
                <asp:Button runat="server" ID="NewReplyButton" Text="新回复" OnClick="NewReplyButton_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" SelectMethod="ListView1_GetData" ItemType="ForumReply" InsertItemPosition="LastItem" InsertMethod="ListView1_InsertItem" DeleteMethod="ListView1_DeleteItem" OnItemDataBound="ListView1_ItemDataBound">
        <InsertItemTemplate>
            <br />
            <asp:Table runat="server" CssClass="table100">
                <asp:TableRow>
                    <asp:TableCell CssClass="table100 textcenter">
                        <br />
                        <li class="table50 border padding10 textcenter">快速回复<br />
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# BindItem.ReplyContent %>' TextMode="MultiLine" Width="450px" Height="145px"></asp:TextBox><br />
                            <asp:Button ID="InsertButton" runat="server" Text="发表" CommandName="Insert" />
                        </li>
                        <br />
                        <div class="table90 textcenter padding10">
                            <a href='ForumReply.aspx?Id=<%# Request.QueryString["Id"] %>'><b>回复主题</b></a>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </InsertItemTemplate>
        <ItemTemplate>
            <div class="border">
                <li class="table100">
                    <table class="table98  padding5 textleft">
                        <tr>
                            <td class="padding10" id='<%# Item.Id %>'>
                                <asp:Label ID="Label3" runat="server" Text='<%# "#" + Item.Id %>'></asp:Label>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="<%# GetAuthorInfo(Item.UserName) %>">
                                    <asp:Label ID="Label4" runat="server" Text='<%# Item.UserName %>'></asp:Label>
                                </asp:HyperLink>
                                <asp:Label ID="Label5" runat="server" Text='<%# Item.CreateDateTime %>'></asp:Label>
                            </td>
                            <td class="textright padding10">
                                <asp:Label ID="Label6" runat="server" Text='<%# GetFloor(Item.Id) + "楼" %>'></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <table class="table98 textleft">
                        <tr>
                            <td style="width: 151px; height: 300px;" class="borderdeepcolor" valign="top">
                                <asp:Image runat="server" ID="AvatarImg" Width="150px" ImageUrl='<%# GetAvatarUrl(Item.UserName) %>' /><br />
                                <br />
                                <div class="padding10">
                                    等级：POWER USER<br />
                                    帖子：<asp:Label runat="server" ID="ForumPostLabel" Text='<%# GetForumPost(Item.UserName) %>' /><br />
                                    上传：<asp:Label runat="server" ID="UploadedLable" Text="<%# GetUserUploaded(Item.UserName) %>" /><br />
                                    下载：<asp:Label runat="server" ID="DownloadedLabel" Text='<%# GetUserDownloaded(Item.UserName) %>' /><br />
                                    分享率：<asp:Label runat="server" ID="RadioLabel" Text='<%# GetUserRadio(Item.UserName) %>' /><br />
                                    魔力：<asp:Label runat="server" ID="BounsLabel" Text='<%# GetUserBouns(Item.UserName) %>' />
                                </div>
                            </td>
                            <td class="borderdeepcolor padding10" style="vertical-align: top;">
                                <asp:Label ID="Label7" runat="server" Text='<%# Item.ReplyContent %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="borderdeepcolor padding5">off on repost</td>
                            <td class="borderdeepcolor padding5 textright">
                                <asp:Button ID="QuoteButton" runat="server" Text="引用" PostBackUrl='<%# "~/Forums/ForumQuote.aspx?Id=" + Item.Id  %>' />
                                <asp:Button ID="EditButton" runat="server" Text="编辑" PostBackUrl='<%# "~/Forums/ForumEdit.aspx?Id=" + Item.Id %>' Visible="false" CommandArgument='<%# Item.Id %>' />
                                <asp:Button ID="EditTopicButton" runat="server" Text="编辑主题" PostBackUrl='<%# "~/Forums/TopicEdit.aspx?Id=" + Item.Id %>' Visible="false" />
                                <asp:Button ID="DeleteButton" runat="server" Text="删除" CommandName="Delete" CausesValidation="false" Visible="false" />
                                <asp:Button ID="DeleteTopicButton" runat="server" Text="删除主题" OnClick="DeleteTopicButton_Click" CommandArgument='<%# Item.ViewForumId %>' Visible="false" />
                            </td>
                        </tr>
                    </table>
                    <br />
                </li>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <ul class="ItemContainer table90">
                <li runat="server" id="itemPlaceHolder" />
            </ul>
        </LayoutTemplate>
    </asp:ListView>
    <asp:Table runat="server" ID="noTopic" CssClass="table90 textleft" Visible="false">
        <asp:TableRow>
            <asp:TableCell CssClass="padding10 border">无效的行为！<br />请选择一个主题</asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />
    <br />
</asp:Content>

