<%@ Page Title="Forum Setting" Language="C#" MasterPageFile="~/MasterPages/UsercpLayout.master" AutoEventWireup="true" CodeFile="ForumSetting.aspx.cs" Inherits="UserControlPanel_ForumSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="UserCPHolder" runat="Server">
    <asp:Table runat="server" Width="940px" CssClass="marginauto">
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5" Width="60px">每页主题数</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">每页帖子数</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">查看头像</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">查看签名档</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">悬浮提示最新帖子</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">点击主题时</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">我的签名档</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5">
                <asp:TextBox ID="SignatureText" runat="server" TextMode="MultiLine" Width="650px" Height="120px"></asp:TextBox><br />
                允许使用BBCode代码。最大图片尺寸为500*200，只有第一张图片会显示。
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">保存设定</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5">
                <asp:Button ID="SaveButton" runat="server" Text="保存设定！(只需点击一次)" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>

