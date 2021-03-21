using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace Seminari.Models
{
    public partial class Predbiljezba
    {
        public int IdPredbiljezba { get; set; }

        [Required]
        [DisplayName("Ime:")]
        public string Ime { get; set; }

        [Required]
        [DisplayName("Prezime:")]
        public string Prezime { get; set; }

        [Required]
        [DisplayName("Adresa:")]
        public string Adresa { get; set; }

        [Required]
        [DisplayName("E-mail:")]
        public string Email { get; set; }

        [Required]
        [DisplayName("Telefon:")]
        public string Telefon { get; set; }

        [DisplayFormat(DataFormatString = "{0:dd.MM.yyyy.}", ApplyFormatInEditMode = true)]
        // [DataType(DataType.Date)]
        [DisplayName("Datum:")]
        public DateTime Datum { get; set; }

        [DisplayName("Seminar:")]
        public int IdSeminar { get; set; }

        [DisplayName("Status:")]
        public bool? Status { get; set; }

        public virtual Seminar IdSeminarNavigation { get; set; }
    }
}
