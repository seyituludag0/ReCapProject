using System;
using System.Collections.Generic;
using System.Text;
using Core.Utilities.Results;
using Entities.Concrete;
using Entities.Dtos;

namespace Business.Abstract
{
    public interface ICarService
    {
        IDataResult<List<Car>> GetAll();
        IDataResult<Car> GetCarById(int id);
        IDataResult<List<Car>> GetCarsByBrandId(int brandId);
        IDataResult<List<Car>> GetCarsByColorId(int colorId);
        IDataResult<List<CarDetailDto>> GetCarDetailByColorId(int colorId);
        IDataResult<List<CarDetailDto>> GetCarDetailByBrandId(int brandId);
        IDataResult<List<CarDetailDto>> GetCarsByBrandAndColor(int brandId, int colorId);
        IDataResult<List<Car>> GetUnitPrice(decimal min, decimal max);
        IDataResult<List<CarDetailDto>> GetCarsDetail();
        IDataResult<CarDetailDto> GetCarDetail(int carId);
        
        IDataResult<Car> Add(Car car);
        IResult Update(Car car);
        IResult Delete(Car car);
        IResult AddTransactionalTest(Car car);
        IDataResult<Car> GetCarMinFindex(int carId);
    }
}
