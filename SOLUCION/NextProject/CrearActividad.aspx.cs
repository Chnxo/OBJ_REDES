using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NextProject
{
    public partial class CrearActividad : System.Web.UI.Page
    {
        [WebMethod]
        public static object CargarViewModel()
        {
            //return Negocio.CrearActividad.Instancia().ViewModel();
            return Logica.CrearActividad.GetViewModel();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}