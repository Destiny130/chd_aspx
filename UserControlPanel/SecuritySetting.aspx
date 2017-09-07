<%@ Page Title="Security Setting" Language="C#" MasterPageFile="~/MasterPages/UsercpLayout.master" AutoEventWireup="true" CodeFile="SecuritySetting.aspx.cs" Inherits="UserControlPanel_SecuritySetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="UserCPHolder" runat="Server">
    <asp:Table runat="server" Width="940px" CssClass="marginauto">
        <asp:TableRow>
            <asp:TableCell CssClass="border textleft padding5">
                <asp:ChangePassword ID="ChangePassword1" runat="server"></asp:ChangePassword>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>

