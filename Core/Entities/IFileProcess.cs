using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Core.Utilities.Results;
using Microsoft.AspNetCore.Http;

namespace Core.Entities
{
    public interface IFileProcess
    {
        Task<IResult> Upload(string fileName, IFormFile formFile);
        IResult Delete(string path);
    }
}