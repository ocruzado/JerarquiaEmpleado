using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Data;
using Entidad;

namespace Logica
{
    public class L_Usuario
    {
        public static E_Usuario insertar(E_Usuario obj)
        {
            return D_Usuario.insertar(obj);
        }
        public static E_Usuario Obtener(E_Usuario obj)
        {
            return D_Usuario.Obtener(obj);
        }
    }
}
