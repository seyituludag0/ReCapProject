using System;
using System.Collections.Generic;
using System.Text;
using Core.Entities;

namespace Entities.Concrete
{
    public class CardDetail:IEntity
    {
        //public int Id { get; set; }
        //public int UserId { get; set; }
        //public string CardOwner { get; set; }
        //public int CVV { get; set; }
        //public string ExpirationDate { get; set; }


        public int Id { get; set; }
        public int UserId { get; set; }
        public int CVV { get; set; }
        public string ExpirationDate { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string CardNumber { get; set; }
    } 
}
