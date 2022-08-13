using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BrokrageWebApi.Models
{
    public class StatusModel
    {
        public int StatusId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }

    }
}