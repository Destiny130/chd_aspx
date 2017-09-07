<%@ Page Title="CHDBits :: 用户详情- Powered by NexusPHP" Language="C#" MasterPageFile="~/MasterPages/Layout.master" AutoEventWireup="true" CodeFile="UserDetails.aspx.cs" Inherits="UserControlViews_UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent1" runat="Server">
    <br />
    <div class="table90 textcenter">
        <asp:Label ID="UserName" runat="server" Font-Size="16px" Visible="false"></asp:Label>
        <asp:LinkButton ID="ManageUserLink" runat="server" OnClick="ManageUserLink_Click" Visible="false">管理</asp:LinkButton>
    </div>
    <br />
    <asp:Table runat="server" CssClass="table90 textleft" ID="UserDetailsTable" Visible="false">
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright bold" Width="100px">邀请</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:Label ID="InviteLabel" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright bold" Width="100px">加入日期</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:Label ID="CreateLabel" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright bold" Width="100px">最近动向</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:Label ID="LastActiveLabel" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright bold" Width="100px">当前IP</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:Label ID="IPLabel" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright bold" Width="100px">BT客户端</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:Label ID="BTClientLabel" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright bold" Width="100px">传输</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <b>分享率:</b>
                <asp:Label ID="RadioLabel" runat="server"></asp:Label><br />
                <b>上传量:</b>
                <asp:Label ID="UploadedLabel" runat="server"></asp:Label>
                <b>下载量:</b>
                <asp:Label ID="DownloadedLabel" runat="server"></asp:Label>
                <b>做种积分:</b>
                <asp:Label ID="TorrentBounsLabel" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright bold" Width="100px">BT时间</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <b>做种/下载时间比率:</b>
                <asp:Label ID="TimeRadioLabel" runat="server"></asp:Label><br />
                <b>做种时间:</b>
                <asp:Label ID="UploadTimeLabel" runat="server"></asp:Label>
                <b>下载时间:</b>
                <asp:Label ID="DownloadTimeLabel" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright bold" Width="100px">性别</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:Label ID="SexLabel" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright bold" Width="100px">头像</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:Image runat="server" ID="AvatarImg" Width="200px" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright bold" Width="100px">等级</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:Label ID="DegreeLabel" runat="server" Text="POWER USER"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright bold" Width="100px">种子评论</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:LinkButton runat="server" ID="TorrentCommentLink" >
                    <asp:Label runat="server" ID="TorrentCommentLabel"></asp:Label>
                </asp:LinkButton>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright bold" Width="100px">论坛帖子</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:LinkButton runat="server" ID="ForumPostLink" >
                    <asp:Label ID="ForumsPostLabel" runat="server"></asp:Label>
                </asp:LinkButton>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright bold" Width="100px">魔力值</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:Label ID="BounsLabel" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5" ColumnSpan="2">
                <asp:Label ID="PersonalDesLabel" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Table runat="server" CssClass="table90 textleft" ID="noIdChoosen">
        <asp:TableRow>
            <asp:TableCell CssClass="border padding10">
                <asp:Label ID="Label1" runat="server" Text="无效的ID！" Font-Size="17px"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>

