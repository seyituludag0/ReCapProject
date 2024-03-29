﻿using System;
using System.Collections.Generic;
using System.Text;
using Core.Entities;

namespace Entities.Dtos
{
    public class CarDetailDto:IDto
    {
        public int Id { get; set; }
        public int ColorId { get; set; }
        public int BrandId { get; set; }
        public string ModelName { get; set; }
        public string BrandName { get; set; }
        public string ColorName { get; set; }
        public int ModelYear { get; set; }
        public decimal DailyPrice { get; set; }
        public string Description { get; set; }
        public List<string> ImagePath { get; set; }
        public bool Status { get; set; }
        public int MinFindex { get; set; }
    }
}
