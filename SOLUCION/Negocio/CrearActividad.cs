using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Datos.Modelos;
using Datos.Repositorios;
using Newtonsoft.Json;
using NextProject.DATOS;

namespace Negocio
{
    public class CrearActividad
    {
        private static CrearActividad crearActividad = new CrearActividad();

        private CrearActividad() { }

        public static CrearActividad Instancia()
        {
            return crearActividad;
        }

        public object AgregarActividad(string actividadJSON)
        {
            Actividad actividad = JsonConvert.DeserializeObject<Actividad>(actividadJSON);
            actividad.Id = ActividadRepository.Instancia().Agregar_RegresandoPK(actividad);
            if (actividad.Id > 0)
            {
                foreach (Pregunta p in actividad.Preguntas)
                {
                    p.Fk_Actividad = actividad.Id;
                    p.Id = PreguntaRepository.Instancia().Agregar_RegresandoPK(p);
                    if (p.Id > 0)
                    {
                        foreach (Respuesta r in p.Respuestas)
                        {
                            r.Fk_Pregunta = p.Id;
                            RespuestaRepository.Instancia().Agregar(r);
                        }
                    }
                }

                return (new
                {
                    valido = true,
                    mensaje = "Actividad agregada exitosamente."
                });
            }

            return (new
            {
                valido = false,
                mensaje = "Error al agregar actividad"
            });
        }

        public Actividad ViewModel()
        {
            return new Actividad();
        }
    }
}