<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Actividades.aspx.cs" Inherits="NextProject.Actividades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <a href="CrearActividad.aspx">Nueva Actividad</a>
    <script type="text/javascript">
        $('#actividades').addClass('current_page_item');
    </script>
</asp:Content>
