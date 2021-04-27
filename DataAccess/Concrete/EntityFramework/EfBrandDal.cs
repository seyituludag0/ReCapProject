using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using Core.DataAccess.EntityFramework;
using DataAccess.Abstract;
using Entities.Concrete;
using Entities.DTOs;
using Microsoft.EntityFrameworkCore;

namespace DataAccess.Concrete.EntityFramework
{
    public class EfBrandDal : EfEntityRepositoryBase<Brand, CarProjectContext>, IBrandDal
    {
        public List<BrandDetailDto> GetBrandsDetail(Expression<Func<BrandDetailDto, bool>> filter = null)
        {
            using (CarProjectContext context = new CarProjectContext())
            {
                var result = from b in context.Brands
                    join bi in context.BrandImages on b.Id equals bi.BrandId
                    select new BrandDetailDto
                    {
                        Id = b.Id,
                        Name = b.Name,
                        ImagePath = bi.ImagePath,
                        Date = bi.Date
                    };
                return filter == null ? result.ToList() : result.Where(filter).ToList();
            }
        }
    }
}
