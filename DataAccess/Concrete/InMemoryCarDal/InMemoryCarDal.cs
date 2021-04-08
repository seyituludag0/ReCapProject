using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using DataAccess.Abstract;
using Entities.Concrete;
using Entities.Dtos;

namespace DataAccess.Concrete.InMemoryCarDal
{
    //public class InMemoryCarDal
    public class InMemoryCarDal : ICarDal
    {
        List<Car> _cars;

        public InMemoryCarDal()
        {
            _cars = new List<Car>
            {
                new Car{Id = 1, BrandId = 1, ModelName = "Renault", ColorId = 1, ColorName = "Siyah", ModelYear = 2000, Description = "Renault By Car", DailyPrice = 2000},
                new Car{Id = 2, BrandId = 2, ModelName = "Pegeout", ColorId = 2, ColorName = "Gri", ModelYear = 2019, Description = "Pegeout By Car", DailyPrice = 3500},
                new Car{Id = 3, BrandId = 3, ModelName = "BMW i20", ColorId = 3, ColorName = "Mavi", ModelYear =2020, Description = "BMW By Car", DailyPrice = 4500},
                new Car{Id = 4, BrandId = 3, ModelName = "BMW X6", ColorId = 1, ColorName = "Siyah", ModelYear = 2018, Description = "BMW By Car", DailyPrice = 4000},
                new Car{Id = 5, BrandId = 4, ModelName = "Wolksvagen", ColorId = 1, ColorName = "Beyaz", ModelYear = 2014, Description = "Wolksvagen By Car", DailyPrice = 2500},
            };
        }

        public List<Car> GetAllCars()
        {
            Console.WriteLine("Sistemde Kayıtlı Olan Araçlar");
            foreach (var car in _cars)
            {
                Console.WriteLine("ID:" + car.Id + " Car Name: " + car.ModelName + " -- Kira Bedeli: " + car.DailyPrice + " -- Renk: " + car.ColorName);
            }

            return _cars;
        }

        public Car Get(int id)
        {
            return _cars.FirstOrDefault(c => c.Id == id);
        }


        public List<Car> GetAll(Expression<Func<Car, bool>> filter = null)
        {
            return _cars;
        }

        public Car Get(Expression<Func<Car, bool>> filter)
        {
            throw new NotImplementedException();
        }

        public void Add(Car car)
        {
            //Console.WriteLine("\n" + "Sisteme yeni eklenen araçlar" + "\n" + "Car Name: " + car.ModelName);

            _cars.Add(car);


        }

        public void Update(Car car)
        {
            var updateToCar = _cars.FirstOrDefault(c => c.Id == car.Id);
            if (updateToCar != null)
            {
                updateToCar.ModelName = car.ModelName;
                updateToCar.DailyPrice = car.DailyPrice;
                updateToCar.Description = car.Description;
                updateToCar.ColorId = car.ColorId;
                updateToCar.ColorName = car.ColorName;
                //updateToCar.ModelYear = car.ModelYear;
            }
            Console.WriteLine("\n" + "Güncellenen Araçlar " + "\n" + "Id:" + car.Id + " Car Name: " + car.ModelName + "");
        }

        public void Delete(Car car)
        {
            var deletedToCar = _cars.FirstOrDefault(c => c.Id == car.Id);
            _cars.Remove(deletedToCar);
            Console.WriteLine("Araç Silindi");
        }

        public List<CarDetailDto> GetCarsDetail()
        {
            throw new NotImplementedException();
        }

        public List<CarDetailDto> GetCarsDetail(Expression<Func<Car, bool>> filter = null)
        {
            throw new NotImplementedException();
        }

        public List<CarDetailDto> GetCarsDetail(Expression<Func<CarDetailDto, bool>> filter = null)
        {
            throw new NotImplementedException();
        }

        public CarDetailDto GetCarDetail(int carId)
        {
            throw new NotImplementedException();
        }
    }
}
