using System;
using System.Collections.Generic;
using System.Text;
using Core.Utilities.Results;
using Entities.Concrete;

namespace Business.Abstract
{
    public interface ICardDetailService
    {
        IResult Add(CardDetail cardDetail);
        IDataResult<List<CardDetail>> GetCardsByUserId(int userId);
    }
}
