using System;
using System.Collections.Generic;

namespace ISSZnidar.Web.Models
{
    public partial class Predmet
    {
        public Predmet()
        {
            Termin = new HashSet<Termin>();
        }

        public int PredmetId { get; set; }
        public string Naziv { get; set; }

        public virtual ICollection<Termin> Termin { get; set; }
    }
}
