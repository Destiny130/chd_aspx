<%@ Page Title="edit reply" Language="C#" MasterPageFile="~/MasterPages/Layout.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="ForumEdit.aspx.cs" Inherits="Forums_ForumEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="/kindeditor/kindeditor-all-min.js"></script>
    <script src="/kindeditor/lang/zh-CN.js"></script>
    <script>
        //kindeditor初始化
        var editor;
        KindEditor.ready(function (K)
        {
            //创建富文本编辑器
            editor = K.create(document.getElementById('<%=EditContentText.ClientID%>'), {
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
            <td class="border">
                <h3>编辑</h3>
            </td>
        </tr>
        <tr>
            <td class="border textcenter padding10">
                <table class="table90 textcenter">
                    <tr>
                        <td class="borderdeepcolor bold" style="width: 20px; height: 500px;" valign="top">正文</td>
                        <td class="borderdeepcolor padding5">
                            <table class="table98 textcenter padding5" style="height: 98%;">
                                <tr>
                                    <td class="border padding10">
                                        <asp:TextBox runat="server" ID="EditContentText" TextMode="MultiLine" Width="98%" Height="300px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="borderdeepcolor textcenter padding5">
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

