<%@ Page Title="CHDBits :: 种子 - Powered by NexusPHP" Language="C#" MasterPageFile="~/MasterPages/Layout.master" AutoEventWireup="true" CodeFile="Torrents.aspx.cs" Inherits="Views_Torrents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
        <ContentTemplate>
            <table class="table90">
                <tr>
                    <td class="borderH textcenter ">
                        <asp:Label runat="server" Text="搜索箱" />
                    </td>
                </tr>
            </table>
            <asp:Table ID="SearchTable" runat="server" CssClass="table90 padding5">
                <asp:TableRow>
                    <asp:TableCell CssClass="border padding5" Width="90%">
                        <b>类型:</b><br />
                        <asp:CheckBoxList CssClass="CheckBoxListT" ID="TypeList" runat="server" DataValueField="Id" DataTextField="Tname" SelectMethod="TypeList_GetData" RepeatDirection="Horizontal" OnDataBound="TypeList_DataBound"></asp:CheckBoxList>
                        <asp:Button ID="TypeListButton" runat="server" Text="全选" OnClick="TypeListButton_Click" />
                        <br />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </ContentTemplate>
    </asp:UpdatePanel>
        <table class="table90">
            <tr>
                <td class="border padding5 textcenter table90">搜索关键字: 
                <asp:TextBox ID="SearchText" runat="server" Width="200px" ></asp:TextBox>
                </td>
                <td class="border padding5 textcenter">
                    <asp:Button ID="SearchButton" runat="server" Text="给我搜" OnClick="SearchButton_Click" />
                </td>
            </tr>
        </table>
    <br />
    <br />
    <asp:GridView runat="server" ID="TorrentGrid" AutoGenerateColumns="false" ItemType="Torrent" DataKeyNames="Id" CssClass="table90 textcenter" SelectMethod="TorrentGrid_GetData" OnRowDataBound="TorrentGrid_RowDataBound" AllowCustomPaging="True" AllowPaging="True">
        <EmptyDataTemplate>
            <div class="border padding10" style="border: none; font-size: 16px;">还没有人上传种子哦~</div>
        </EmptyDataTemplate>
        <Columns>
            <asp:TemplateField HeaderText="类型" HeaderStyle-CssClass="bold borderH" ItemStyle-CssClass="border padding5" HeaderStyle-Width="100px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="TypeLabel" Text='<%# Item.Ttype.Tname %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="标题" HeaderStyle-CssClass="bold borderH" ItemStyle-CssClass="border padding5 textleft">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="TitleLink" Text='<%# Item.Title %>' PostBackUrl='<%# "~/TorrentView/TorrentDetails.aspx?Id=" + Item.Id %>' Font-Bold="True" /><br />
                    <asp:Label runat="server" ID="SubtitleLabel" Text='<%# Item.SubTitle %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="评论" HeaderStyle-CssClass="bold borderH" ItemStyle-CssClass="border padding5" HeaderStyle-Width="30px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="CommentLink" Text='<%# Item.TorrentComments.Count().ToString() %>' PostBackUrl='<%# "~/TorrentView/TorrentDetails.aspx?Id=" + Item.Id + "#CommentDiv" %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="发布时间" HeaderStyle-CssClass="bold borderH" ItemStyle-CssClass="border padding5" HeaderStyle-Width="150px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="CreateDateTimeLabel" Text='<%# Item.CreateDateTime.ToString() %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="发布者" HeaderStyle-CssClass="bold borderH" ItemStyle-CssClass="border padding5" HeaderStyle-Width="100px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="AuthorLink" Text='<%# Item.AuthorName %>' CommandArgument='<%# Item.AuthorName %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

