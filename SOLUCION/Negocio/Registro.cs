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
using Newtonsoft.Json;

namespace Negocio
{
    public enum Tipo
    {
        NuevoUsuario, Recuperacion
    }

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
            if (UsuariosDAO.Instancia().Agregar(usuario))
            {
                if (EnviarCorreo(Tipo.NuevoUsuario, usuario))
                {
                    return (new
                    {
                        valido = true,
                        mensaje = "Registro exitoso, la contraseña ha sido enviada a su correo."
                    });
                }
                else
                {
                    UsuariosDAO.Instancia().Eliminar(usuario);
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

        private bool EnviarCorreo(Tipo tipo, Usuario usu)
        {
            var from = "t4v0.astral@gmail.com";
            var to = usu.Correo;
            const string password = "8MQ6pjp4d";
            string subject = string.Empty;
            string body = string.Empty;

            switch (tipo)
            {
                case Tipo.NuevoUsuario:
                    subject = "Registro";
                    body = "Bienvenido " + usu.Nombre + " " + usu.Apellido + "<br/>";
                    body += "Su contraseña es: " + usu.Password + "<br/><br/>";
                    body += "Objeto de Aprendizaje Redes";
                    break;

                case Tipo.Recuperacion:
                    break;

                default:
                    break;
            }

            var smtp = new SmtpClient();
            {
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential(from, password);
                smtp.Timeout = 20000;
            }

            try
            {
                smtp.Send(from, to, subject, body);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
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