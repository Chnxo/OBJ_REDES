using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Datos.Modelos
{
    public class Pregunta
    {
        private int fk_Actividad;
        private int id;
        private string reactivo;
        private List<Respuesta> respuestas;

        public Pregunta()
        {
        }

        public int Fk_Actividad
        {
            get { return fk_Actividad; }
            set { fk_Actividad = value; }
        }

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public string Reactivo
        {
            get { return reactivo; }
            set { reactivo = value; }
        }

        public List<Respuesta> Respuestas
        {
            get { return respuestas; }
            set { respuestas = value; }
        }
    }
}