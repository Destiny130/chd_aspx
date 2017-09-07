<%@ Page Title="CHDBits :: 控制面板 - 首页 - Powered by NexusPHP" Language="C#" MasterPageFile="~/MasterPages/UsercpLayout.master" AutoEventWireup="true" CodeFile="Usercp.aspx.cs" Inherits="NavigationViews_Usercp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="UserCPHolder" runat="Server">
    <asp:Table runat="server" Width="940px" CssClass="marginauto">
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5" Width="60px">加入日期</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5">
                <asp:Label runat="server" ID="CreateDateTimeLabel" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">邮箱地址</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">IP/地点</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5">
                <asp:Label runat="server" ID="IPAdressLabel" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5" valign="top">头像</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5">
                <asp:Image runat="server" ID="AvatarImg" Width="200px" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">密钥</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">宣传链接</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">邀请</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5">
                <asp:Label runat="server" ID="InviteLabel" />
                [<asp:LinkButton runat="server" ID="SendInviteLink" PostBackUrl="~/UserDetailsViews/Invite.aspx" Text="发送" />]
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">魔力值</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5">
                <asp:Label runat="server" ID="BounsLabel" />
                [<asp:LinkButton runat="server" ID="MyBounsLink" PostBackUrl="~/UserDetailsViews/Mybonus.aspx" Text="使用" />]
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">评论数</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5">
                <asp:Label runat="server" ID="TorrentCommentLabel" />
                [<asp:LinkButton runat="server" ID="ViewCommentLink" PostBackUrl="~/UserHistory/ViewComments.aspx" Text="查看" />]
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">论坛帖子数</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5">
                <asp:Label runat="server" ID="ForumPostLabel" />
                [<asp:LinkButton runat="server" ID="ViewPostLabel" PostBackUrl="~/UserHistory/ViewPosts.aspx" Text="查看" />] 
                (论坛总贴数: <asp:Label ID="ForumReplyTotal" runat="server" /> 占<asp:Label runat="server" ID="ForumPostsPercent" />%总贴)
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>

