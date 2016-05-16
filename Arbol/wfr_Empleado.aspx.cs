using Entidad;
using Logica;
using System;

namespace Arbol
{
    public partial class wfr_Empleado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetData();
        }

        private void GetData()
        {
            lit_Arbol.Text = L_Empleado.ArbolHTML();

            gvw_EmpleadoData.DataSource = L_Empleado.ListaData();
            gvw_EmpleadoData.DataBind();

            gvw_EmpleadoConsolidado.DataSource = L_Empleado.ListaConsolidado();
            gvw_EmpleadoConsolidado.DataBind();
        }

        protected void btn_GenerarData_Click(object sender, EventArgs e)
        {
            L_Empleado.GenerarDataAleatoria();

            GetData();
        }
    }
}