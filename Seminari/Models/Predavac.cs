using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

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
        
        [Required]
        public string Ime { get; set; }

        [Required]
        public string Prezime { get; set; }
        public string ImePrezime { get => this.Ime + " " + this.Prezime; }
        public virtual ICollection<Seminar> Seminars { get; set; }
    }
}
