using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Business.Abstract;
using Business.Business;
using Business.BusinessAspects;
using Business.Constants;
using Business.ValidationRules.FluentValidation;
using Core.Aspects.Autofac.Caching;
using Core.Aspects.Autofac.Transaction;
using Core.Aspects.Autofac.Validation;
using Core.CrossCuttingConcerns.Validation;
using Core.Utilities.Results;
using DataAccess.Abstract;
using Entities.Concrete;
using Entities.Dtos;
using FluentValidation;

namespace Business.Concrete
{
    public class CarManager : ICarService
    {
        ICarDal _carDal;

        public CarManager(ICarDal carDal)
        {
            _carDal = carDal;
        }

        //[CacheAspect]
        [CacheRemoveAspect("ICarService.Get")]
        public IDataResult<List<Car>> GetAll()
        {
            if (DateTime.Now.Hour == 07)
            {
                return new ErrorDataResult<List<Car>>(Messages.ErrorCarListed);
            }

            return new SuccessDataResult<List<Car>>(_carDal.GetAll(), Messages.CarListed);
        }

        [CacheAspect]
        public IDataResult<Car> GetCarById(int id)
        {
            Car car = _carDal.Get(c => c.Id == id);
            if (car == null)
            {
                return new ErrorDataResult<Car>(Messages.GetErrorCarMessage);
            }
            return new SuccessDataResult<Car>(car, Messages.CarGet);

        }

        public IDataResult<List<Car>> GetCarsByBrandId(int brandId)
        {
            List<Car> cars = _carDal.GetAll(c => c.BrandId == brandId);
            if (cars == null)
            {
                return new ErrorDataResult<List<Car>>(Messages.GetErrorCarMessage);
            }
            return new SuccessDataResult<List<Car>>(cars, Messages.GetCarsByBrandIdMessage);

        }

        public IDataResult<List<Car>> GetCarsByColorId(int colorId)
        {
            List<Car> cars = _carDal.GetAll(c => c.ColorId == colorId);
            if (cars == null)
            {
                return new ErrorDataResult<List<Car>>(Messages.GetErrorCarMessage);
            }
            return new SuccessDataResult<List<Car>>(cars, Messages.GetCarsByColorIdMessage);
        }

        public IDataResult<List<CarDetailDto>> GetCarsDetail()
        {
            List<CarDetailDto> carDetails = _carDal.GetCarsDetail();
            if (carDetails == null)
            {
                return new ErrorDataResult<List<CarDetailDto>>(Messages.GetErrorCarMessage);
            }
            return new SuccessDataResult<List<CarDetailDto>>(carDetails, Messages.GetCarsDetailMessage);
        }


        public IDataResult<List<CarDetailDto>> GetCarsByBrandAndColor(int brandId, int colorId)
        {
            List<CarDetailDto> carDetails = _carDal.GetCarsDetail(c => c.BrandId == brandId && c.ColorId == colorId);
            if (carDetails == null)
            {
                return new ErrorDataResult<List<CarDetailDto>>((Messages.GetErrorCarMessage));
            }
            else
            {
                return new SuccessDataResult<List<CarDetailDto>>(carDetails, Messages.GetErrorCarMessage);
            }
        }


        [SecuredOperation("admin")]
        [ValidationAspect(typeof(CarValidator))]
        [CacheRemoveAspect("ICarService.Get")]
        public IDataResult<Car> Add(Car car)
        {
            _carDal.Add(car);
            return new SuccessDataResult<Car>(car,Messages.CarAdded);
        }

        [SecuredOperation("admin,update")]
        [CacheRemoveAspect("ICarService.Get")]
        public IResult Update(Car car)
        {
            if (car.DailyPrice > 0)
            {
                _carDal.Update(car);
                return new SuccessResult(Messages.SuccessCarUpdated);
            }
            _carDal.Update(car);
            return new SuccessResult(Messages.DailyPriceInvalid);
        }

        [SecuredOperation("admin,delete")]
        [CacheRemoveAspect("ICarService.Get")]
        public IResult Delete(Car car)
        {
            _carDal.Delete(car);
            return new SuccessResult(Messages.SuccessCarDelete);
        }

        public IDataResult<List<Car>> GetUnitPrice(decimal min, decimal max)
        {
            return new SuccessDataResult<List<Car>>(_carDal.GetAll(c => c.DailyPrice >= min && c.DailyPrice <= max), Messages.GetUnitPriceMessage);
        }

        [TransactionScopeAspect]
        public IResult AddTransactionalTest(Car car)
        {
            Add(car);
            if (car.DailyPrice < 10)
            {
                throw new Exception("");
            }
            Add(car);
            return null;
        }

        private IResult CheckIfCarNameExists(string name)
        {
            var result = _carDal.GetAll(c => c.ModelName == name).Any();
            if (result)
            {
                return new ErrorResult(Messages.CarNameAlreadyExists);
            }
            return new SuccessResult();
        }

        public IDataResult<CarDetailDto> GetCarDetail(int carId)
        {
            return new SuccessDataResult<CarDetailDto>(_carDal.GetCarDetail(carId), Messages.GetCarDetailMessage);
        }
        public IDataResult<List<CarDetailDto>> GetCarDetailByBrandId(int brandId)
        {
            return new SuccessDataResult<List<CarDetailDto>>(_carDal.GetCarsDetail(c=>c.BrandId==brandId));
        }
        public IDataResult<List<CarDetailDto>> GetCarDetailByColorId(int colorId)
        {
            return new SuccessDataResult<List<CarDetailDto>>(_carDal.GetCarsDetail(c => c.ColorId == colorId));
        }

        public IDataResult<Car> GetCarMinFindex(int carId)
        {
            return new SuccessDataResult<Car>(_carDal.Get(c=>c.Id==carId));
        }
    }
}
