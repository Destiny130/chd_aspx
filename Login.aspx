<%@ Page Title="Login" Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../App_Themes/DarkGreen/DarkGreen.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Path="~/Scripts/jquery-3.1.1.min.js" />
            </Scripts>
        </asp:ScriptManager>
        <header class="chdHeader">
            <table style="width: 100%;">
                <tr>
                    <td id="chdlogo1">
                        <img src="../App_Themes/DarkGreen/images/chdbits.png" />
                    </td>
                    <td style="width: 0px;"></td>
                    <td id="donate">
                        <img src="../App_Themes/DarkGreen/images/donate.gif" />
                    </td>
                </tr>
            </table>
        </header>
        <table class="table90 textcenter">
            <tr>
                <td class="border padding10">
                    <asp:LoginView ID="LoginView1" runat="server">
                        <AnonymousTemplate>
                            <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/NavigationViews/Index.aspx" CreateUserText="Sign Up a New Account at CHDBits" CreateUserUrl="~/SignUp.aspx">
                            </asp:Login>
                        </AnonymousTemplate>
                        <LoggedInTemplate>
                            You are already logged in.
                        </LoggedInTemplate>
                    </asp:LoginView>
                    <br />
                    <asp:LoginStatus ID="LoginStatus1" runat="server" />
                    <br />
                    <div class="textleft">You can go back to <a href="NavigationViews/Index.aspx" class="bold underline">CHD</a>.</div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
