<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="Index.aspx.cs" Inherits="NextProject.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="centrado">
        Bienvenido</h1>
    <hr class="hr-centrado" />
    <div class="row-fluid">
        <div class="span5">
            <img src="IMAGES/Index/2.jpg" class="img-polaroid" />
        </div>
        <div class="span6">
            <p class="lead p-formato">
                Mediante el presente sitio web, se pretende aumentar el conocimiento de los estudiantes
                en el tema de “División de subredes”.</p>
        </div>
    </div>
    <h2>
        <div class="row-fluid">
            <div class="span6">
                <p class="lead p-formato">
                    Donde los estudiantes: pueden consultar material didáctico y ver ejemplos para posteriormente
                    realizar actividades; e incluso ver sus resultados y mejorar sus notas.</p>
            </div>
            <div class="span5">
                <img src="IMAGES/Index/4.jpg" class="img-polaroid" />
            </div>
        </div>
    </h2>
    <script type="text/javascript">
        $('#inicio').addClass('current_page_item');
    </script>
</asp:Content>