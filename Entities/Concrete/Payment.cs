﻿using System;
using System.Collections.Generic;
using System.Text;
using Core.Entities;

namespace Entities.Concrete
{
    public class Payment : IEntity
    {
        public int Id { get; set; }
        public string CardNumber { get; set; }
        public int CVV { get; set; }
        public string ExpirationDate { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }
}
