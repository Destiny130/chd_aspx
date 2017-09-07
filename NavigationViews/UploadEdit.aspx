<%@ Page Title="CHDBits :: 发布 - Powered by NexusPHP" Language="C#" MasterPageFile="~/MasterPages/Layout.master" AutoEventWireup="true" CodeFile="UploadEdit.aspx.cs" Inherits="Views_UploadEdit" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="/kindeditor/kindeditor-all-min.js"></script>
    <script src="/kindeditor/lang/zh-CN.js"></script>
    <script>
        //kindeditor初始化
        var editor;
        KindEditor.ready(function (K)
        {
            //创建富文本编辑器
            editor = K.create(document.getElementById('<%=SummaryText.ClientID%>'), {
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
    <asp:Table runat="server" ID="NoAuthorizedTable" CssClass="table90">
        <asp:TableRow>
            <asp:TableCell CssClass="border">
                <h3>对不起</h3>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border" Style="padding: 12px;">你没有发布种子的权限。如果你是普通会员，请到候选区提交你的发布请求。</asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <asp:Table runat="server" ID="UploadTable" class="table90" Visible="false">
        <asp:TableRow>
            <asp:TableCell CssClass="border" ColumnSpan="2">
                <h3 style="color: white; font-size: 12px;" Class="textcenter">发布/编辑你的种子</h3>
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
            <asp:TableCell CssClass="offeraddleft">类型<span style="color: red;">*</span></asp:TableCell><asp:TableCell CssClass="offeraddright">
                <asp:DropDownList ID="TypeList" runat="server" DataTextField="Tname" DataValueField="Id" SelectMethod="TypeList_Getdata" AppendDataBoundItems="true">
                    <asp:ListItem Value="">(请选择)</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="TypeValidator" runat="server" ErrorMessage="Choose a type!" ControlToValidate="TypeList"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="offeraddleft">标题<span style="color: red;">*</span></asp:TableCell><asp:TableCell CssClass="offeraddright">
                <asp:TextBox ID="TorrentTitle" runat="server" Width="400px" Height="20px"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="TitleValidator" runat="server" ErrorMessage="Enter a title" ControlToValidate="TorrentTitle"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="offeraddleft">副标题</asp:TableCell><asp:TableCell CssClass="offeraddright">
                <asp:TextBox ID="TorrentSubtitle" runat="server" Width="400px" Height="20px"></asp:TextBox><br />
                (将在种子页面种子标题下显示。如720p @ 4615 kbps - DTS 5.1 @ 1536 kbps)
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="offeraddleft">IMDb链接</asp:TableCell><asp:TableCell CssClass="offeraddright">
                <asp:TextBox ID="IMDbLink" runat="server" Width="400px" Height="20px"></asp:TextBox><br />
                (来自<b>IMDb</b>的链接。如电影<b>The Dark Knight</b>的链接是<b>http://www.imdb.com/title/tt0468569/</b>)
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="offeraddleft">海报或图片</asp:TableCell><asp:TableCell CssClass="offeraddright">
                <asp:TextBox ID="PostorPicture" runat="server" Width="400px" Height="20px"></asp:TextBox><br />
                (图标的链接。不要加标签代码! 显示在简介里)
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="offeraddleft" valign="top">简介<span style="color: red;">*</span></asp:TableCell><asp:TableCell CssClass="offeraddright">
                <asp:TextBox ID="SummaryText" runat="server" TextMode="MultiLine"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="BodyValidator" runat="server" ErrorMessage="Enter a body" ControlToValidate="SummaryText"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell CssClass="border textcenter padding5" ColumnSpan="2">
                <asp:Button ID="TorrentAdd" CssClass="button" runat="server" Text="提交" OnClick="TorrentAdd_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
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

