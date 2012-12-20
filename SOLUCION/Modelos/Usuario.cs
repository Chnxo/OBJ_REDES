using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NextProject.MODELS
{
    public class Usuario
    {
        private string apellido;
        private string correo;
        private DateTime fechaNacimiento;
        private int id;
        private string nombre;
        private string password;

        public Usuario()
        {
        }

        public string Apellido
        {
            get { return apellido; }
            set { apellido = value; }
        }

        public string Correo
        {
            get { return correo; }
            set { correo = value; }
        }

        public DateTime FechaNacimiento
        {
            get { return fechaNacimiento; }
            set { fechaNacimiento = value; }
        }

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public string Password
        {
            get { return password; }
            set { password = value; }
        }
    }
}