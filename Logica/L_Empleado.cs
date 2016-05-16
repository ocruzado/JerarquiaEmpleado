using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Entidad;
using Data;

namespace Logica
{
    public class L_Empleado
    {
        private static string sArbol;

        public static void GenerarDataAleatoria()
        {
            List<E_Empleado> l_nueva = new List<E_Empleado>();
            List<E_Empleado> l_defecto = ListaDefecto();

            Random r = new Random();

            for (int i = 0; i < 10; i++)
            {
                int indice = r.Next(l_defecto.Count);

                l_nueva.Add(l_defecto[indice]);

                l_defecto.RemoveAt(indice);
            }
            
            D_Empleado.EliminarData();

            foreach (E_Empleado i in l_nueva)
            {
                D_Empleado.insertar(i);
            }
        }

        public static List<E_Empleado_Fase> ListaConsolidado()
        {
            return D_Empleado.ListaConsolidado();
        }

        public static List<E_Empleado> ListaData()
        {
            return D_Empleado.ListaData();
        }

        private static List<E_Empleado_Arbol> l_base;


        public static string ArbolHTML()
        {
            l_base = D_Empleado.Lista();

            List<E_Empleado_Arbol> L_Principal = (from E_Empleado_Arbol P in l_base orderby P.Emp_Nombre ascending where P.Id_Padre == P.Id_Empleado select P).ToList<E_Empleado_Arbol>();

            sArbol = "";

            Bild_ArbolHTML(L_Principal);

            return sArbol;
        }

        private static void Bild_ArbolHTML(List<E_Empleado_Arbol> L_Principal)
        {
            sArbol += "<ul>";

            foreach (E_Empleado_Arbol i in L_Principal)
            {
                sArbol += String.Format("<li>{0}", i.Emp_Nombre);

                List<E_Empleado_Arbol> l = (
                    from E_Empleado_Arbol P in l_base
                    orderby P.Emp_Nombre ascending
                    where
                        P.Id_Padre == i.Id_Empleado &&
                        P.Id_Empleado != i.Id_Empleado
                    select P).ToList<E_Empleado_Arbol>();

                if (l.Count > 0)
                    Bild_ArbolHTML(l);


                sArbol += "</li>";
            }

            sArbol += "</ul>";
        }

        private static List<E_Empleado> ListaDefecto()
        {
            Random r = new Random();

            List<string> fases = new List<string>(new string[] { "Análisis", "Diseño", "Desarrollo", "Pruebas", "Implantación" });

            List<E_Empleado> l = new List<E_Empleado>();

            for (int i = 0; i < 10; i++)
            {
                for (int j = 0; j < 10; j++)
                {

                    foreach (string f in fases)
                    {

                        l.Add(new E_Empleado
                        {
                            Id_Empleado = i + j,
                            Id_Padre = i,
                            Emp_Nombre = String.Format("Empleado {0}", i + j),
                            Emp_Fase = f,
                            Emp_Horas = r.Next(10) * 10
                        });
                    }
                }
            }

            return l;
        }

    }
}
