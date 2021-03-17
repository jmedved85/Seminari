using System;
using System.Collections.Generic;

#nullable disable

namespace Seminari.Models
{    
    public partial class Predavac
    {
        public Predavac()
        {
            Seminars = new HashSet<Seminar>();
        }

        public int IdPredavac { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public string ImePrezime { get => this.Ime + " " + this.Prezime; }
        public virtual ICollection<Seminar> Seminars { get; set; }
    }
}
