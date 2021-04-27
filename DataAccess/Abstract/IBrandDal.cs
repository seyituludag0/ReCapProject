using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using Core.DataAccess;
using Entities.Concrete;
using Entities.DTOs;

namespace DataAccess.Abstract
{
    public interface IBrandDal:IEntityRepository<Brand>
    {
        List<BrandDetailDto> GetBrandsDetail(Expression<Func<BrandDetailDto, bool>> filter = null);
    }
}

