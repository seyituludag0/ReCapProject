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
                var result = from c in context.Cars.Where(c => c.Id == carId)
                    join co in context.Colors
                        on c.ColorId equals co.Id
                    join b in context.Brands
                        on c.BrandId equals b.Id
                    select new CarDetailDto
                    {
                        BrandName = b.Name,
                        ColorName = c.ColorName,
                        DailyPrice = c.DailyPrice,
                        Description = c.Description,
                        ModelYear = c.ModelYear,
                        Id = c.Id
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
                        Name = ca.ModelName,
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
