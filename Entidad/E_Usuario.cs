using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidad
{
    public class E_Usuario
    {
        public int Id_Usuario { get; set; }
        public string Usu_Nombre { get; set; }
        public string Usu_Usuario { get; set; }
        public string Usu_Clave { get; set; }

        public E_Usuario()
        {
            this.Id_Usuario = 0;
            this.Usu_Nombre = "";
            this.Usu_Usuario = "";
            this.Usu_Clave = "";

        }
    }
}
