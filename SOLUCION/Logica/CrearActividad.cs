using System;
using System.Collections.Generic;
using System.Data.Linq;
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
        public static object AgregarActividad(string actividadJSON, string preguntasJSON, string respuestasJSON)
        {
            Actividade actividad = JsonConvert.DeserializeObject<Actividade>(actividadJSON);
            List<Pregunta> preguntas = JsonConvert.DeserializeObject<List<Pregunta>>(preguntasJSON);
            List<Respuesta> respuestas = JsonConvert.DeserializeObject<List<Respuesta>>(respuestasJSON);

            foreach (Pregunta p in preguntas)
            {
                foreach (Respuesta r in respuestas)
                {
                    if (p.ID == r.FK_Pregunta)
                    {
                        p.Respuestas.Add(r);
                    }
                }
            }

            //Converting List to EntitySet
            var preguntasEntitySet = new EntitySet<Pregunta>();
            preguntasEntitySet.AddRange(preguntas);

            actividad.Preguntas = preguntasEntitySet;

            using (var dataContext = new OBJ_REDDataContext())
            {
                var actRepo = new Repository<Actividade>(dataContext);
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