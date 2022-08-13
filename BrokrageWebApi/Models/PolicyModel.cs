using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BrokrageWebApi.Models
{
    public class PolicyModel
    {
        public int PolicyId { get; set; }
        public int CustommerId { get; set; }

        public int InsurerId { get; set; }
        public int PolicyTypeId { get; set; }
        
        public int StatusId { get; set; }
        public int ClientId { get; set; }
        public string CustommerName { get; set; }

        public string InsurerName { get; set; }
        public string PolicyType { get; set; }
        public double Premium { get; set; }
        public string Status { get; set; }
        public string ClientName { get; set; }
    }

    public class SearchModel {
        public int PageNumber { get; set; }
        public int PageSize { get; set; }
        public string SortBy { get; set; }
        public bool SortOrder { get; set; }
        public string SearchBy { get; set; }
        public string SearchString { get; set; }
    }

    public class SearchResultModel
    {
        public int PageCount { get; set; }
        public int TotalRecordCount { get; set; }
        public List<PolicyModel> Policies { get; set; }
    }
}