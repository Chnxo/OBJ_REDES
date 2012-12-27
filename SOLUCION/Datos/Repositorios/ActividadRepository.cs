using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Datos.Modelos;
using NextProject.DATOS;
using IMSS_RMN.Datos;

namespace Datos.Repositorios
{
    public class ActividadRepository : IRepository<Actividad>
    {
        private static ActividadRepository actRepo = new ActividadRepository();

        private ActividadRepository() { }

        public static ActividadRepository Instancia()
        {
            return actRepo;
        }

        #region CRUD

        public bool Agregar(Actividad entity)
        {
            try
            {
                object actividad = new object();
                actividad = entity.Tipo;

                SqlHelper.ExecuteNonQuery(SqlHelper.connString, "agr_actividad", actividad);

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public int Agregar_RegresandoPK(Actividad entity)
        {
            try
            {
                object actividad = new object();
                actividad = entity.Tipo;

                return Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.connString, "agr_actividad", actividad));
            }
            catch (Exception)
            {
                return -1;
            }
            
        }

        public bool Eliminar(Actividad entity)
        {
            throw new NotImplementedException();
        }

        public bool Modificar(Actividad entity)
        {
            throw new NotImplementedException();
        }

        public List<Actividad> Todos()
        {
            throw new NotImplementedException();
        }

        #endregion CRUD





        
    }
}