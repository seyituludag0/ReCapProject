using System;
using System.Collections.Generic;
using System.Text;
using Entities.Concrete;
using FluentValidation;

namespace Business.ValidationRules.FluentValidation
{
    public class CarValidator:AbstractValidator<Car>
    {
        public CarValidator()
        {
            RuleFor(c => c.ModelName).NotEmpty();
            RuleFor(c => c.ModelName).MinimumLength(5);
            RuleFor(c => c.DailyPrice).NotEmpty();
            RuleFor(c => c.DailyPrice).GreaterThan(0);
            RuleFor(c => c.ColorName).MinimumLength(3);
            RuleFor(c => c.Description).MinimumLength(5);
            RuleFor(c => c.Description).NotEmpty();
            RuleFor(c => c.ColorId).NotEmpty();
            RuleFor(c => c.BrandId).NotEmpty();
            //RuleFor(c => c.ModelName).Must(StartWithA).WithMessage("Model ismi 'A' ile başlamalıdır");
        }

        //private bool StartWithA(string arg)
        //{
        //    return arg.StartsWith("A");
        //}
    }
}
