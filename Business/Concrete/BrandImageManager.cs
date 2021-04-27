using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using Business.Abstract;
using Business.Business;
using Business.Constants;
using Core.Utilities.Helpers;
using Core.Utilities.Results;
using DataAccess.Abstract;
using Entities.Concrete;
using Microsoft.AspNetCore.Http;

namespace Business.Concrete
{
    public class BrandImageManager:IBrandImageService
    {
        private IBrandImageDal _brandImageDal;

        public BrandImageManager(IBrandImageDal brandImageDal)
        {
            _brandImageDal = brandImageDal;
        }

        public IDataResult<BrandImage> Get(int id)
        {
            return new SuccessDataResult<BrandImage>(_brandImageDal.Get(p => p.Id == id));
        }

        public IDataResult<List<BrandImage>> GetAll()
        {
            return new SuccessDataResult<List<BrandImage>>(_brandImageDal.GetAll(), Messages.BrandImageListed);
        }

        public IDataResult<List<BrandImage>> GetImagesByBrandId(int brandId)
        {
            return new SuccessDataResult<List<BrandImage>>(CheckIfBrandImageNull(brandId));
        }


        //File
        public IResult Add(IFormFile file, BrandImage brandImage)
        {
            IResult result = BusinessRules.Run(CheckImageLimitExceeded(brandImage.BrandId));
            if (result != null)
            {
                return result;
            }
            brandImage.ImagePath = FileHelper.Add(file);
            brandImage.Date = DateTime.Now;
            _brandImageDal.Add(brandImage);
            return new SuccessResult();
        }

        public IResult Delete(BrandImage brandImage)
        {
            IResult result = BusinessRules.Run(BrandImageDelete(brandImage));
            if (result != null)
            {
                return result;
            }
            _brandImageDal.Delete(brandImage);
            return new SuccessResult();
        }

        public IResult Update(IFormFile file, BrandImage brandImage)
        {
            IResult result = BusinessRules.Run(CheckImageLimitExceeded(brandImage.BrandId));
            if (result != null)
            {
                return result;
            }
            brandImage.Date = DateTime.Now;
            string oldPath = Get(brandImage.Id).Data.ImagePath;
            brandImage.ImagePath = FileHelper.Update(oldPath, file);
            return new SuccessResult(Messages.BrandImageUpdated);
        }

        private IResult CheckImageLimitExceeded(int brandId)
        {
            var brandImagecount = _brandImageDal.GetAll(p => p.BrandId == brandId).Count;
            if (brandImagecount >= 5)
            {
                return new ErrorResult(Messages.ImageLimitError);
            }

            return new SuccessResult();
        }
        private List<BrandImage> CheckIfBrandImageNull(int id)
        {
            string path = @"wwwroot\uploads\brandImages\defaultimage.png";
            var result = _brandImageDal.GetAll(c => c.BrandId == id).Any();
            if (!result)
            {
                return new List<BrandImage> { new BrandImage { BrandId = id, ImagePath = path, Date = DateTime.Now } };
            }
            return _brandImageDal.GetAll(p => p.BrandId == id);
        }
        private IResult BrandImageDelete(BrandImage brandImage)
        {
            try
            {
                File.Delete(brandImage.ImagePath);
            }
            catch (Exception exception)
            {

                return new ErrorResult(exception.Message);
            }

            return new SuccessResult();
        }
    }
}
