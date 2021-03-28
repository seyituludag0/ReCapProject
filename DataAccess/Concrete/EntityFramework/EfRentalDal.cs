using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using Core.DataAccess.EntityFramework;
using DataAccess.Abstract;
using Entities.Concrete;
using Entities.Dtos;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfRentalDal:EfEntityRepositoryBase<Rental,CarProjectContext>,IRentalDal
    {
        public List<RentalDetailDto> GetRentalDetails(Expression<Func<Rental, bool>> filter = null)
        {
            using (CarProjectContext context = new CarProjectContext())
            {
                var result = from rental in context.Rentals
                    join ca in context.Cars on rental.CarId equals ca.Id
                    join co in context.Colors on ca.ColorId equals co.Id
                    join br in context.Brands on ca.BrandId equals br.Id
                    join cu in context.Customers on rental.CustomerId equals cu.Id
                    join us in context.Users on cu.UserId equals us.Id
                    select new RentalDetailDto
                    {
                       Id = rental.Id,
                       BrandName = br.Name,
                       CarName = ca.ModelName,
                       ModelYear = ca.ModelYear,
                        DailyPrice = ca.DailyPrice,
                        Description = ca.Description,
                       ColorName = co.Name,
                       CompanyName = cu.CompanyName,
                       FirstName = us.FirstName,
                       LastName = us.LastName,
                       RentDate = rental.RentDate,
                       ReturnDate = rental.ReturnDate,
                       
                    };
                return result.ToList();
            }
        }
    }
}
