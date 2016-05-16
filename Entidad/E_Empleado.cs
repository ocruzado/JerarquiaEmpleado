using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidad
{
    public class E_Empleado
    {
        public int Id_Empleado { get; set; }
        public int Id_Padre { get; set; }
        public string Emp_Nombre { get; set; }
        public string Emp_Fase { get; set; }
        public int Emp_Horas { get; set; }

        public E_Empleado()
        {
            this.Id_Empleado = 0;
            this.Id_Padre = 0;
            this.Emp_Nombre = "";
            this.Emp_Fase = "";
            this.Emp_Horas = 0;

        }

    }
}
