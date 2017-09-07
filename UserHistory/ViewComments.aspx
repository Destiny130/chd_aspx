<%@ Page Title="CHDBits :: 评论历史 - Powered by NexusPHP" Language="C#" MasterPageFile="~/MasterPages/Layout.master" AutoEventWireup="true" CodeFile="ViewComments.aspx.cs" Inherits="UserHistory_ViewComments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent1" runat="Server">
    <asp:Table CssClass="table90 textleft" runat="server" ID="ViewCommentsTable" Visible="false">
        <asp:TableRow>
            <asp:TableCell CssClass="textcenter padding10" Font-Size="17px" Font-Bold="true">
                用户评论历史 -
                <asp:LinkButton runat="server" ID="UserDetailsLink" OnClick="UserDetailsLink_Click" Font-Size="16px" Font-Bold="true"></asp:LinkButton>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border table100">
                <asp:ListView runat="server" ID="TorrentCommentListView" ItemType="TorrentComment" SelectMethod="TorrentCommentListView_GetData">
                    <ItemTemplate>
                        <table class="table90" style="margin-left: 10px;">
                            <tr>
                                <td class="padding10">
                                    <%# Item.CreateDateTime %> -- <b>种子:</b>
                                    <asp:LinkButton runat="server" Text="<%# Item.Torrent.Title %>" PostBackUrl='<%# "~/TorrentView/TorrentDetails.aspx?Id=" + Item.TorrentId %>' />
                                    --<b>评论:</b>#
                                    <asp:LinkButton runat="server" Text="<%# Item.Id %>" PostBackUrl='<%# "~/TorrentView/TorrentDetails.aspx?Id=" + Item.TorrentId + "#" + Item.Id %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="padding10 borderdeepcolor">
                                    <%# Item.Summary %>
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
    <asp:Table runat="server" ID="NoComment" CssClass="table90 textleft">
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

