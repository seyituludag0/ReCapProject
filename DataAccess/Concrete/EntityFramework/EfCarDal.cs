using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using Core.DataAccess.EntityFramework;
using DataAccess.Abstract;
using Entities.Concrete;
using Entities.Dtos;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query.SqlExpressions;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfCarDal : EfEntityRepositoryBase<Car, CarProjectContext>, ICarDal
    {
        //getcardetail
        public CarDetailDto GetCarDetail(int carId)
        {
            using (CarProjectContext context = new CarProjectContext())
            {
                var result = from car in context.Cars.Where(c => c.Id == carId)
                             join color in context.Colors on car.ColorId equals color.Id
                             join brand in context.Brands on car.BrandId equals brand.Id
                             select new CarDetailDto
                             {
                                 Id = car.Id,
                                 ModelName = car.ModelName,
                                 BrandId = car.BrandId,
                                 BrandName = brand.Name,
                                 ColorId = car.ColorId,
                                 ColorName = car.ColorName,
                                 ModelYear = car.ModelYear,
                                 DailyPrice = car.DailyPrice,
                                 Description = car.Description,
                                 MinFindex = car.MinFindex,
                                 ImagePath = (from ci in context.CarImages where ci.CarId == carId select ci.ImagePath).ToList(),
                                 Status = !(context.Rentals.Any(r => r.CarId == car.Id && (r.ReturnDate == null || r.ReturnDate > DateTime.Now))),

                             };
                return result.SingleOrDefault();
            }
        }

        public List<CarDetailDto> GetCarsDetail(Expression<Func<Car, bool>> filter = null)
        {
            using (CarProjectContext context = new CarProjectContext())
            {
                var result = from c in filter == null ? context.Cars : context.Cars.Where(filter)
                             join co in context.Colors on c.ColorId equals co.Id
                             join b in context.Brands on c.BrandId equals b.Id
                             select new CarDetailDto
                             {
                                 BrandName = b.Name,
                                 ColorName = co.Name,
                                 DailyPrice = c.DailyPrice,
                                 Description = c.Description,
                                 ModelYear = c.ModelYear,
                                 ModelName = c.ModelName,
                                 Id = c.Id,
                                 BrandId = b.Id,
                                 ColorId = co.Id,
                                 MinFindex = c.MinFindex,
                                 ImagePath = (from ci in context.CarImages where ci.CarId == c.Id select ci.ImagePath).ToList()
                             };
                return result.ToList();
            }
        }

    }
}
