using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Entidad;

using System.Data.SqlClient;
using System.Data;

namespace Data
{
    public class D_Empleado
    {
        private static string sConexion = "Data Source=.;Initial Catalog=BDArbol;Integrated Security=True";

        public static void EliminarData()
        {

            using (SqlConnection con = new SqlConnection(sConexion))
            {
                con.Open();

                SqlCommand comand = new SqlCommand("pa_EliminarEmpleadoData", con);
                comand.CommandType = CommandType.StoredProcedure;

                comand.ExecuteNonQuery();
            }
        }

        public static void insertar(E_Empleado obj) {

            using (SqlConnection con = new SqlConnection(sConexion))
            {
                con.Open();

                SqlCommand comand = new SqlCommand("pa_InsertarEmpleado", con);
                comand.CommandType = CommandType.StoredProcedure;


                SqlParameter parm01 = new SqlParameter("Id_Empleado", obj.Id_Empleado);
                comand.Parameters.Add(parm01);

                SqlParameter parm02 = new SqlParameter("Id_Padre", obj.Id_Padre);
                comand.Parameters.Add(parm02);

                SqlParameter parm03 = new SqlParameter("Emp_Nombre", obj.Emp_Nombre);
                comand.Parameters.Add(parm03);

                SqlParameter parm04 = new SqlParameter("Emp_Fase", obj.Emp_Fase);
                comand.Parameters.Add(parm04);

                SqlParameter parm05 = new SqlParameter("Emp_Horas", obj.Emp_Horas);
                comand.Parameters.Add(parm05);

                
                comand.ExecuteNonQuery();

            }
        }

        public static List<E_Empleado_Fase> ListaConsolidado()
        {
            List<E_Empleado_Fase> l = new List<E_Empleado_Fase>();

            using (SqlConnection con = new SqlConnection(sConexion))
            {
                con.Open();

                SqlCommand comand = new SqlCommand("pa_ListarEmpleado_Fase", con);
                comand.CommandType = CommandType.StoredProcedure;

                SqlDataReader r = comand.ExecuteReader();

                while (r.Read())
                {
                    E_Empleado_Fase obj = new E_Empleado_Fase();

                    obj.Id_Empleado = r.GetInt32(0);
                    obj.Emp_Nombre = r.GetString(1);

                    obj.Fas_Analisis = r.GetInt32(2);
                    obj.Fas_Diseno = r.GetInt32(3);
                    obj.Fas_Desarrollo = r.GetInt32(4);
                    obj.Fas_Pruebas = r.GetInt32(5);
                    obj.Fas_Implantacion = r.GetInt32(6);

                    obj.Fas_Total = r.GetInt32(7);

                    l.Add(obj);
                }
            }

            return l;
        }

        public static List<E_Empleado> ListaData()
        {
            List<E_Empleado> l = new List<E_Empleado>();

            using (SqlConnection con = new SqlConnection(sConexion))
            {
                con.Open();

                SqlCommand comand = new SqlCommand("pa_ListarEmpleadoData", con);
                comand.CommandType = CommandType.StoredProcedure;

                SqlDataReader r = comand.ExecuteReader();

                while (r.Read())
                {
                    E_Empleado obj = new E_Empleado();

                    obj.Id_Empleado = r.GetInt32(0);
                    obj.Id_Padre = r.GetInt32(1);
                    obj.Emp_Nombre = r.GetString(2);
                    obj.Emp_Fase = r.GetString(3);
                    obj.Emp_Horas = r.GetInt32(4);

                    l.Add(obj);
                }
            }

            return l;
        }

        public static List<E_Empleado_Arbol> Lista()
        {
            List<E_Empleado_Arbol> l = new List<E_Empleado_Arbol>();

            using (SqlConnection con = new SqlConnection(sConexion))
            {
                con.Open();

                SqlCommand comand = new SqlCommand("pa_ListarEmpleadoArbol", con);
                comand.CommandType = CommandType.StoredProcedure;

                SqlDataReader r = comand.ExecuteReader();

                while (r.Read())
                {
                    E_Empleado_Arbol obj = new E_Empleado_Arbol();

                    obj.Id_Empleado = r.GetInt32(0);
                    obj.Id_Padre = r.GetInt32(1);
                    obj.Emp_Nombre = r.GetString(2);

                    l.Add(obj);
                }

            }

            return l;
        }
    }
}
