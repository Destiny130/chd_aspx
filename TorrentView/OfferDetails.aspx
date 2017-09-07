<%@ Page Title="Offer Details" Language="C#" MasterPageFile="~/MasterPages/Layout.master" AutoEventWireup="true" CodeFile="OfferDetails.aspx.cs" Inherits="TorrentView_OfferDeatils" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent1" runat="Server">
    <asp:Table runat="server" ID="NoIdTable" Visible="true" CssClass="table90 textcenter">
        <asp:TableRow>
            <asp:TableCell CssClass="border"><h3>无效的行为</h3></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Table runat="server" ID="OfferDetailsTable" Visible="false" CssClass="table90 textleft">
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2" CssClass="textcenter padding10">
                <asp:Label runat="server" ID="TitleLabel" Font-Size="17px" CssClass="textcenter" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright" Width="100px"><b>信息</b></asp:TableCell><asp:TableCell CssClass="border padding5">
                由&nbsp;<asp:LinkButton runat="server" ID="UserLink" OnClick="UserLink_Click" />&nbsp;提交于<asp:Label runat="server" ID="CreateDateTimeLabel" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright"><b>状态</b></asp:TableCell><asp:TableCell CssClass="border padding5">
                <asp:Label runat="server" ID="AuthorizedLabel" />
                <asp:Button runat="server" ID="AuthorizationButton" OnClick="AuthorizationButton_Click" Visible="false" Text="允许" />
                <asp:Button runat="server" ID="EditButton" Text="编辑" OnClick="EditButton_Click" Visible="false" />
                <asp:Button runat="server" ID="DeleteButton" Text="删除" OnClick="DeleteButton_Click" Visible="false" />
                <asp:Button runat="server" ID="UploadButton" Text="发布" OnClick="UploadButton_Click" Visible="false" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright"><b>副标题</b></asp:TableCell><asp:TableCell CssClass="border padding5">
                <asp:Label runat="server" ID="SubTitleLabel" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright"><b>基本信息</b></asp:TableCell><asp:TableCell CssClass="border padding5">
                <b>类型:</b><asp:Label ID="TypeLabel" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border padding5 textright" valign="top"><b>简介</b></asp:TableCell><asp:TableCell CssClass="border padding5">
                <asp:Label runat="server" ID="BodyLabel" ReadOnly="True" Height="300px" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <asp:Table runat="server" ID="ErrorSubmitTable" Visible="false" CssClass="table90 textcenter">
        <asp:TableRow>
            <asp:TableCell CssClass="border padding10">
                ERROR!<br />
                <asp:label runat="server" ID="ErrorSubmit"/>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
