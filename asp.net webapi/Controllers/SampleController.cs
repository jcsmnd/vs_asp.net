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
        /*
        List<sampleModel> model01 = new List<sampleModel>();

        public SampleController()
        {
            model01.Add(new sampleModel {Id =1, FirstName="Myungsik", LastName="Kim", Comment="test"});
        }

        public List<sampleModel> GetAllProducts()
        {
            return model01;
        }

        public sampleModel Get(int id)
        {
            return model01.Where(x => x.Id == id).FirstOrDefault();
        }
        */

        sampleModel[] model01 = new sampleModel[]
 {
            new sampleModel { Id = 1, FirstName = "Myungsik", LastName = "Kim", Comment = "test" },
            new sampleModel { Id = 2, FirstName = "Hub", LastName = "Git", Comment = "test2"}
 };

        // GET api/sample
        public IEnumerable<sampleModel> Get()
        {
            return model01;
        }

        // GET api/sample/1
        public IHttpActionResult Get(int id)
        {
            var ID = model01.FirstOrDefault((p) => p.Id == id);
            if (ID == null)
            {
                return NotFound();
            }
            return Ok(ID);
        }

        // POST api/sample
        public void Post([FromBody]string value)
        {
        }

        // PUT api/sample/1
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/sample/1
        public void Delete(int id)
        {
        }
    }
}