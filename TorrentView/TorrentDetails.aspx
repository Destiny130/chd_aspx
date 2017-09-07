<%@ Page Title="Torrent Details" Language="C#" MasterPageFile="~/MasterPages/Layout.master" AutoEventWireup="true" CodeFile="TorrentDetails.aspx.cs" Inherits="NavigationViews_TorrentDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent1" runat="Server">
    <asp:Table runat="server" ID="NoIdTable" Visible="true" CssClass="table90 textcenter">
        <asp:TableRow>
            <asp:TableCell CssClass="border"><h3>无效的行为</h3></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Table runat="server" ID="TorrentDetailsTable" Visible="false" CssClass="table90 textleft">
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2" CssClass="textcenter padding10">
                <asp:Label runat="server" ID="TitleLabel" Font-Size="17px" CssClass="textcenter" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright" Width="60px"><b>下载</b></asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:LinkButton runat="server" ID="DownloadLink" OnClick="DownLoadButton_Click" />&nbsp;&nbsp;
                由&nbsp;<asp:LinkButton runat="server" ID="UserLink" OnClick="UserLink_Click" />&nbsp;发布于<asp:Label runat="server" ID="CreateDateTimeLabel" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright"><b>副标题</b></asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:Label runat="server" ID="SubTitleLabel" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright"><b>基本信息</b></asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <b>类型:</b><asp:Label ID="TypeLabel" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright"><b>行为</b></asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:Button runat="server" ID="DownLoadButton" Text="下载种子" OnClick="DownLoadButton_Click" />
                <asp:Button runat="server" ID="DeleteButton" Text="删除种子" OnClick="DeleteButton_Click" Visible="false" />
                <asp:Button runat="server" ID="EditButton" Text="编辑种子" OnClick="EditButton_Click" Visible="false" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright" valign="top"><b>简介</b></asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:Label runat="server" ID="BodyLabel" ReadOnly="True" Height="300px" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <div class="table90 textcenter" id="CommentDiv">
        <h4>用户评论</h4>
    </div>
    <br />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:ListView ID="CommentList" runat="server" DataKeyNames="Id" SelectMethod="CommentList_GetData" ItemType="TorrentComment" InsertItemPosition="LastItem" InsertMethod="CommentList_InsertItem" DeleteMethod="CommentList_DeleteItem" OnItemDataBound="CommentList_ItemDataBound">
                <InsertItemTemplate>
                    <br />
                    <asp:Table runat="server" CssClass="table90">
                        <asp:TableRow>
                            <asp:TableCell CssClass="table90 textcenter">
                                <br />
                                <li class="table50 border padding10 textcenter">快速评论<br />
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# BindItem.Summary %>' TextMode="MultiLine" Width="450px" Height="145px"></asp:TextBox><br />
                                    <asp:Button ID="InsertButton" runat="server" Text="添加" CommandName="Insert" />
                                </li>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <br />
                </InsertItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# BindItem.Summary %>' TextMode="MultiLine" Width="650px" Height="145px"></asp:TextBox><br />
                </EditItemTemplate>
                <ItemTemplate>
                    <div class="border">
                        <li class="table100">
                            <table class="table98  padding5 textleft">
                                <tr>
                                    <td class="padding10" id='<%# Item.Id %>'>
                                        <asp:Label ID="Label3" runat="server" Text='<%# "#" + Item.Id %>' />
                                        <asp:HyperLink ID="AuthorLink" runat="server" >
                                            <asp:Label ID="Label4" runat="server" Text='<%# Item.AuthorName %>' />
                                        </asp:HyperLink>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Item.CreateDateTime %>' /></td>
                                </tr>
                            </table>
                            <table class="table98 textleft">
                                <tr>
                                    <td style="width: 151px;" class="borderdeepcolor" valign="top">
                                        <asp:Image runat="server" ID="AvatarImg" Width="150px"  /><br />
                                    </td>
                                    <td class="borderdeepcolor padding10" style="vertical-align: top;">
                                        <asp:Label ID="Label7" runat="server" Text='<%# BindItem.Summary %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="borderdeepcolor padding5"></td>
                                    <td class="borderdeepcolor padding5 textright">
                                        <asp:Button ID="DeleteCommentButton" runat="server" Text="删除" CommandName="Delete" CausesValidation="false" CommandArgument='<%# Item.Id %>' Visible="false" />
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

