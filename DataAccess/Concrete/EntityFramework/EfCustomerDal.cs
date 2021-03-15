using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Core.DataAccess.EntityFramework;
using DataAccess.Abstract;
using Entities.Concrete;
using Entities.Dtos;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfCustomerDal : EfEntityRepositoryBase<Customer, CarProjectContext>, ICustomerDal
    {
        public List<CustomerDetailDto> GetCustomerDetails()
        {
            using (CarProjectContext context = new CarProjectContext())
            {
                var result = from c in context.Customers
                    join u in context.Users on c.UserId equals u.Id
                    select new CustomerDetailDto
                    {
                        Id = c.Id,
                        FirstName = u.FirstName,
                        LastName = u.LastName,
                        Email = u.Email,
                        Status = u.Status
                    };
                return result.ToList();
            }
        }
    }
}
