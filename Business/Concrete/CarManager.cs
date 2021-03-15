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

        [CacheAspect]
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
            return new DataResult<Car>(_carDal.Get(c => c.Id == id), true, Messages.CarGet);
        }

        public IDataResult<List<Car>> GetCarsByBrandId(int brandId)
        {
            return new SuccessDataResult<List<Car>>(_carDal.GetAll(b => b.BrandId == brandId), Messages.GetCarsByBrandIdMessage);
        }

        public IDataResult<List<Car>> GetCarsByColorId(int colorId)
        {
            return new SuccessDataResult<List<Car>>(_carDal.GetAll(c => c.ColorId == colorId));
        }

        public IDataResult<List<CarDetailDto>> GetCarsDetail()
        {
            return new SuccessDataResult<List<CarDetailDto>>(_carDal.GetCarsDetail(), Messages.GetCarsDetailMessage);
        }

        [SecuredOperation("admin,car.add")]
        [ValidationAspect(typeof(CarValidator))]
        [CacheRemoveAspect("ICarService.Get")]
        public IResult Add(Car car)
        {
            IResult result = BusinessRules.Run(CheckIfCarNameExists(car.ModelName));
            if (result!=null)
            {
                return result;
            }
            _carDal.Add(car);
            return new SuccessResult(Messages.CarAdded);
        }

        [SecuredOperation("admin,car.update")]
        [CacheRemoveAspect("ICarService.Get")]
        public IResult Update(Car car)
        {
            if (car.ModelName.Length > 2)
            {
                if (car.DailyPrice > 0)
                {
                    _carDal.Update(car);
                    return new SuccessResult(Messages.SuccessCarUpdated);
                }
                else return new ErrorResult("Geçersiz ücret");
            }
            else return new ErrorResult("Gereksinimleri karşılamadınız");
        }

        [SecuredOperation("admin,car.delete")]
        [CacheRemoveAspect("ICarService.Get")]
        public IResult Delete(Car car)
        {
            _carDal.Delete(car);
            return new SuccessResult(Messages.SuccessCarDelete);
        }

        public IDataResult<List<Car>> GetUnitPrice(decimal min, decimal max)
        {
            //return _carDal.GetAll(c=>c.DailyPrice<=min && c.DailyPrice>=max);
            return new SuccessDataResult<List<Car>>(_carDal.GetAll(c => c.DailyPrice >= min && c.DailyPrice <= max), Messages.GetUnitPriceMessage);
        }

        [TransactionScopeAspect]
        public IResult AddTransactionalTest(Car car)
        {
            Add(car);
            if (car.DailyPrice<10)
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
    }
}
