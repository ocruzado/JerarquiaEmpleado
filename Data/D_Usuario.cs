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
    public class D_Usuario
    {
        private static string sConexion = "Data Source=.;Initial Catalog=BDArbol;Integrated Security=True";

        public static E_Usuario insertar(E_Usuario obj)
        {

            using (SqlConnection con = new SqlConnection(sConexion))
            {
                con.Open();

                SqlCommand comand = new SqlCommand("pa_InsertarUsuario", con);
                comand.CommandType = CommandType.StoredProcedure;


                SqlParameter parm01 = new SqlParameter("Usu_Nombre", obj.Usu_Nombre);
                comand.Parameters.Add(parm01);

                SqlParameter parm02 = new SqlParameter("Usu_Usuario", obj.Usu_Usuario);
                comand.Parameters.Add(parm02);

                SqlParameter parm03 = new SqlParameter("Usu_Clave", obj.Usu_Clave);
                comand.Parameters.Add(parm03);

                SqlParameter parm04 = new SqlParameter("ID", SqlDbType.Int);
                parm04.Direction = ParameterDirection.Output;
                comand.Parameters.Add(parm04);

                comand.ExecuteNonQuery();

                int ID = Convert.ToInt32(parm04.Value.ToString());

                if (ID != 0)
                {
                    E_Usuario u = new E_Usuario();

                    u.Id_Usuario = ID;
                    u.Usu_Nombre = obj.Usu_Nombre;

                    u.Usu_Usuario = obj.Usu_Usuario;
                    u.Usu_Clave = obj.Usu_Clave;

                    return u;
                }
                else
                    return null;

            }
        }

        public static E_Usuario Obtener(E_Usuario obj)
        {
            using (SqlConnection con = new SqlConnection(sConexion))
            {
                con.Open();

                SqlCommand comand = new SqlCommand("pa_ObtenerUsuario", con);
                comand.CommandType = CommandType.StoredProcedure;

                SqlParameter parm01 = new SqlParameter("Usu_Usuario", obj.Usu_Usuario);
                comand.Parameters.Add(parm01);

                SqlParameter parm02 = new SqlParameter("Usu_Clave", obj.Usu_Clave);
                comand.Parameters.Add(parm02);

                SqlDataReader r = comand.ExecuteReader();

                if (r.Read())
                {
                    E_Usuario u = new E_Usuario();

                    u.Id_Usuario = r.GetInt32(0);
                    u.Usu_Nombre = r.GetString(1);

                    u.Usu_Usuario = obj.Usu_Usuario;
                    u.Usu_Clave = obj.Usu_Clave;

                    return u;
                }
                else
                    return null;

            }

        }

    }
}
