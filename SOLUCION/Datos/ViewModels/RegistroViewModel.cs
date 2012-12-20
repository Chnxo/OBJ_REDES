using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Datos.Modelos;

namespace Datos.ViewModels
{
    public class RegistroViewModel
    {
        public RegistroViewModel()
        {
            Usuario = new Usuario();
        }
        public Usuario Usuario { set; get; }
    }
}
