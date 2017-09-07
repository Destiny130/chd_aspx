<%@ Page Title="Manage User" Language="C#" MasterPageFile="~/MasterPages/Layout.master" AutoEventWireup="true" CodeFile="ManageUser.aspx.cs" Inherits="Management_ManageUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent1" runat="Server">
    <br />
    <div class="table90 textcenter">
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">
            <asp:Label ID="UserName" runat="server" Font-Size="16px" Visible="false"></asp:Label>
        </asp:LinkButton>
    </div>
    <br />
    <asp:Table runat="server" ID="ManagerUserTable" CssClass="table90 textleft">
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 texasp:TableRowight bold" Style="width: 120px;">用户名</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:TextBox ID="UserNameText" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 texasp:TableRowight bold" Style="width: 120px;">邀请</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:TextBox ID="InviteText" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 texasp:TableRowight bold">加入日期</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:TextBox ID="CreateDateText" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 texasp:TableRowight bold">最近动向</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:TextBox ID="LastActivityDateText" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 texasp:TableRowight bold">当前IP</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:TextBox ID="IPAdressText" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 texasp:TableRowight bold">BT客户端</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:TextBox ID="BTClientText" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 texasp:TableRowight bold">分享率</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:Label ID="RadioLabel" runat="server" Text="Label"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 texasp:TableRowight bold">上传量</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:TextBox ID="UploadedText" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 texasp:TableRowight bold">下载量</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:TextBox ID="DownloadedText" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 texasp:TableRowight bold">做种积分</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:TextBox ID="TorrentBounsText" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 texasp:TableRowight bold">做种/下载时间比率</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:Label ID="TimeRadioLabel" runat="server" Text="Label"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 texasp:TableRowight bold">做种时间</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:TextBox ID="UploadTimeText" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 texasp:TableRowight bold">下载时间</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:TextBox ID="DownloadTimeText" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 texasp:TableRowight bold">性别</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:DropDownList ID="SexList" runat="server"></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 texasp:TableRowight bold">头像</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:Image runat="server" ID="AvatarImg" width="200px"/><br />
                <asp:FileUpload runat="server" ID="AvatarFileUpload" /><br />
                <asp:CustomValidator runat="server" ID="cusValImage" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 texasp:TableRowight bold">等级</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:DropDownList ID="DegreeList" runat="server"></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 texasp:TableRowight bold">种子评论</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:LinkButton runat="server" ID="TorrentCommentLink">
                    <asp:Label runat="server" ID="TorrentCommentLabel"></asp:Label>
                </asp:LinkButton>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 texasp:TableRowight bold">论坛帖子</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:LinkButton runat="server" ID="ForumPostLink">
                    <asp:Label ID="ForumsPostLabel" runat="server"></asp:Label>
                </asp:LinkButton>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 texasp:TableRowight bold">魔力值</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:TextBox ID="BounsText" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding10" ColumnSpan="2">
                <asp:TextBox ID="PersonalDesText" runat="server" TextMode="MultiLine" Width="650px" Height="120px"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow CssClass="border">
            <asp:TableCell CssClass=" padding5 "></asp:TableCell>
            <asp:TableCell CssClass=" padding5">
                <asp:Button ID="SaveButton" runat="server" Text="保存修改" OnClick="SaveButton_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>

