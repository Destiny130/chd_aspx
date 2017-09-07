<%@ Page Title="jQuery Demo" Language="C#" MasterPageFile="~/MasterPages/Layout.master" AutoEventWireup="true" CodeFile="jQuery.aspx.cs" Inherits="Demos_jQuery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent1" runat="Server">
    <div style="width: 900px; height: 200px; text-align: center; margin: auto;">
        <input id="Button1" type="button" value="button" />
        <script>
            $(document).ready(function ()
            {
                $('#MainContent').css('background-color', 'green')
                $('#Button1').click(function ()
                {
                    $('#MainContent').css('background-color', 'red').animate({ width: '100px', height: '800px' })
                });
            });
        </script>
    </div>
</asp:Content>

