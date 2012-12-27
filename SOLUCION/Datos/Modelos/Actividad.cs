using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Datos.Modelos
{
    public class Actividad
    {
        private int id;
        private List<Pregunta> preguntas;
        private string tipo;

        public Actividad()
        {
        }

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public List<Pregunta> Preguntas
        {
            get { return preguntas; }
            set { preguntas = value; }
        }

        public string Tipo
        {
            get { return tipo; }
            set { tipo = value; }
        }
    }
}