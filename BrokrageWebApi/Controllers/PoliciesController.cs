using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using BrokrageWebApi.EF;
using BrokrageWebApi.Models;

namespace BrokrageWebApi.Controllers
{
    public class PoliciesController : ApiController
    {
        private BrokerageDBContext db = new BrokerageDBContext();

        // GET: api/Policies
        public IHttpActionResult GetPolicies()
        {
            var result = (from p in db.Policies
                          select new PolicyModel {
                              CustommerId = p.CustommerId.HasValue ? p.CustommerId.Value : -1,
                              CustommerName = p.Customer.Name,
                              ClientId = p.ClientId.HasValue ? p.ClientId.Value : -1,
                              ClientName = p.Client.Name,
                              InsurerId = p.InsurerId.HasValue ? p.InsurerId.Value : -1,
                              InsurerName = p.Insurer.Name,
                              PolicyId = p.PolicyId,
                              PolicyTypeId = p.PolicyTypeId.HasValue ? p.PolicyTypeId.Value : -1,
                              PolicyType = p.PolicyType.Title,
                              StatusId = p.StatusId.HasValue ? p.StatusId.Value : -1,
                              Status = p.Status.Title,
                              Premium = p.Premium.HasValue ? p.Premium.Value : -1,

                          }).ToList();
            return Ok(result);
        }

        // POST: api/Policies
        [HttpPost]
        public IHttpActionResult SearchPolicies(SearchModel searchModel)
        {
            var result = (from p in db.Policies
                          select new PolicyModel
                          {
                              CustommerId = p.CustommerId.HasValue ? p.CustommerId.Value : -1,
                              CustommerName = p.Customer.Name,
                              ClientId = p.ClientId.HasValue ? p.ClientId.Value : -1,
                              ClientName = p.Client.Name,
                              InsurerId = p.InsurerId.HasValue ? p.InsurerId.Value : -1,
                              InsurerName = p.Insurer.Name,
                              PolicyId = p.PolicyId,
                              PolicyTypeId = p.PolicyTypeId.HasValue ? p.PolicyTypeId.Value : -1,
                              PolicyType = p.PolicyType.Title,
                              StatusId = p.StatusId.HasValue ? p.StatusId.Value : -1,
                              Status = p.Status.Title,
                              Premium = p.Premium.HasValue ? p.Premium.Value : -1,

                          });//.ToList();

            switch (searchModel.SearchBy.ToLower())
            {
                case "customerName":
                    result = result.Where(x => x.CustommerName.Contains(searchModel.SearchString));
                    break;
                case "clientName":
                    result = result.Where(x => x.ClientName.Contains(searchModel.SearchString));
                    break;
                case "InsurerName":
                    result = result.Where(x => x.InsurerName.Contains(searchModel.SearchString));
                    break;
                case "policyType":
                    result = result.Where(x => x.PolicyType.Contains(searchModel.SearchString));
                    break;
                case "statusTitle":
                    result = result.Where(x => x.Status.Contains(searchModel.SearchString));
                    break;
                case "premium":
                    result = result.Where(x => x.Premium.ToString() == searchModel.SearchString);
                    break;
            }
            if (searchModel.SortOrder)
            {
                switch (searchModel.SortBy.ToLower())
                {
                    case "customerName":
                        result = result.OrderBy(x => x.CustommerName);
                        break;
                    case "clientName":
                        result = result.OrderBy(x => x.ClientName);
                        break;
                    case "InsurerName":
                        result = result.OrderBy(x => x.InsurerName);
                        break;
                    case "policyType":
                        result = result.OrderBy(x => x.PolicyType);
                        break;
                    case "statusTitle":
                        result = result.OrderBy(x => x.Status);
                        break;
                    case "premium":
                        result = result.OrderBy(x => x.Premium);
                        break;
                }
            }
            else
            {
                switch (searchModel.SortBy.ToLower())
                {
                    case "customerName":
                        result = result.OrderByDescending(x => x.CustommerName);
                        break;
                    case "clientName":
                        result = result.OrderByDescending(x => x.ClientName);
                        break;
                    case "InsurerName":
                        result = result.OrderByDescending(x => x.InsurerName);
                        break;
                    case "policyType":
                        result = result.OrderByDescending(x => x.PolicyType);
                        break;
                    case "statusTitle":
                        result = result.OrderByDescending(x => x.Status);
                        break;
                    case "premium":
                        result = result.OrderByDescending(x => x.Premium);
                        break;
                }

            }

            var total = result.Count();
            if (total > 0)
            {
                var pages = (int)Math.Ceiling((double)total / searchModel.PageSize);
                pages = pages == 0 ? 1 : pages;
                var skip = searchModel.PageSize * (searchModel.PageNumber - 1);

                var result_1 = result.Skip(skip).Take(searchModel.PageSize);
                if (skip > total)
                    skip = total;
                SearchResultModel searchResult = new SearchResultModel {
                    PageCount = pages,
                    TotalRecordCount = total,
                    Policies = result_1.ToList(),
                };
                return Ok(searchResult);
            }
            return Ok(new SearchResultModel());
        }



        // GET: api/Policies/5
        [ResponseType(typeof(Policy))]
        public IHttpActionResult GetPolicy(int id)
        {
            Policy policy = db.Policies.Find(id);
            if (policy == null)
            {
                return NotFound();
            }

            return Ok(policy);
        }

        // PUT: api/Policies/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutPolicy(int id, Policy policy)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != policy.PolicyId)
            {
                return BadRequest();
            }

            db.Entry(policy).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PolicyExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Policies
        [ResponseType(typeof(Policy))]
        public IHttpActionResult PostPolicy(Policy policy)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Policies.Add(policy);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = policy.PolicyId }, policy);
        }

        // DELETE: api/Policies/5
        [ResponseType(typeof(Policy))]
        public IHttpActionResult DeletePolicy(int id)
        {
            Policy policy = db.Policies.Find(id);
            if (policy == null)
            {
                return NotFound();
            }

            db.Policies.Remove(policy);
            db.SaveChanges();

            return Ok(policy);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool PolicyExists(int id)
        {
            return db.Policies.Count(e => e.PolicyId == id) > 0;
        }
    }
}