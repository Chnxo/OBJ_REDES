using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NextProject.DATOS
{
    public interface IRepository<T> where T : class
    {
        bool Agregar(T entity);

        bool Eliminar(T entity);

        bool Modificar(T entity);

        List<T> Todos();
    }
}