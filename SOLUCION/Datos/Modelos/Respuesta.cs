using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Datos.Modelos
{
    public class Respuesta
    {
        private int fk_Pregunta;
        private int id;
        private string respuesta;

        public Respuesta()
        {
        }

        public int Fk_Pregunta
        {
            get { return fk_Pregunta; }
            set { fk_Pregunta = value; }
        }

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public string Respuesta1
        {
            get { return respuesta; }
            set { respuesta = value; }
        }
    }
}