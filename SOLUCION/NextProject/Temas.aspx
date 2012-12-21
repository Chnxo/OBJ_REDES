<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="Temas.aspx.cs" Inherits="NextProject.Temas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <a href="T1_Introduccion.aspx">Introducción</a>
    <script type="text/javascript">
        $('#temas').addClass('current_page_item');
    </script>
</asp:Content>