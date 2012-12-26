using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Configuration;
using System.Net.Mail;
using System.Text;
using Datos.Modelos;
using Datos.Repositorios;
using Datos.ViewModels;
using Negocio.Helpers;
using Newtonsoft.Json;
using NextProject.DATOS;

namespace Negocio
{
    public class Registro
    {
        private static Registro registro = new Registro();

        private Registro()
        {
        }

        public static Registro Instancia()
        {
            return registro;
        }

        public object RegistrarUsuario(string usuarioJSON)
        {
            Usuario usuario = JsonConvert.DeserializeObject<Usuario>(usuarioJSON);
            usuario.Password = GenerarPassword();

            if (UsuarioRepository.Instancia().Agregar(usuario))
            {
                try
                {
                    Correo.EnviarCorreo(Tipo.NuevoUsuario, usuario);
                    return (new
                    {
                        valido = true,
                        mensaje = "Registro exitoso, la contraseña ha sido enviada a su correo."
                    });
                }
                catch (Exception)
                {
                }
            }

            return (new
            {
                valido = false,
                mensaje = "Error al registrar usuario."
            });
        }

        public RegistroViewModel ViewModel()
        {
            return new RegistroViewModel();
        }

        private string GenerarPassword()
        {
            string allowedChars = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ0123456789!@$?_-";
            char[] chars = new char[8];
            Random rd = new Random();

            for (int i = 0; i < 8; i++)
            {
                chars[i] = allowedChars[rd.Next(0, allowedChars.Length)];
            }

            return new string(chars);
        }
    }
}