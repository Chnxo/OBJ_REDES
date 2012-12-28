using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NextProject
{
    public partial class Registro : System.Web.UI.Page
    {
        [WebMethod]
        public static object CargarViewModel()
        {
            //return Negocio.Registro.Instancia().ViewModel();
            return Logica.Registro.GetViewModel();
        }

        [WebMethod]
        public static object RegistrarUsuario(string usuarioJSON)
        {
            //return Negocio.Registro.Instancia().RegistrarUsuario(usuarioJSON);
            return Logica.Registro.RegistrarUsuario(usuarioJSON);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}