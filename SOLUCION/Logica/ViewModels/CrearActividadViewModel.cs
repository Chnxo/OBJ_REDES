using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DatosLINQ;

namespace Logica.ViewModels
{
    public class CrearActividadViewModel
    {
        public CrearActividadViewModel()
        {
            Actividad = new Actividade();
        }
        public Actividade Actividad { get; set; }
    }
}
