﻿using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using Core.DataAccess;
using Entities.Dtos;

namespace DataAccess.Abstract
{
    public interface ICarDal:IEntityRepository<Car>
    {
        List<CarDetailDto> GetCarsDetail(Expression<Func<CarDetailDto, bool>> filter = null);
        CarDetailDto GetCarDetail(int carId);
    }
}
