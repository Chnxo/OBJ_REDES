using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Datos.Modelos;
using NextProject.DATOS;
using IMSS_RMN.Datos;

namespace Datos.Repositorios
{
    public class UsuarioRepository : IRepository<Usuario>
    {
        private static UsuarioRepository usuRepo = new UsuarioRepository();

        private UsuarioRepository()
        {

        }

        public static UsuarioRepository Instancia()
        {
            return usuRepo;
        }

        #region CRUD

        public bool Agregar(Usuario entity)
        {
            try
            {
                object[] usuario = new object[6];
                usuario[0] = entity.Nombre;
                usuario[1] = entity.Apellido;
                usuario[2] = entity.Correo;
                usuario[3] = entity.FechaNacimiento;
                usuario[4] = entity.Password;
                usuario[5] = entity.Tipo;

                SqlHelper.ExecuteNonQuery(SqlHelper.connString, "agr_usuario", usuario);

                return true;
            }
            catch 
            {
                return false;
            }
        }

        public bool Eliminar(Usuario entity)
        {
            throw new NotImplementedException();
        }

        public bool Modificar(Usuario entity)
        {
            throw new NotImplementedException();
        }

        public List<Usuario> Todos()
        {
            throw new NotImplementedException();
        }

        #endregion


        public int Agregar_RegresandoPK(Usuario entity)
        {
            throw new NotImplementedException();
        }
    }
}