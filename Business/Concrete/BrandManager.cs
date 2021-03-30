using System;
using System.Collections.Generic;
using System.Text;
using Business.Abstract;
using Business.BusinessAspects;
using Business.Constants;
using Business.ValidationRules.FluentValidation;
using Core.Aspects.Autofac.Caching;
using Core.Aspects.Autofac.Validation;
using Core.Utilities.Results;
using DataAccess.Abstract;
using Entities.Concrete;

namespace Business.Concrete
{
    public class BrandManager : IBrandService
    {
        private IBrandDal _brandDal;

        public BrandManager(IBrandDal brandDal)
        {
            _brandDal = brandDal;
        }

        [SecuredOperation("admin, add")]
        [ValidationAspect(typeof(BrandValidator))]
        public IResult Add(Brand brand)
        {
            _brandDal.Add(brand);
            return new SuccessResult(Messages.BrandAdded);
        }

        [SecuredOperation("admin, update")]
        public IResult Delete(Brand brand)
        {
            _brandDal.Delete(brand);
            return new SuccessResult(Messages.BrandDeleted);
        }

        [CacheAspect]
        public IDataResult<List<Brand>> GetAll()
        {
            List<Brand> brands = _brandDal.GetAll();
            if (brands==null)
            {
                return new ErrorDataResult<List<Brand>>(Messages.GetBrandByIdMessage);
            }
            return new SuccessDataResult<List<Brand>>(brands, Messages.GetBrandByIdMessage);

        }

        [CacheAspect]
        public IDataResult<Brand> GetBrandById(int brandId)
        {
            Brand brand = _brandDal.Get(b => b.Id == brandId);
            if (brand==null)
            {
                return new ErrorDataResult<Brand>(Messages.GetBrandMessage);
            }
            return new SuccessDataResult<Brand>(brand, Messages.GetBrandMessage);
        }

        [SecuredOperation("admin, update")]
        [ValidationAspect(typeof(BrandValidator))]
        public IResult Update(Brand brand)
        {
            if (brand.Name.Length < 2)
            {
                return new ErrorResult(Messages.BrandUpdatedError);
            }
            _brandDal.Update(brand);
            return new SuccessResult(Messages.BrandUpdated);
        }
    }
}
