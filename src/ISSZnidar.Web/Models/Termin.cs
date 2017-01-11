using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ISSZnidar.Web.Models
{
    public partial class Termin
    {
        public int TerminId { get; set; }
        [Display(Name = "Predmet")]
        public int PredmetId { get; set; }
        [Display(Name = "Začetek")]
        public DateTime? Zacetek { get; set; }
        public DateTime? Konec { get; set; }
        public string Opis { get; set; }
        [Display(Name = "Predmet")]
        public virtual Predmet Predmet { get; set; }
    }
}
