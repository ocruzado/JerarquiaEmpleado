using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidad
{
    public class E_Empleado_Arbol
    {
        public int Id_Empleado { get; set; }
        public int Id_Padre { get; set; }
        public string Emp_Nombre { get; set; }

        public E_Empleado_Arbol()
        {
            this.Id_Empleado = 0;
            this.Id_Padre = 0;
            this.Emp_Nombre = "";
        }

    }
}
