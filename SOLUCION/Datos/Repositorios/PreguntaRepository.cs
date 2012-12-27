using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Datos.Modelos;
using NextProject.DATOS;
using IMSS_RMN.Datos;

namespace Datos.Repositorios
{
    public class PreguntaRepository : IRepository<Pregunta>
    {
        private static PreguntaRepository preRepo = new PreguntaRepository();

        private PreguntaRepository() { }

        public static PreguntaRepository Instancia()
        {
            return preRepo;
        }

        #region CRUD

        public bool Agregar(Pregunta entity)
        {
            try
            {
                object[] pregunta = new object[2];
                pregunta[0] = entity.Reactivo;
                pregunta[1] = entity.Fk_Actividad;

                SqlHelper.ExecuteNonQuery(SqlHelper.connString, "agr_pregunta", pregunta);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool Eliminar(Pregunta entity)
        {
            throw new NotImplementedException();
        }

        public bool Modificar(Pregunta entity)
        {
            throw new NotImplementedException();
        }

        public List<Pregunta> Todos()
        {
            throw new NotImplementedException();
        }

        #endregion CRUD


        public int Agregar_RegresandoPK(Pregunta entity)
        {
            try
            {
                object[] pregunta = new object[2];
                pregunta[0] = entity.Reactivo;
                pregunta[1] = entity.Fk_Actividad;

                return Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.connString, "agr_pregunta", pregunta));
            }
            catch (Exception)
            {
                return -1;
            }
        }
    }
}