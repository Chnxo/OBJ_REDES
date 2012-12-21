<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="T1_Introduccion.aspx.cs" Inherits="NextProject.T1_Introduccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="posicionar">
    </div>
    <h1 class="centrado">
        INTRODUCCIÓN A LA DIVISIÓN EN SUBREDES</h1>
    <hr class="hr-centrado" />
    <h2 class="centrado">
        <img src="IMAGES/Temas/T1_I1.gif" class="img-polaroid" />
    </h2>
    <p class="p-temas" style="font-size:larger;">
        La división en subredes es otro método para administrar las direcciones IP. Este
        método, que consiste en dividir las clases de direcciones de red completas en partes
        de menor tamaño, ha evitado el completo agotamiento de las direcciones IP.
        <br>
        <br>
        Resulta imposible hablar sobre el TCP/IP sin mencionar la división en subredes.
        Como administrador de sistemas, es importante comprender que la división en subredes
        constituye un medio para dividir e identificar las redes individuales en toda la
        LAN. No siempre es necesario subdividir una red pequeña. Sin embargo, en el caso
        de redes grandes a muy grandes, la división en subredes es necesario.</p>
    <h2 class="centrado">
        <img src="IMAGES/Temas/T1_I2.gif" class="img-polaroid" />
    </h2>
    <p class="p-temas">
        Dividir una red en subredes significa utilizar una máscara de subred para dividir
        la red y convertir una gran red en segmentos más pequeños, más eficientes y administrables
        o subredes. Un ejemplo sería el sistema telefónico de los EE.UU. que se divide en
        códigos de área, códigos de intercambio y números locales.
        <br>
        <br>
        El administrador del sistema debe resolver estos problemas al agregar y expandir
        la red. Es importante saber cuántas subredes o redes son necesarias y cuántos hosts
        se requerirán en cada red. Con la división en subredes, la red no está limitada
        a las máscaras de red por defecto Clase A, B o C y se da una mayor flexibilidad
        en el diseño de la red.
        <br>
        <br>
        Las direcciones de subredes incluyen la porción de red más el campo de subred y
        el campo de host. El campo de subred y el campo de host se crean a partir de la
        porción de host original de la red entera. La capacidad para decidir cómo se divide
        la porción de host original en los nuevos campos de subred y de host ofrece flexibilidad
        en el direccionamiento al administrador de red.
        <br>
        <br>
        Para crear una dirección de subred, un administrador de red pide prestados bits
        del campo de host y los designa como campo de subred.</p>
    <h2 class="centrado">
        <img src="IMAGES/Temas/T1_I3.gif" class="img-polaroid" />
    </h2>
    <p class="p-temas">
        El número mínimo de bits que se puede pedir es dos. Al crear una subred, donde se
        solicita un sólo bit, el número de la red suele ser red .0. El número de broadcast
        entonces sería la red .255. El número máximo de bits que se puede pedir prestado
        puede ser cualquier número que deje por lo menos 2 bits restantes para el número
        de host.</p>
    <h2 class="centrado">
        <a href="#">
            <img src="IMAGES/Temas/next.png" width="128" height="128" alt="Siguiente" /></a>
    </h2>
    <script type="text/javascript">
        $('#temas').addClass('current_page_item');
    </script>
</asp:Content>