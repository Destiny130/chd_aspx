<%@ Page Title="CHDBits :: 候选 - Powered by NexusPHP" Language="C#" MasterPageFile="~/MasterPages/Layout.master" AutoEventWireup="true" CodeFile="OfferAddEdit.aspx.cs" Inherits="NavigationViews_OfferAddEdit" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="/kindeditor/kindeditor-all-min.js"></script>
    <script src="/kindeditor/lang/zh-CN.js"></script>
    <script>
        //kindeditor初始化
        var editor;
        KindEditor.ready(function (K)
        {
            //创建富文本编辑器
            editor = K.create(document.getElementById('<%=BodyText.ClientID%>'), {
                //上传文件处理程序
                uploadJson: 'Admin/uploadFileHandler.ashx',
                //获取上传文件列表程序
                fileManagerJson: 'Admin/fileManagerHandler.ashx',
                //设置允许使用已上传文件中的文件
                allowFileManager: true,
                //设置取消标签过滤
                filterMode: false,
                //设置编辑器的宽度和高度，直接设置不行，
                //生成富文本编辑器之后，原textarea的display被设置为none，设置宽度和高度无效
                width: '98%',
                height: '500px'
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent1" runat="Server">
    <div>
        <asp:Table runat="server" ID="OfferEditTitle" CssClass="table90 textcenter" Visible="false">
            <asp:TableRow>
                <asp:TableCell>
                    <h4>编辑 -
                        <asp:LinkButton runat="server" ID="OfferDeatilsLink" OnClick="OfferDeatilsLink_Click" Font-Size="16px" />
                    </h4>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
    <br />
    <table class="table90">
        <tr>
            <td class="textcenter">红星号(<span style="color: red;">*</span>)标记的区域必须填写</td>
        </tr>
    </table>
    <br />
    <asp:Table runat="server" ID="OfferAddEditTable" Style="margin: auto;">
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2" CssClass="border">
                <h3 style="color: white; font-size: 12px;" class="textcenter">候选区对所有用户均开放...提高分享率的好方式！</h3>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="offeraddleft">种子<span style="color: red;">*</span></asp:TableCell>
            <asp:TableCell CssClass="offeraddright">
                <asp:FileUpload runat="server" ID="TorrentFileUpload" /><br />
                <asp:CustomValidator runat="server" ID="CusValTorrent" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="offeraddleft">类型<span style="color: red;">*</span></asp:TableCell>
            <asp:TableCell CssClass="offeraddright">
                <asp:DropDownList ID="TypeList" runat="server" DataTextField="Tname" DataValueField="Id" SelectMethod="TypeList_GetData" AppendDataBoundItems="True">
                    <asp:ListItem Value="">(请选择)</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="TypeValidator" runat="server" ErrorMessage="Choose a type!" ControlToValidate="TypeList"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="offeraddleft">标题<span style="color: red;">*</span></asp:TableCell>
            <asp:TableCell CssClass="offeraddright">
                <asp:TextBox ID="TorrentTitle" runat="server" Width="400px" Height="20px"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="TitleValidator" runat="server" ErrorMessage="Enter a title" ControlToValidate="TorrentTitle"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="offeraddleft">副标题</asp:TableCell>
            <asp:TableCell CssClass="offeraddright">
                <asp:TextBox ID="TorrentSubtitle" runat="server" Width="400px" Height="20px"></asp:TextBox><br />
                (将在种子页面种子标题下显示。如720p @ 4615 kbps - DTS 5.1 @ 1536 kbps)
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="offeraddleft">IMDb链接</asp:TableCell>
            <asp:TableCell CssClass="offeraddright">
                <asp:TextBox ID="IMDbLink" runat="server" Width="400px" Height="20px"></asp:TextBox><br />
                (来自<b>IMDb</b>的链接。如电影<b>The Dark Knight</b>的链接是<b>http://www.imdb.com/title/tt0468569/</b>)
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="offeraddleft">海报或图片</asp:TableCell>
            <asp:TableCell CssClass="offeraddright">
                <asp:TextBox ID="PostorPicture" runat="server" Width="400px" Height="20px"></asp:TextBox><br />
                (图标的链接。不要加标签代码! 显示在简介里)
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="offeraddleft " valign="top">简介<span style="color: red;">*</span></asp:TableCell>
            <asp:TableCell CssClass="offeraddright ">
                <asp:TextBox ID="BodyText" runat="server"  TextMode="MultiLine"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="BodyValidator" runat="server" ErrorMessage="Enter a body" ControlToValidate="BodyText"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textcenter padding10" ColumnSpan="2">
                <asp:Button runat="server" ID="SubmitButton" Text="提交" OnClick="SubmitButton_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />
</asp:Content>

