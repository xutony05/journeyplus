using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MentalHealth3
{
    public class FirebaseData
    {
        public string Name { get; set; }
        public string Value { get; set; }

        public FirebaseData(string Name, string Value)
        {
            this.Name = Name;
            this.Value = Value;
        }
    }
}