<%@ Page Title="CHDBits :: 新主题 - Powered by NexusPHP" Language="C#" MasterPageFile="~/MasterPages/Layout.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="NewTopic.aspx.cs" Inherits="Forums_NewTopic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="/kindeditor/kindeditor-all-min.js"></script>
    <script src="/kindeditor/lang/zh-CN.js"></script>
    <script>
        //kindeditor初始化
        var editor;
        KindEditor.ready(function (K)
        {
            //创建富文本编辑器
            editor = K.create(document.getElementById('<%=ReplyContentTextBox.ClientID%>'), {
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
    <br />
    <div class="table90 padding10 textcenter">
        <h4>新主题 - 
            <asp:LinkButton ID="BackViewForumLinkButton" runat="server" Text="" Font-Size="17px" OnClick="BackViewForumLinkButton_Click"></asp:LinkButton>
            板块
        </h4>
    </div>
    <br />
    <table class="table90 textcenter">
        <tr>
            <td class="textleft border">
                <h3>新撰写</h3>
            </td>
        </tr>
        <tr>
            <td class="border padding10">
                <table class="table90 textcenter">
                    <tr>
                        <td class="borderdeepcolor padding5" style="width: 26px;"><b>主题</b></td>
                        <td class="borderdeepcolor textleft padding5">
                            <asp:TextBox ID="TitleTextBox" runat="server" Width="650px" Height="20px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="borderdeepcolor padding5" valign="top"><b>正文</b></td>
                        <td class="borderdeepcolor padding5">
                            <table class="table98 textleft">
                                <tr>
                                    <td class="border padding10">
                                        <asp:TextBox ID="ReplyContentTextBox" runat="server" TextMode="MultiLine" ></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="borderdeepcolor textcenter padding5" colspan="2">
                            <asp:Button ID="InsertButton" runat="server" Text="提交" OnClick="InsertButton_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>

