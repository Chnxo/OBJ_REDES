using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using Datos.Modelos;

namespace Negocio.Helpers
{
    public enum Tipo
    {
        NuevoUsuario, Recuperacion
    }

    public class Correo
    {
        public static void EnviarCorreo(Tipo tipo, Usuario usu)
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
                    body = "Bienvenido " + usu.Nombre + " " + usu.Apellido + "\n";
                    body += "Su contraseña es: " + usu.Password + "\n\n";
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

            smtp.Send(from, to, subject, body);
        }
    }
}