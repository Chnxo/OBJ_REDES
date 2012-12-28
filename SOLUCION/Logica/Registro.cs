using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DatosLINQ;
using DatosLINQ.Repositorios;
using Logica.Helpers;
using Logica.ViewModels;
using Newtonsoft.Json;

namespace Logica
{
    public class Registro
    {
        public static RegistroViewModel GetViewModel()
        {
            return new RegistroViewModel();
        }

        public static object RegistrarUsuario(string usuarioJSON)
        {
            using (var dataContext = new OBJ_REDDataContext())
            {
                var usuRepo = new Repository<Usuario>(dataContext);
                Usuario usuario = JsonConvert.DeserializeObject<Usuario>(usuarioJSON);
                usuario.Password = GenerarPassword();
                try
                {
                    usuRepo.Insert(usuario);
                    dataContext.SubmitChanges();
                    Correo.EnviarCorreo(Tipo.NuevoUsuario, usuario);
                    return (new
                    {
                        valido = true,
                        mensaje = "Usuario correctamente registrado. La contraseña fue enviada a tu correo."
                    });
                }
                catch (Exception)
                {
                    return (new
                    {
                        valido = false,
                        mensaje = "Hubo un error al intentar registrar tu usuario."
                    });
                }
            }
        }

        private static string GenerarPassword()
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