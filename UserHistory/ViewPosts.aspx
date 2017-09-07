<%@ Page Title="CHDBits :: 帖子历史 - Powered by NexusPHP" Language="C#" MasterPageFile="~/MasterPages/Layout.master" AutoEventWireup="true" CodeFile="ViewPosts.aspx.cs" Inherits="UserHistory_ViewPosts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent1" runat="Server">
    <asp:Table CssClass="table90 textleft" runat="server" ID="ViewPostsTable" Visible="false">
        <asp:TableRow>
            <asp:TableCell CssClass="textcenter padding10" Font-Size="17px" Font-Bold="true">
                用户帖子历史 -
                <asp:LinkButton runat="server" ID="UserDetailsLink" OnClick="UserDetailsLink_Click" Font-Size="16px" Font-Bold="true"></asp:LinkButton>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border table100">
                <asp:ListView runat="server" ID="ViewPostsListView" ItemType="ForumReply" SelectMethod="ViewPostsListView_GetData">
                    <ItemTemplate>
                        <table class="table90" style="margin-left: 10px;">
                            <tr>
                                <td class="padding10">
                                    <%# Item.CreateDateTime %> -- <b>论坛:</b>
                                    <asp:LinkButton runat="server" Text="<%# Item.ViewForum.Forum.ForumName %>" PostBackUrl='<%# "~/Forums/ViewForum.aspx?Id=" + Item.ViewForum.ForumId %>' />
                                    --<b>主题:</b>
                                    <asp:LinkButton runat="server" Text="<%# Item.ViewForum.Title %>" PostBackUrl='<%# "~/Forums/ViewTopic.aspx?Id=" + Item.ViewForumId %>' />
                                    --<b>帖子:</b>#
                                    <asp:LinkButton runat="server" Text="<%# Item.Id %>" PostBackUrl='<%# "~/Forums/ViewTopic.aspx?Id=" + Item.ViewForumId + "#" + Item.Id %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="padding10 borderdeepcolor" >
                                    <%# Item.ReplyContent %>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul class="ItemContainer">
                            <li runat="server" id="itemPlaceHolder" />
                        </ul>
                    </LayoutTemplate>
                </asp:ListView>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Table runat="server" ID="NoPost" CssClass="table90 textleft" Visible="true">
        <asp:TableRow>
            <asp:TableCell CssClass="border">
                <h3>错误</h3>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding10">没有找到评论</asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>

