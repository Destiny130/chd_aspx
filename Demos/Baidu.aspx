<%@ Page Title="Baidu.com" Language="C#" AutoEventWireup="true" CodeFile="Baidu.aspx.cs" Inherits="Demos_Baidu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Baidu.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        <div class="navigation">
            <a class="nava" href="../Views/Fourms.aspx">新闻</a>
            <a class="nava" href="../Views/Index.aspx">hao123</a>
            <a class="nava" href="../Views/Offers.aspx">地图</a>
            <a class="nava" href="../Views/Selfassess.aspx">视频</a>
            <a class="nava" href="../Views/Subtitles.aspx">贴吧</a>
            <a class="nava" href="../Views/Torrents.aspx">学术</a>
            <a class="nava" href="../Views/Upload.aspx">登录</a>
            <a class="nava" href="../Views/Usercp.aspx">设置</a>
        </div>
    </header>
    <form>
        <div class="baidulogo">
            <asp:Image ID="baidulogo1" runat="server" ImageUrl="~/Demos/baidu_logo1.png" />
        </div>
        <div class="search">
            <table>
                <tr>
                    <td>
                        <input id="Text1" type="text" />
                    </td>
                    <td>
                        <input id="Button1" type="button" value="百度一下" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <footer>
        <div class="footerdiv">
            <div id="footer1">
                <a class="footerStyle" href="https://www.baidu.com/cache/sethelp/help.html">把百度设为主页</a>
                <a class="footerStyle" href="home.baidu.com">关于百度</a>
                <a class="footerStyle" href="http://ir.baidu.com/">About Baidu</a>
                <a class="footerStyle" href="e.baidu.com/?refer=888">百度推广</a>
            </div>
            <div id="footer2">
                <span class="footerStyle" >©2017 Baidu
                    <a href="https://www.baidu.com/duty/">使用百度前必读</a>
                    <a href="jianyi.baidu.com">意见反馈</a>
                    京ICP证030173号</span>
                <span class="footerStyle" ><a class="footerStyle" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11000002000001">京公安备11000002000001号</a></span>
            </div>
        </div>
    </footer>
</body>
</html>
