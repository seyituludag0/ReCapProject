using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Business.Abstract;
using Business.Business;
using Business.Constants;
using Business.ValidationRules.FluentValidation;
using Core.Aspects.Autofac.Caching;
using Core.Aspects.Autofac.Validation;
using Core.Utilities.Results;
using DataAccess.Abstract;
using Entities.Concrete;
using Entities.Dtos;

namespace Business.Concrete
{
    public class RentalManager:IRentalService
    {
        private IRentalDal _rentalDal;

        public RentalManager(IRentalDal rentalDal)
        {
            _rentalDal = rentalDal;
        }

        [CacheAspect]
        public IDataResult<List<Rental>> GetAll()
        {
            List<Rental> rentals = _rentalDal.GetAll();
            if (rentals==null)
            {
                return new ErrorDataResult<List<Rental>>(Messages.GetAllRental);
            }
            return new SuccessDataResult<List<Rental>>(rentals, Messages.GetAllRental);
        }

        public IDataResult<List<RentalDetailDto>> GetRentalDetailsDto()
        {
            List<RentalDetailDto> rentalDetailDtos = _rentalDal.GetRentalDetails();
            if (rentalDetailDtos==null)
            {
                return new ErrorDataResult<List<RentalDetailDto>>(Messages.GetRentalDto);
            }
            return new SuccessDataResult<List<RentalDetailDto>>(rentalDetailDtos, Messages.GetRentalDto);
        }

        public IDataResult<Rental> GetRentalById(int rentalId)
        {
            Rental rental = _rentalDal.Get(r => r.Id == rentalId);
            if (rental==null)
            {
                return new ErrorDataResult<Rental>(Messages.GetRentalById);
            }
            return new SuccessDataResult<Rental>(rental, Messages.GetRentalById);
        }

        public IDataResult<List<Rental>> GetByCarId(int carId)
        {
            List<Rental> rentals = _rentalDal.GetAll(c=>c.CarId==carId);
            if (rentals==null)
            {
                return new ErrorDataResult<List<Rental>>(Messages.GetAllRental);
            }
            return new SuccessDataResult<List<Rental>>(rentals, Messages.GetAllRental);
        }

        [ValidationAspect(typeof(RentalValidator))]
        public IResult Add(Rental rental)
        {
            IResult result = BusinessRules.Run(CheckIfReturnDateNull(rental.CarId));
            _rentalDal.Add(rental);
            return new SuccessResult(Messages.RentalAdded);
        }

        public IResult Update(Rental rental)
        {
            _rentalDal.Update(rental);
            return new SuccessResult(Messages.RentalUpdate);
        }

        public IResult Delete(Rental rental)
        {
            _rentalDal.Delete(rental);
            return new SuccessResult(Messages.RentalDelete);
        }

        private IResult CheckIfReturnDateNull(int carId)
        {
            var result = _rentalDal.Get(r => r.CarId == carId && r.ReturnDate == null);
            if (result != null)
            {
                return new ErrorResult(Messages.RentalAddedError);
            }
            return new SuccessResult();
        }
    }
    
}
