using System;
using System.Collections.Generic;
using System.Text;
using Core.Entities.Concrete;
using Core.Utilities.Results;
using Entities.Concrete;

namespace Business.Abstract
{
    public interface IUserService
    {
        IResult Add(User user);
        IResult Delete(User user);
        IResult Update(User user);
        IDataResult<List<User>> GetAll();
        IDataResult<User> GetById(int id);
        List<OperationClaim> GetClaims(User user);
        IDataResult<User> GetByMail(string email);
        IResult UpdateInfo(User user);
        IDataResult<User> GetUserFindexByUserId(int userId);
        IResult UpdateUserFindex(int userId);
    }
}
