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

namespace DataAccess.Concrete.EntityFramework
{
    public class EfCarDal:EfEntityRepositoryBase<Car,CarProjectContext>,ICarDal
    {
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
                    };
                return result.SingleOrDefault();
            }
        }

        public List<CarDetailDto> GetCarsDetail()
        {
            using (CarProjectContext context = new CarProjectContext())
            {
                var result = from ca in context.Cars
                    join b in context.Brands
                        on ca.BrandId equals b.Id
                    join co in context.Colors
                        on ca.ColorId equals co.Id
                    select new CarDetailDto
                    {
                        Id = ca.Id,
                        BrandId = b.Id,
                        ColorId = co.Id,
                        ModelName = ca.ModelName,
                        BrandName = b.Name,
                        ColorName = co.Name,
                        ModelYear = ca.ModelYear,
                        DailyPrice = ca.DailyPrice,
                        Description = ca.Description
                    };
                return result.ToList();
            }
        }
    }
}
