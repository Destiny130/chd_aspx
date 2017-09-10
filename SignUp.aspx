<%@ Page Title="Sign Up" Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>


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
                    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server">
                        <WizardSteps>
                            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                            </asp:CreateUserWizardStep>
                            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                            </asp:CompleteWizardStep>
                        </WizardSteps>
                    </asp:CreateUserWizard>
                </td>
            </tr>
            <tr>
                <td class="padding10 textleft border">已有账号？点击
                    <a href="Login.aspx">登录</a><br />
                    <br />
                    Go back to <a href="NavigationViews/Index.aspx" class="bold underline">CHD</a>.
                </td>
            </tr>
        </table>
    </form>
</body>
</html>



