using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace NextProject
{
    public partial class Registro : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static object CargarViewModel()
        {
            return Negocio.Registro.Instancia().ViewModel();
        }

        [WebMethod]
        public static object RegistrarUsuario(string usuarioJSON)
        {
            return Negocio.Registro.Instancia().RegistrarUsuario(usuarioJSON);
        }
    }
}