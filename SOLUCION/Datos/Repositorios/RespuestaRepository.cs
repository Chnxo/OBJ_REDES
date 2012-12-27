using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Datos.Modelos;
using NextProject.DATOS;
using IMSS_RMN.Datos;

namespace Datos.Repositorios
{
    public class RespuestaRepository : IRepository<Respuesta>
    {
        private static RespuestaRepository resRepo = new RespuestaRepository();

        private RespuestaRepository() { }

        public static RespuestaRepository Instancia()
        {
            return resRepo;
        }

        #region CRUD

        public bool Agregar(Respuesta entity)
        {
            try
            {
                object[] respuesta = new object[2];
                respuesta[0] = entity.Respuesta1;
                respuesta[1] = entity.Fk_Pregunta;

                SqlHelper.ExecuteNonQuery(SqlHelper.connString, "agr_respuesta", respuesta);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool Eliminar(Respuesta entity)
        {
            throw new NotImplementedException();
        }

        public bool Modificar(Respuesta entity)
        {
            throw new NotImplementedException();
        }

        public List<Respuesta> Todos()
        {
            throw new NotImplementedException();
        }

        #endregion CRUD


        public int Agregar_RegresandoPK(Respuesta entity)
        {
            throw new NotImplementedException();
        }
    }
}