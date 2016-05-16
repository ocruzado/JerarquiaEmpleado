using Entidad;
using System;

namespace Arbol
{
    public partial class smp_Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                E_Usuario U = (E_Usuario)Session["usuario"];

                lbl_usuario.Text = "Bienvenido : " + U.Usu_Nombre;
            }
            else
            {
                Response.Redirect("wfr_Log.aspx");
            }
        }

        protected void lkb_Cerrar_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();

            Response.Redirect("wfr_Log.aspx");
        }
    }
}