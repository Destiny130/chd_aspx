<%@ Page Title="Personal Setting" Language="C#" MasterPageFile="~/MasterPages/UsercpLayout.master" AutoEventWireup="true" CodeFile="PersonalSetting.aspx.cs" ValidateRequest="false" Inherits="UserControlPanel_PersonalSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="UserCPHolder" runat="Server">
    <asp:Table runat="server" Width="940px" CssClass="marginauto" ID="PersonalSettingTable">
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5" Width="60px">封存账号</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">短讯</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">性别</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">国家/地区</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">网络带宽</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">头像URL</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5">
                <asp:Image runat="server" ID="AvatarImg" Width="200px" /><br />
                <asp:FileUpload runat="server" ID="AvatarFileUpload" /><br />
                <asp:CustomValidator runat="server" ID="cusValImage" ErrorMessage="Select a valid .jpg file." />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">个人说明</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5">
                <asp:TextBox ID="PersonalDesText" runat="server" TextMode="MultiLine" Width="650px" Height="120px"></asp:TextBox><br />
                显示在你的个人信息页面。
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textright bold padding5">保存设定</asp:TableCell>
            <asp:TableCell CssClass="border textleft padding5">
                <asp:Button ID="SaveButton" runat="server" Text="保存设定！(只需点击一次)" OnClick="SaveButton_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>

