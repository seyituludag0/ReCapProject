using System;
using System.Collections.Generic;
using System.Text;
using Business.Abstract;
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
    public class CustomerManager:ICustomerService
    {
        private ICustomerDal _customerDal;

        public CustomerManager(ICustomerDal customerDal)
        {
            _customerDal = customerDal;
        }

        [CacheAspect]
        public IDataResult<List<Customer>> GetAll()
        {
            List<Customer> customers = _customerDal.GetAll();
            if (customers==null)
            {
                return new ErrorDataResult<List<Customer>>(Messages.ErrorCustomerListed);
            }
            return new SuccessDataResult<List<Customer>>(customers, Messages.CustomerListed);
        }

        public IDataResult<List<CustomerDetailDto>> GetCustomerDetailsDto()
        {
            List<CustomerDetailDto> customers = _customerDal.GetCustomerDetails();
            if (customers==null)
            {
                return new ErrorDataResult<List<CustomerDetailDto>>();
            }
            return new SuccessDataResult<List<CustomerDetailDto>>(customers);
        }

        [CacheAspect]
        public IDataResult<Customer> Get(int id)
        {
            Customer customer = _customerDal.Get(c => c.Id == id);
            if (customer == null)
            {
                return new ErrorDataResult<Customer>(Messages.CustomerGet);
            }
            return new SuccessDataResult<Customer>(customer, Messages.CustomerGet);
        }

        public IDataResult<Customer> GetCustomerByUserId(int userId)
        {
            Customer customer = _customerDal.Get(c => c.UserId == userId);
            if (customer == null)
            {
                return new ErrorDataResult<Customer>(Messages.CustomerGetError);
            }
            return new SuccessDataResult<Customer>(customer, Messages.CustomerGet);
        }

       

        [ValidationAspect(typeof(CustomerValidator))]
        public IResult Add(Customer customer)
        {
            if (customer.CompanyName.Length<2)
            {
                return new ErrorResult(Messages.CustomerNameInvalid);
            }
            
            _customerDal.Add(customer);
            return new SuccessResult(Messages.CustomerAdded);
        }

        public IResult Update(Customer customer)
        {
            if (customer.CompanyName.Length < 2)
            {
                return new ErrorResult(Messages.CustomerNameInvalid);
            }
            _customerDal.Update(customer);
            return new SuccessResult(Messages.SuccessCustomerUpdated);
        }

        public IResult Delete(Customer customer)
        {
            _customerDal.Delete(customer);
            return new SuccessResult(Messages.SuccessCustomerDelete);
        }

       
    }
}
