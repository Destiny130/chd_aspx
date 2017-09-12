<%@ Page Title="CHDBits :: 候选 - Powered by NexusPHP" Language="C#" MasterPageFile="~/MasterPages/Layout.master" AutoEventWireup="true" CodeFile="Offers.aspx.cs" Inherits="Views_Offers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent1" runat="Server">
    <table id="offerAdd" style="width: 90%; margin: auto; text-align: center;">
        <tr>
            <td style="background-color: #2f4879; padding: 3px; font-size: 16px;">候选区
            </td>
        </tr>
        <tr>
            <td>
                <table style="margin: auto; width: 100%; background-color: #bccad6;">
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left; font-size: 22px; font-weight: bold; padding: 6px 20px;">规则：</td>
                    </tr>
                    <tr>
                        <td style="text-align: left;">
                            <ul style="margin-left: 80px;">
                                <li style="padding: 3px;"><span style="color: #009f00;">贵宾</span>及以上等级的用户可直接发布种子，无需经过候选。<span style="color: #708090; font-weight: bold;">(冰人)Peasant</span>或以上等级的用户可以添加候选。</li>
                                <li style="padding: 3px;">当候选的支持票比反对票多<span style="font-weight: bold;">16</span>票时，候选被通过。</li>
                                <li style="padding: 3px;">如候选在添加<span style="font-weight: bold;">120</span>小时后未被通过，它将被删除。</li>
                                <li style="padding: 3px;">如在候选通过后<span style="font-weight: bold;">48</span>小时内用户没有发布种子，通过的候选将被删除。</li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 3px; font-weight: bold;">
                            <asp:LinkButton runat="server" ID="AddOfferLink" Text="添加候选" OnClick="AddOfferLink_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="margin: auto;">
                                <tr>
                                    <td>搜索：
                                    <asp:TextBox ID="SearchText" runat="server"></asp:TextBox>
                                        <asp:DropDownList ID="TypeList" runat="server" Width="120px" SelectMethod="TypeList_GetData" AppendDataBoundItems="True" DataTextField="Tname" DataValueField="Id" OnDataBound="TypeList_DataBound">
                                            <asp:ListItem Value="">(显示全部)</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Button ID="SearchButton" runat="server" Text="给我搜" OnClick="SearchButton_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <asp:GridView runat="server" ID="OfferGrid" SelectMethod="OfferGrid_GetData" DataKeyNames="Id" AutoGenerateColumns="False" CssClass="table90 textcenter" ItemType="OfferTorrent" OnRowDataBound="OfferGrid_RowDataBound">
        <EmptyDataTemplate>
            <div class="border padding10" style="border: none; font-size: 16px;">还没有人添加候选哦~</div>
        </EmptyDataTemplate>
        <Columns>
            <asp:TemplateField HeaderText="类型" SortExpression="TypeId" HeaderStyle-Width="100px" HeaderStyle-CssClass="borderH textcenter" ItemStyle-CssClass="border padding5">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Item.Ttype.Tname %>' ID="TypeLbael"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="标题" SortExpression="Title" HeaderStyle-CssClass="borderH textcenter" ItemStyle-CssClass="border textleft padding5">
                <ItemTemplate>
                    <asp:HyperLink runat="server" ID="TitleLink" Text='<%# Item.Title %>' Font-Bold="true" NavigateUrl='<%# "~/TorrentView/OfferDetails.aspx?Id=" + Item.Id %>' /><br />
                    <asp:Label runat="server" Text='<%# Item.SubTitle %>' ID="SubtitleLabel"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态" SortExpression="Authorized" HeaderStyle-Width="100px" HeaderStyle-CssClass="borderH textcenter" ItemStyle-CssClass="border padding5">
                <ItemTemplate>
                    <asp:Label runat="server" ID="AuthorizationLabel" Text='<%# Item.Authorized ? "YES" : "NO" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CreateDateTime" HeaderText="发布时间" SortExpression="CreateDateTime" HeaderStyle-Width="100px" HeaderStyle-CssClass="borderH" ItemStyle-CssClass="border padding5"></asp:BoundField>
            <asp:TemplateField HeaderText="添加者" HeaderStyle-Width="100px" HeaderStyle-CssClass="borderH textcenter" ItemStyle-CssClass="border padding5">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="AuthorLink" Text='<%# Item.AuthorName %>' />
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
    <br />

</asp:Content>

