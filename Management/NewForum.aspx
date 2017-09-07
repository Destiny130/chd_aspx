<%@ Page Title="Add a new block" Language="C#" MasterPageFile="~/MasterPages/Layout.master" AutoEventWireup="true" CodeFile="NewForum.aspx.cs" Inherits="Forums_NewForum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent1" runat="Server">
    <div class="table90 textcenter">
        <a href="../NavigationViews/Forums.aspx">CHDBits论坛</a>
    </div>
    <br />
    <asp:Table runat="server" ID="NewForumTable" CssClass="table90 textleft">
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <h3>添加新的论坛版块</h3>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright bold" Width="60px">版块名称</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:TextBox runat="server" ID="ForumNameText" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright bold">板块描述</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:TextBox runat="server" ID="ForumDesText" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright bold">版主用户名</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:TextBox runat="server" ID="ForumModeratorText" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright bold">提交</asp:TableCell>
            <asp:TableCell CssClass="border padding5">
                <asp:Button runat="server" ID="SaveButton" Text="插入新的板块" OnClick="SaveButton_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>

