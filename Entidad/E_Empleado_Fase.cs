using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidad
{
    public class E_Empleado_Fase
    {
        public int Id_Empleado { get; set; }
        public string Emp_Nombre { get; set; }

        public int Fas_Analisis { get; set; }
        public int Fas_Diseno { get; set; }
        public int Fas_Desarrollo { get; set; }
        public int Fas_Pruebas { get; set; }
        public int Fas_Implantacion { get; set; }

        public int Fas_Total { get; set; }

        public E_Empleado_Fase()
        {
            this.Id_Empleado = 0;
            this.Emp_Nombre = "";

            this.Fas_Analisis = 0;
            this.Fas_Diseno = 0;
            this.Fas_Desarrollo = 0;
            this.Fas_Pruebas = 0;
            this.Fas_Implantacion = 0;

            this.Fas_Total = 0;

        }
    }
}
