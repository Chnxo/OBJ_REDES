using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Text;

namespace DatosLINQ.Repositorios
{
    public class Repository<T> : IRepository<T> where T : class, IEntity
    {
        protected Table<T> DataTable;

        public Repository(DataContext dataContext)
        {
            DataTable = dataContext.GetTable<T>();
        }

        #region IRepository<T> Members

        public void Delete(T entity)
        {
            DataTable.DeleteOnSubmit(entity);
        }

        public IQueryable<T> GetAll()
        {
            return DataTable;
        }

        public T GetById(int id)
        {
            return DataTable.Single(e => e.ID.Equals(id));
        }

        public void Insert(T entity)
        {
            DataTable.InsertOnSubmit(entity);
        }

        public IQueryable<T> SearchFor(System.Linq.Expressions.Expression<Func<T, bool>> predicate)
        {
            return DataTable.Where(predicate);
        }

        #endregion IRepository<T> Members
    }
}