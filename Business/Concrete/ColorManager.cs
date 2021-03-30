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
using Core.Aspects.Autofac.Validation;
using Core.Utilities.Results;
using DataAccess.Abstract;
using Entities.Concrete;

namespace Business.Concrete
{
    public class ColorManager:IColorService
    {
        private IColorDal _colorDal;

        public ColorManager(IColorDal colorDal)
        {
            _colorDal = colorDal;
        }

        [SecuredOperation("admin, add")]
        [ValidationAspect(typeof(ColorValidator))]
        public IResult Add(Color color)
        {
            IResult result = BusinessRules.Run(CheckIfColorNameExists(color.Name));
            if (result != null)
            {
                return result;
            }
            _colorDal.Add(color);
            return new SuccessResult(Messages.ColorAdded);
        }

        [SecuredOperation("admin, delete")]
        public IResult Delete(Color color)
        {
            _colorDal.Delete(color);
            return new SuccessResult(Messages.ColorDeleted);
        }

        [CacheAspect]
        public IDataResult<List<Color>> GetAll()
        {
            List<Color> colors = _colorDal.GetAll();
            if (colors==null)
            {
                return new ErrorDataResult<List<Color>>(Messages.ColorListed);
            }
            return new SuccessDataResult<List<Color>>(colors, Messages.ColorListed);
        }

        [CacheAspect]
        public IDataResult<Color> GetColorById(int id)
        {
            Color color = _colorDal.Get(c => c.Id == id);
            if (color==null)
            {
                return new ErrorDataResult<Color>(Messages.GetColorByIdMessage);
            }
            return new SuccessDataResult<Color>(_colorDal.Get(b => b.Id == id), Messages.GetColorByIdMessage);
        }

        [SecuredOperation("admin, update")]
        public IResult Update(Color color)
        {
            if (color.Name.Length < 2)
            {
                return new ErrorResult(Messages.ColorUpdatedError);
            }
            _colorDal.Update(color);
            return new SuccessResult(Messages.ColorUpdated);
        }

        private IResult CheckIfColorNameExists(string colorName)
        {
            var result = _colorDal.GetAll(p => p.Name == colorName).Any();
            if (result)
            {
                return new ErrorResult(Messages.ColorNameAlreadyExists);
            }
            return new SuccessResult();
        }

    }
}
