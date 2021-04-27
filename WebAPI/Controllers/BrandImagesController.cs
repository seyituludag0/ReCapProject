using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Business.Abstract;
using Entities.Concrete;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BrandImagesController : ControllerBase
    {
        private IBrandImageService _brandImageService;

        public BrandImagesController(IBrandImageService brandImageService)
        {
            _brandImageService = brandImageService;
        }



        [HttpGet("getall")]
        public IActionResult GetAll()
        {
            var result = _brandImageService.GetAll();
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result);
        }

        [HttpGet("getimagesbybrandid")]
        public IActionResult GetImagesById(int brandId)
        {
            var result = _brandImageService.GetImagesByBrandId(brandId);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result);
        }


        [HttpGet("getbyid")]
        public IActionResult Get(int id)
        {
            var result = _brandImageService.Get(id);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result);
        }

        [HttpPost("add")]
        public IActionResult Add([FromForm(Name = ("Image"))] IFormFile file, [FromForm] BrandImage brandImage)
        {
            var result = _brandImageService.Add(file, brandImage);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result);
        }

        [HttpPost("update")]
        public IActionResult Update([FromForm] BrandImage carImage, [FromForm(Name = ("Image"))] IFormFile file)
        {
            var result = _brandImageService.Update(file, carImage);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result);
        }

        [HttpPost("delete")]
        public IActionResult Delete([FromForm(Name = ("Id"))] int id)
        {

            var carImage = _brandImageService.Get(id).Data;

            var result = _brandImageService.Delete(carImage);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result);
        }

    }
}
