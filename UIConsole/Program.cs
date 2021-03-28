
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading.Channels;
using Business.Abstract;
using Business.Concrete;
using Core.Entities.Concrete;
using DataAccess.Concrete.EntityFramework;
using DataAccess.Concrete.InMemoryCarDal;
using Entities.Concrete;

namespace UIConsole
{
    class Program
    {
        static void Main(string[] args)
        {
            //CarTest();
            //BrandTest();
            //ColorTest();
            //CustomerTest();
            //UserTest();

            IRentalService rentalService = new RentalManager(new EfRentalDal());
            rentalService.Add(new Rental
            {
               CarId = 2,
               CustomerId = 1,
               RentDate = new DateTime(2021,8,8),
               ReturnDate = new DateTime(2021, 9, 8)
            });

            Console.ReadLine();
        }

        //private static void UserTest()
        //{
        //    IUserService userService = new UserManager(new EfUserDal());
        //    userService.Delete(new User
        //    {
        //        Id = 1,
        //        //FirstName = "Seyit",
        //        //LastName = "ULudağ",
        //        //Email = "seyituludag0@gmail.com",
        //        //Password = "123321asd"
        //    });
        //}
        private static void CustomerTest()
        {
            ICustomerService customerService = new CustomerManager(new EfCustomerDal());
            customerService.Add(new Customer
            {
                CompanyName = "Seyitt"
            });
        }
        private static void CarTest()
        {
            ICarService carService = new CarManager(new EfCarDal());

            var result = carService.GetAll();
            if (result.Success == true)
            {
                foreach (var car in result.Data)
                {
                    Console.WriteLine("Araba Adı: " + car.ModelName);
                }
            }

            else
            {
                Console.WriteLine(result.Message);
            }
        }
        private static void BrandTest()
        {
            IBrandService brandService = new BrandManager(new EfBrandDal());

            //brandService.Delete(new Brand {Id = 7});

            //foreach (var brand in brandService.GetAll())
            //{
            //    Console.WriteLine("Brand Id: " + brand.Id + " Brand Name: " + brand.Name);
            //}

            //var myCar = brandService.GetBrandById(7);
            //Console.WriteLine(myCar.Name);
        }
        private static void ColorTest()
        {
            IColorService colorService = new ColorManager(new EfColorDal());

            //colorService.Add(new Color{Name = "Gray"});

            //colorService.Delete(new Color { Id = 1003 });

            colorService.Update(new Color { Id = 1002, Name = "Gri" });


            //foreach (var color in colorService.GetAll())
            //{
            //    Console.WriteLine("Color Id: " + color.Id + " Color Name: " + color.Name);
            //}

            //var myColor = colorService.GetColorById(7);
            //Console.WriteLine(myColor.Name);
        }

    }
}
