$('#actividades').addClass('current_page_item');
var viewModelJS;
var viewModel;

$(function () {
    $.ajax({
        type: "POST",
        url: "CrearActividad.aspx/CargarViewModel",
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
            viewModel.TipoActividad = ko.observableArray(['Cuestionario', 'Ejercicio', 'Examen']);
            viewModel.TipoRespuesta = ko.observableArray(['Abierta', 'Falso/Verdadero', "Selección"]);
            viewModel.trSeleccionada = ko.observable();
            //viewModel.SeleccionRespuestas = ko.observableArray();
            viewModel.AgregandoPregunta = ko.observable(false);
            viewModel.ActividadLista = ko.observable(false);

            ko.applyBindings(viewModel);
        },
        error: function (error) {
            viewModel.modalMessage("No se pudo establecer conexión con el servidor.");
            $('#alertModal').modal('show');
        }
    });
});

var AgregarPregunta = function () {
    viewModel.AgregandoPregunta(true);
    //$(elem).hide().slideDown()
    viewModel.ActividadLista(false);
};

var GuardarPregunta = function () {
    viewModel.AgregandoPregunta(false);
    viewModel.ActividadLista(true);
};