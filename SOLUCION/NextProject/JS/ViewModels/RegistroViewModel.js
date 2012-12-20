$('#inicio').addClass('current_page_item');
var viewModelJS;
var viewModel;

$(function () {
    $.ajax({
        type: "POST",
        url: "Registro.aspx/CargarViewModel",
        data: {},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            viewModelJS = data.d;
            viewModel = ko.mapping.fromJS(viewModelJS);

            //Helpers
            //viewModel.Accion = ko.observable("Agregar Tipo de Estudio");
            //viewModel.Editando = ko.observable(false);
            //viewModel.Eliminando = ko.observable(false);
            //viewModel.modalMessage = ko.observable();
            //viewModel.alertMessage = ko.observable();
            //viewModel.alertSuccess = ko.observable(false);
            viewModel.Tipos = ko.observableArray(['Alumno', 'Maestro']);

            ko.applyBindings(viewModel);
        },
        error: function (error) {
            viewModel.modalMessage("No se pudo establecer conexión con el servidor.");
            $('#alertModal').modal('show');
        }
    });
});

var RegistrarUsuario = function () {
    var usuario = ko.mapping.toJS(viewModel.Usuario);
    $.ajax({
        type: "POST",
        url: "Registro.aspx/RegistrarUsuario",
        data: "{'usuarioJSON':'" + ko.mapping.toJSON(usuario) + "'}",
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
            debugger;
        },
        error: function (error) {
            debugger;
        }
    });
}