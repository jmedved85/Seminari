using System;
using System.Collections.Generic;

#nullable disable

namespace Seminari.Models
{
    public partial class Predbiljezba
    {
        public int IdPredbiljezba { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public string Adresa { get; set; }
        public string Email { get; set; }
        public string Telefon { get; set; }
        public DateTime Datum { get; set; }
        public int IdSeminar { get; set; }
        public bool? Status { get; set; }

        public virtual Seminar IdSeminarNavigation { get; set; }
    }
}
