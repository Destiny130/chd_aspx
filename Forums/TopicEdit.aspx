<%@ Page Title="Topic Edit" Language="C#" MasterPageFile="~/MasterPages/Layout.master" AutoEventWireup="true" CodeFile="TopicEdit.aspx.cs" Inherits="Forums_TopicEdit" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="/kindeditor/kindeditor-all-min.js"></script>
    <script src="/kindeditor/lang/zh-CN.js"></script>
    <script>
        //kindeditor初始化
        var editor;
        KindEditor.ready(function (K)
        {
            //创建富文本编辑器
            editor = K.create(document.getElementById('<%=EditContentTextBox.ClientID%>'), {
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
    <div class="table90 padding5 textcenter">
        <h4>编辑 - 
            <asp:LinkButton ID="TitleLinkButton" runat="server" Text="" Font-Size="17px" OnClick="TitleLinkButton_Click"></asp:LinkButton>
        </h4>
    </div>
    <br />
    <table class="table90 textcenter">
        <tr>
            <td class="textleft border">
                <h3>编辑</h3>
            </td>
        </tr>
        <tr>
            <td class="border padding10">
                <table class="table90 textcenter">
                    <tr>
                        <td class="borderdeepcolor padding5 bold" style="width: 26px;">主题</td>
                        <td class="borderdeepcolor textleft padding5">
                            <asp:TextBox ID="EditTitleTextBox" runat="server" Width="650px" Height="20px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="borderdeepcolor padding5 bold" valign="top">正文</td>
                        <td class="borderdeepcolor padding5">
                            <table class="table98 textleft">
                                <tr>
                                    <td class="border padding5">
                                        <asp:TextBox ID="EditContentTextBox" runat="server" TextMode="MultiLine" ></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="borderdeepcolor textcenter padding5" colspan="2">
                            <asp:Button ID="EditButton" runat="server" Text="编辑" OnClick="EditButton_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
    <br />
</asp:Content>

