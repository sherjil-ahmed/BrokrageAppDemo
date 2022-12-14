//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BrokrageWebApi.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class Client
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Client()
        {
            this.Policies = new HashSet<Policy>();
        }
    
        public int ClientId { get; set; }
        public string Name { get; set; }
        public Nullable<int> BrokerageId { get; set; }
        public byte[] Description { get; set; }
        public Nullable<int> StatusId { get; set; }
    
        public virtual Brokerage Brokerage { get; set; }
        public virtual Status Status { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Policy> Policies { get; set; }
    }
}
