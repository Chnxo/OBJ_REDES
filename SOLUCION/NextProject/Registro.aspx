<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="Registro.aspx.cs" Inherits="NextProject.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="centrado">
        Registro</h1>
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
                    <input type="text" data-bind="value: Usuario.FechaNacimiento"/>
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
                    <input class="btn" data-bind="click: RegistrarUsuario" value="Registro"/>                        
                </div>
            </h2>
        </div>
    </div>
    <script src="JS/ViewModels/RegistroViewModel.js" type="text/javascript"></script>
</asp:Content>