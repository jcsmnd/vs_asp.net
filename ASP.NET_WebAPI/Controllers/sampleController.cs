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
    public class sampleController : ApiController
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

        // GET api/values
        public IEnumerable<string> Get()
        {
            return new string[] { "returnString01", "returnString02" };
        }

        // GET api/values/5
        public string Get(int id)
        {
            return "return value";
        }

        // POST api/values
        public void Post([FromBody]string value)
        {

        }

        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {

        }

        // DELETE api/values/5
        public void Delete(int id)
        {

        }
    }
}
