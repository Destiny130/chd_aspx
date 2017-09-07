<%@ Page Title="Edit Forum" Language="C#" MasterPageFile="~/MasterPages/Layout.master" AutoEventWireup="true" CodeFile="EditForum.aspx.cs" Inherits="Management_EditForum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent1" runat="Server">
    <div class="table90 textcenter">
        <a href="../NavigationViews/Forums.aspx">CHDBits论坛</a>
    </div>
    <br />
    <asp:ListView runat="server" ID="EditForumListView" SelectMethod="EditForumListView_GetData" ItemType="Forum" UpdateMethod="EditForumListView_UpdateItem" DataKeyNames="Id">
        <ItemTemplate>
            <li>
                <asp:Table runat="server" ID="EditForumTable" CssClass="table90">
                    <asp:TableRow>
                        <asp:TableCell CssClass="border padding5">
                            <asp:Label runat="server" ID="ForumNameLabel" Text='<%# BindItem.ForumName %>'></asp:Label><br />
                            <asp:Label runat="server" ID="ForumDesLabel" Text='<%# BindItem.ForumDescription %>'></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell CssClass="border padding5" Width="200px">
                            <asp:Label runat="server" ID="ModeratorLabel" Text='<%# BindItem.Moderator %>'></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell CssClass="border padding5" Width="100px">
                            <asp:Button ID="EditButton" runat="server" Text="编辑" CommandName="Edit" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </li>
        </ItemTemplate>
        <EditItemTemplate>
            <li>
                <asp:Table runat="server" ID="EditForumTable" CssClass="table90">
                    <asp:TableRow>
                        <asp:TableCell CssClass="border padding5">
                            <asp:TextBox runat="server" ID="ForumNameText" Text='<%# BindItem.ForumName %>'></asp:TextBox><br />
                            <asp:TextBox runat="server" ID="ForumDesText" Text='<%# BindItem.ForumDescription %>' Width="450px" Height="20px"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell CssClass="border padding5" Width="200px">
                            <asp:TextBox runat="server" ID="ModeratorText" Text='<%# BindItem.Moderator %>'></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell CssClass="border padding5" Width="100px">
                            <asp:Button ID="UpdateButton" runat="server" Text="更新" CommandName="Update" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </li>
        </EditItemTemplate>
        <LayoutTemplate>
            <asp:Table runat="server" ID="LayoutTable" CssClass="table90">
                <asp:TableRow>
                    <asp:TableCell CssClass="border padding5">板块</asp:TableCell>
                    <asp:TableCell CssClass="border padding5" Width="200px">版主</asp:TableCell>
                    <asp:TableCell CssClass="border padding5" Width="100px">编辑</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <ul style="list-style-type: none;">
                <li runat="server" id="itemPlaceHolder" />
            </ul>
        </LayoutTemplate>
    </asp:ListView>
    <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" CssClass="table90 padding5 textcenter border" ItemType="Forum" SelectMethod="GridView1_GetData">
        <Columns>
            <asp:TemplateField HeaderText="板块" ItemStyle-CssClass="textleft padding10 forumlogo1" HeaderStyle-CssClass="forumheader fc1">
                <ItemTemplate>
                    <asp:TextBox runat="server" ID="ForumNameText" Text='<%# BindItem.ForumName %>' /><br />
                    <asp:TextBox runat="server" ID="ForumDesText" Text='<%# BindItem.ForumDescription %>' Width="600px" Height="20px" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="版主" HeaderStyle-CssClass="forumheader fc5" ItemStyle-CssClass="padding10">
                <ItemTemplate>
                    <asp:TextBox runat="server" ID="ForumModeratorText" Text='<%# BindItem.Moderator %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="保存" HeaderStyle-CssClass="forumheader" ItemStyle-CssClass="padding10">
                <ItemTemplate>
                    <asp:Button runat="server" Text="编辑" CommandName="edit" CausesValidation="False" ID="Button1"></asp:Button>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>--%>
</asp:Content>

