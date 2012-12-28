<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="Registro.aspx.cs" Inherits="NextProject.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="centrado">
        Registro</h1>
        <hr class="hr-centrado"/>
    <div class="form-horizontal">
        <div class="span6 offset3">
            <h2>
                <label class="control-label">
                    Nombre</label>
                <div class="controls">
                    <input type="text" data-bind="value: Usuario.Nombre"/>
                </div>
            </h2>
            <h2>
                <label class="control-label">
                    Apellido</label>
                <div class="controls">
                    <input type="text" data-bind="value: Usuario.Apellido"/>
                </div>
            </h2>
            <h2>
                <label class="control-label">
                    Correo</label>
                <div class="controls">
                    <input type="text" data-bind="value: Usuario.Correo"/>
                </div>
            </h2>
            <h2>
                <label class="control-label">
                    Fecha de Nacimiento</label>
                <div class="controls">
                    <input type="text" data-bind="value: Usuario.Fecha_Nacimiento"/>
                </div>
            </h2>
            <h2>
                <label class="control-label">
                    Tipo</label>
                <div class="controls">
                    <select data-bind="options: Tipos, value: Usuario.Tipo, optionsCaption: 'Selecciona un Tipo...'">
                    </select>
                </div>
            </h2>
            <h2>
                <div class="controls">
                    <button class="btn btn-custom" data-bind="click: RegistrarUsuario">Registro</button>
                </div>
            </h2>
        </div>
    </div>
    <script src="JS/ViewModels/RegistroViewModel.js" type="text/javascript"></script>
</asp:Content>