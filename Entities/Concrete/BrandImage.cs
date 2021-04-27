using System;
using System.Collections.Generic;
using System.Text;
using Core.Entities;

namespace Entities.Concrete
{
    public class BrandImage:IEntity
    {
        public int Id { get; set; }
        public int BrandId { get; set; }
        public string ImagePath { get; set; }
        public DateTime Date { get; set; }
    }
}
