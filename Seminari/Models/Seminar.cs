using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace Seminari.Models
{
    public partial class Seminar
    {
        public Seminar()
        {
            Predbiljezbas = new HashSet<Predbiljezba>();
        }

        [DisplayName("Seminar:")]
        public int IdSeminar { get; set; }

        [Required]
        [DisplayName("Seminar:")]
        public string Naziv { get; set; }

        [DisplayName("Opis:")]
        public string Opis { get; set; }

        [DisplayFormat(DataFormatString = "{0:dd. MM. yyyy.}", ApplyFormatInEditMode = true)]
        [DisplayName("Datum početka:")]
        // [DataType(DataType.Date)]
        public DateTime? Datum { get; set; }

        [DisplayName("Popunjen:")]
        public bool? Popunjen { get; set; }

        [DisplayName("Predavač:")]
        public int? IdPredavac { get; set; }

        public virtual Predavac IdPredavacNavigation { get; set; }
        public virtual ICollection<Predbiljezba> Predbiljezbas { get; set; }
    }
}
