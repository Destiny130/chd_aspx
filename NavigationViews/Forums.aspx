<%@ Page Title="CHDBits :: 论坛 - Powered by NexusPHP" Language="C#" MasterPageFile="~/MasterPages/Layout.master" AutoEventWireup="true" CodeFile="Forums.aspx.cs" Inherits="Views_Fourms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent1" runat="Server">
    <div style="width: 100%; text-align: center;">
        <table class="forumsTop" style="margin: auto; width: 95%;">
            <tr>
                <td style="padding: 5px; font-size: 16px; font-weight: bold;">CHDBits论坛</td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td style="padding: 2px; font-size: 13px; font-weight: bold;">搜索 | 查看未读 | 全部设置已读</td>
            </tr>
        </table>
    </div>
    <br />
    <div class="table90 textright">
        <asp:Button runat="server" ID="NewForumButton" PostBackUrl="~/Management/NewForum.aspx" Visible="false" Text="新版块" />&nbsp;
        <asp:Button runat="server" ID="EditForumButton" PostBackUrl="~/Management/EditForum.aspx" Visible=" false" Text="编辑论坛" />
    </div>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" CssClass="table90 padding5 textcenter border" ItemType="Forum" SelectMethod="GridView1_GetData" OnRowDataBound="GridView1_RowDataBound">
        <Columns>
            <asp:TemplateField HeaderText="板块" ItemStyle-CssClass="textleft padding10 forumlogo1" HeaderStyle-CssClass="forumheader fc1">
                <ItemTemplate>
                    <asp:HyperLink runat="server" Text='<%# Item.ForumName %>' NavigateUrl='<%# "~/Forums/ViewForum.aspx?Id=" + Item.Id %>' ID="ForumLink"></asp:HyperLink><br />
                    <asp:Label ID="DesLabel" runat="server" Text='<%# Item.ForumDescription %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="50%"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="主题" HeaderStyle-CssClass="forumheader fc2">
                <ItemTemplate>
                    <asp:Label ID="TopicCount" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="帖子" HeaderStyle-CssClass="forumheader fc3">
                <ItemTemplate>
                    <asp:Label ID="ReplyCount" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="最近回复" HeaderStyle-CssClass="forumheader fc4" ItemStyle-CssClass="textleft padding5">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="LastReplyTopic"></asp:LinkButton><br />
                    <asp:Label runat="server" ID="LastReplyTimeLabel" ></asp:Label>&nbsp;| 
                    <asp:LinkButton runat="server" ID="LastReplyUserLink" ></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="版主" HeaderStyle-CssClass="forumheader fc5">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="ModeratorLink" >
                        <asp:Label runat="server" ID="ModeratorLabel" Text='<%# Item.Moderator %>' />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
</asp:Content>

