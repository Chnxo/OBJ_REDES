﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="CrearActividad.aspx.cs" Inherits="NextProject.CrearActividad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="centrado">
        Nueva Actividad</h1>
    <hr class="hr-centrado" />
    <div class="form-horizontal">
        <div class="offset3">
            <h2>
                <label class="control-label">
                    Nombre</label>
                <div class="controls">
                    <input type="text" />
                </div>
            </h2>
            <h2>
                <label class="control-label">
                    Tipo Actividad</label>
                <div class="controls">
                    <select data-bind="options: TipoActividad, optionsCaption: 'Selecciona un Tipo...'">
                    </select>
                </div>
            </h2>
        </div>
        <table class="table table-striped table-bordered centrado" style="width: 95%; margin-left: auto;
            margin-right: auto;">
            <thead>
                <tr>
                    <td colspan="3">
                        <strong>Reactivos</strong>
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style="width: 5%;">
                        1
                    </td>
                    <td style="width: 88%;">
                        text...
                    </td>
                    <td>
                        <i class="icon-edit"></i><i class="icon-remove"></i>
                    </td>
                </tr>
                <tr>
                    <td>
                        2
                    </td>
                    <td>
                        text...
                    </td>
                    <td>
                        <i class="icon-edit"></i><i class="icon-remove"></i>
                    </td>
                </tr>
                <tr>
                    <td>
                        3
                    </td>
                    <td>
                        text...
                    </td>
                    <td>
                        <i class="icon-edit"></i><i class="icon-remove"></i>
                    </td>
                </tr>
            </tbody>
        </table>
        <h2 class="centrado">
            <!-- ko if: !AgregandoPregunta() -->
            <button class="btn" data-bind="click: AgregarPregunta">
                <i class="icon-plus"></i>&nbsp;Agregar Pregunta</button>
            <!-- /ko -->
            <button class="btn btn-custom" data-bind="enable: ActividadLista">
                <i class="icon-ok-sign"></i>&nbsp;Guardar Actividad</button></h2>
    </div>
    <!-- ko if: AgregandoPregunta -->
    <div class="form-inline">
        <div class="offset3">
            <h2>
                <label class="control-label">
                    Pregunta</label>
                <div class="controls">
                    <textarea rows="3" class="input-xxlarge"></textarea>
                </div>
            </h2>
        </div>
        <div class="form-horizontal">
            <div class="offset3">
                <h2>
                    <label class="control-label">
                        Tipo Respuesta</label>
                    <div class="controls">
                        <select data-bind="options: TipoRespuesta, selectedOptions: trSeleccionada, optionsCaption: 'Selecciona un Tipo...'">
                        </select>
                    </div>
                </h2>
            </div>
        </div>
        <!-- ko if: trSeleccionada() == 'Abierta' -->
        <div class="form-inline">
            <div class="offset3">
                <h2>
                    <label class="control-label">
                        Respuesta</label>
                    <div class="controls">
                        <textarea rows="3" class="input-xxlarge"></textarea>
                    </div>
                </h2>
            </div>
        </div>
        <!-- /ko -->
        <!-- ko if: trSeleccionada() == 'Falso/Verdadero' -->
        <div class="form-inline">
            <h2>
                <p style="font-size: large;" class="centrado">
                    Verdadero
                    <input type="radio" name="respuesta" value="true" />
                    Falso
                    <input type="radio" name="respuesta" value="false" /></p>
            </h2>
        </div>
        <!-- /ko -->
        <!-- ko if: trSeleccionada() == 'Selección' -->
        <div class="form-inline">
            <div class="offset3">
                <h2>
                    <label class="control-label">
                        Respuesta | ¿Es correcta?
                        <input type="checkbox" value="true" />
                    </label>
                    <div class="controls">
                        <textarea rows="1" class="input-xxlarge"></textarea>
                    </div>
                </h2>
            </div>
            <h2 class="centrado">
                <button class="btn">
                    <i class="icon-plus"></i>&nbsp;Agregar Respuesta</button>
            </h2>
        </div>
        <!-- /ko -->
        <h2 class="centrado">
            <button class="btn btn-custom" data-bind="click: GuardarPregunta">
                <i class="icon-ok-sign"></i>&nbsp;Guardar Pregunta</button></h2>
    </div>
    <!-- /ko -->
    <script src="JS/ViewModels/CrearActividadViewModel.js" type="text/javascript"></script>
</asp:Content>