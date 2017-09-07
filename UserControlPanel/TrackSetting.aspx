<%@ Page Title="Track Setting" Language="C#" MasterPageFile="~/MasterPages/UsercpLayout.master" AutoEventWireup="true" CodeFile="TrackSetting.aspx.cs" Inherits="UserControlPanel_TrackSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="UserCPHolder" runat="Server">
    <asp:Table runat="server" Width="940px" CssClass="marginauto">
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5" Width="60px">默认分类</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">界面风格</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">分类图标</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">字体大小</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">站点语言</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">推荐资源</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">短讯箱</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">种子详情页面</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">讨论</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">显示广告</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">时间显示类型</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">种子页面</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">保存设定</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5">
                <asp:Button ID="SaveButton" runat="server" Text="保存设定！(只需点击一次)" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>

