<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="Index.aspx.cs" Inherits="NextProject.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>
        Hello World</h1>
    <script type="text/javascript">
            $('#inicio').addClass('current_page_item');
    </script>
</asp:Content>