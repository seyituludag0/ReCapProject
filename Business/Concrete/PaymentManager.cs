﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Business.Abstract;
using Business.Constants;
using Business.ValidationRules.FluentValidation;
using Core.Aspects.Autofac.Validation;
using Core.Utilities.Results;
using DataAccess.Abstract;
using Entities.Concrete;

namespace Business.Concrete
{
    public class PaymentManager : IPaymentService
    {
        IPaymentDal _paymentDal;

        public PaymentManager(IPaymentDal paymentDal)
        {
            _paymentDal = paymentDal;
        }

        public IResult Add(Payment payment)
        {
            _paymentDal.Add(payment);
            return new SuccessResult("SuccessfullyPaid");
        }

        public IResult CheckPayment(Payment payment)
        {
            var paymentToCheck = _paymentDal.GetAll(p => p.CardNumber == payment.CardNumber ||
                                                         p.CVV == payment.CVV ||
                                                         p.ExpirationDate == payment.ExpirationDate).Any();
            if (paymentToCheck)
            {
                return new SuccessResult(Messages.PaymentSuccessfull);
            }
            else
            {
                return new ErrorResult(Messages.PaymentError);
            }
        }
    }
}