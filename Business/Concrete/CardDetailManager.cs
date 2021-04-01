using System;
using System.Collections.Generic;
using System.Text;
using Business.Abstract;
using Business.Constants;
using Core.Utilities.Results;
using DataAccess.Abstract;
using Entities.Concrete;

namespace Business.Concrete
{
    public class CardDetailManager:ICardDetailService
    {
        private ICardDetailDal _cardDetailDal;

        public CardDetailManager(ICardDetailDal cardDetailDal)
        {
            _cardDetailDal = cardDetailDal;
        }

        public IResult Add(CardDetail cardDetail)
        {
            _cardDetailDal.Add(cardDetail);
            return new SuccessResult(Messages.CardAdded);
        }

        public IResult Delete(CardDetail cardDetail)
        {
            _cardDetailDal.Delete(cardDetail);
            return new SuccessResult(Messages.CardDelete);
        }

        public IDataResult<List<CardDetail>> GetCardsByUserId(int userId)
        {
            return new SuccessDataResult<List<CardDetail>>(_cardDetailDal.GetAll(c=>c.UserId==userId));
        }
    }
}
