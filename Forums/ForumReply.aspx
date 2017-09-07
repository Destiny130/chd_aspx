<%@ Page Title="reply forum" Language="C#" MasterPageFile="~/MasterPages/Layout.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="ForumReply.aspx.cs" Inherits="Forums_ForumReply" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="/kindeditor/kindeditor-all-min.js"></script>
    <script src="/kindeditor/lang/zh-CN.js"></script>
    <script>
        //kindeditor初始化
        var editor;
        KindEditor.ready(function (K)
        {
            //创建富文本编辑器
            editor = K.create(document.getElementById("<%=DetailsView1.ClientID%>" + "_ReplyText"), {
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
    <div class="table90 textcenter padding10">
        <h4>回复主题：
            <a href="<%=GetViewTopicURL()%>">
                <asp:Label ID="Label1" runat="server" Text="" Font-Size="17px"></asp:Label>
            </a>
        </h4>
    </div>
    <br />
    <table class="table90 textcenter">
        <tr>
            <td class="border">
                <h3>回复</h3>
            </td>
        </tr>
        <tr>
            <td class="border padding10">
                <asp:DetailsView ID="DetailsView1" runat="server" Height="520px" Width="90%" CssClass="table90 padding10 textcenter" AutoGenerateRows="False" DataKeyNames="Id" DefaultMode="Insert" InsertMethod="DetailsView1_InsertItem">
                    <Fields>
                        <asp:TemplateField HeaderText="正文" SortExpression="ReplyContent" HeaderStyle-Width="26px" HeaderStyle-BackColor="#7c98ae" ItemStyle-BackColor="#7C98AE" HeaderStyle-CssClass="bold padding5" HeaderStyle-VerticalAlign="Top" ItemStyle-CssClass="padding5" >
                            <InsertItemTemplate>
                                <table class="table98 textcenter padding5" style="height: 98%;">
                                    <tr>
                                        <td class="border padding10 ">
                                            <asp:TextBox runat="server" Text='<%# Bind("ReplyContent") %>' ID="ReplyText" TextMode="MultiLine" ></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowInsertButton="true" ShowCancelButton="False" InsertText="提交" ButtonType="Button" />
                    </Fields>
                </asp:DetailsView>
            </td>
        </tr>
    </table>
</asp:Content>

