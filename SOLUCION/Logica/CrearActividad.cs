using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DatosLINQ;
using DatosLINQ.Repositorios;
using Logica.ViewModels;
using Newtonsoft.Json;

namespace Logica
{
    public class CrearActividad
    {
        public static object AgregarActividad(string actividadJSON)
        {
            using (var dataContext = new OBJ_REDDataContext())
            {
                var actRepo = new Repository<Actividade>(dataContext);
                Actividade actividad = JsonConvert.DeserializeObject<Actividade>(actividadJSON);
                try
                {
                    actRepo.Insert(actividad);
                    dataContext.SubmitChanges();
                    return (new
                    {
                        valido = true,
                        mensaje = "Actividad guardada correctamente."
                    });
                }
                catch (Exception)
                {
                    return (new
                    {
                        valido = false,
                        mensaje = "Hubo un error al internar guardar la actividad."
                    });
                }
            }
        }

        public static CrearActividadViewModel GetViewModel()
        {
            return new CrearActividadViewModel();
        }
    }
}