using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Datos.Modelos;
using IMSS_RMN.Datos;
using NextProject.DATOS;

namespace Datos.Repositorios
{
    public class UsuariosDAO : IRepository<Usuario>
    {
        private static UsuariosDAO udao = new UsuariosDAO();

        private UsuariosDAO()
        {
        }

        public static UsuariosDAO Instancia()
        {
            return udao;
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
            catch (Exception)
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

        #endregion CRUD
    }
}