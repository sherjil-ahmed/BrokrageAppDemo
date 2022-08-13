using BrokrageWebApi.EF;
using BrokrageWebApi.Models;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BrokrageWebApi.Controllers
{
    public class StatusController : ApiController
    {
        private BrokerageDBContext db = new BrokerageDBContext();

        [HttpGet]
        public IHttpActionResult Index()
        {
            //var s = db.Status.Select(x => new StatusModel { StatusId = s.StatusId, Title = s.Title, Description = s.Description }).ToList();
            var result = (from s in db.Status select new StatusModel { StatusId = s.StatusId, Title = s.Title, Description = s.Description }).ToList();
            return Ok(result);
        }
    }
}
