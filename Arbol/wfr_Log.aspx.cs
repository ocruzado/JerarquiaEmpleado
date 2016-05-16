using Entidad;
using Logica;
using System;

namespace Arbol
{
    public partial class wfr_Log : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Inicia_Click(object sender, EventArgs e)
        {
            E_Usuario U = L_Usuario.Obtener(new E_Usuario
            {
                Usu_Usuario = txt_usuario.Text,
                Usu_Clave = txt_clave.Text
            });

            if (U != null)
            {
                Session["usuario"] = U;

                Response.Redirect("wfr_Empleado.aspx");
            }
            else
            {
                lit_msj_Inicio.Text =
                "<div class=\"alert alert-danger alert-dismissible text-center\" role=\"alert\">" +
                    "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>" +
                    "Usuario o Clave Incorrectos" +
                "</div>";

                limpiar();
            }
        }

        protected void btn_Registro_Click(object sender, EventArgs e)
        {
            E_Usuario U = L_Usuario.insertar(new E_Usuario
            {
                Usu_Nombre = txt_Reg_Nombre.Text,
                Usu_Usuario = txt_Reg_Usuario.Text,
                Usu_Clave = txt_Reg_Clave.Text
            });

            if (U != null)
            {
                Session["usuario"] = U;

                Response.Redirect("wfr_Empleado.aspx");
            }
            else
            {
                lit_msj_Registro.Text =
                "<div class=\"alert alert-danger alert-dismissible text-center\" role=\"alert\">" +
                    "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>" +
                    "El Usuario Ingresado ya esta en Uso" +
                "</div>";

                limpiar();
            }
        }

        private void limpiar()
        {
            txt_Reg_Nombre.Text = "";
            txt_Reg_Usuario.Text = "";
            txt_Reg_Clave.Text = "";

            txt_usuario.Text = "";
            txt_clave.Text = "";
        }
    }
}