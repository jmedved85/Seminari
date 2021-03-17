using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Seminari.ViewModels
{
    public class LoginViewModel 
    {
        [Required(ErrorMessage = "Obavezan unos")]
        [DataType(DataType.Password)]
        [Display(Name = "Korisnik:")]
        public string UserName { get; set; }

        [Required(ErrorMessage = "Obavezan unos")]
        [DataType(DataType.Password)]
        [Display(Name = "Lozinka:")]
        public string Password { get; set; }

        [Display(Name = "Zapamti me")]
        public bool RememberMe { get; set; }
    }
}
