<%@ Page Title="ViewForum" Language="C#" MasterPageFile="~/MasterPages/Layout.master" AutoEventWireup="true" CodeFile="ViewForum.aspx.cs" Inherits="Forums_ViewForum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent1" runat="Server">
    <br />
    <div class="table90 textcenter">
        <a href="../NavigationViews/Forums.aspx">CHDBits论坛</a>-->
        <a href="<%# GetNavigate() %>">
            <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
        </a>
    </div>
    <br />
    <div class="table90 textright padding10">
        <asp:Button ID="NewTopicButton" runat="server" Text="新主题" OnClick="NewTopicButton_Click" />
    </div>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" SelectMethod="GridView1_GetData" CssClass="table90 padding5 border textcenter" PageSize="10" AllowPaging="True" AllowCustomPaging="False" ItemType="ViewForum">
        <Columns>
            <asp:TemplateField HeaderText="主题" ItemStyle-CssClass="textleft padding10 forumlogo1" HeaderStyle-CssClass="forumheader fc1">
                <ItemTemplate>
                    <asp:HyperLink runat="server" Text='<%# Item.Title %>' NavigateUrl='<%# "~/Forums/ViewTopic.aspx?Id=" + Item.Id %>' ID="HyperLink1" Width="70%" CssClass=" padding5 textleft"></asp:HyperLink>
                </ItemTemplate>
                <ItemStyle Width="70%" Height="27px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="作者" HeaderStyle-CssClass="forumheader" HeaderStyle-ForeColor="Black" HeaderStyle-Width="100px">
                <ItemTemplate>
                    <asp:HyperLink runat="server" Text='<%# Item.UserName %>' NavigateUrl='<%# GetAuthorURL(Item.UserName) %>' ID="HyperLink2"></asp:HyperLink><br />
                    <asp:Label ID="Label4" runat="server" Text='<%# GetCreateTime(Item.Id) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="回复/查看" HeaderStyle-CssClass="forumheader" HeaderStyle-Width="100px">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# GetReplyCount(Item.Id) %>' ID="Label2"></asp:Label>/
                    <asp:Label runat="server" Text='<%# Item.ViewCount %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="最近回复" HeaderStyle-CssClass="forumheader" HeaderStyle-ForeColor="Black" HeaderStyle-Width="100px">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# GetLastReplyTime(Item.Id) %>' ID="Label3"></asp:Label><br />
                    <asp:HyperLink ID="HyperLink3" runat="server" Text='<%# GetLastReplyAuthorName(Item.Id) %>' NavigateUrl='<%# GetLastReplyAuthorURL(Item.Id) %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

</asp:Content>

