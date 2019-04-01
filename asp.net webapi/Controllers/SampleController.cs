//Written by Myungsik Kim
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using asp.net_webapi.Models;

namespace asp.net_webapi.Controllers
{
    public class SampleController : ApiController
    {
        sampleModel[] model01 = new sampleModel[] {
            new sampleModel { Id = 1, FirstName = "Myungsik", LastName = "Kim", Comment = "test controller" }
        };

        public IEnumerable<sampleModel> GetAllProducts()
        {
            return model01;
        }

        public IHttpActionResult GetProduct(int id)
        {
            var ID = model01.FirstOrDefault((p) => p.Id == id);
            if (ID == null)
            {
                return NotFound();
            }
            return Ok(ID);
        }
    }
}
