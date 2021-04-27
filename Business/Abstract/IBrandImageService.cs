using System;
using System.Collections.Generic;
using System.Text;
using Core.Utilities.Results;
using Entities.Concrete;
using Microsoft.AspNetCore.Http;

namespace Business.Abstract
{
    public interface IBrandImageService
    {
        IResult Add(IFormFile file, BrandImage brandImage);
        IResult Delete(BrandImage brandImage);
        IResult Update(IFormFile file, BrandImage brandImage);
        IDataResult<BrandImage> Get(int id);
        IDataResult<List<BrandImage>> GetAll();
        IDataResult<List<BrandImage>> GetImagesByBrandId(int brandId);
    }
}
