using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Profile.IsAnonymous)
        {

            lblNombre.Text = Profile.Nombre;
            //agregamos el texto si puede votar o no
            //if (!Votaciones.Negocio.Listados.PuedeVotar(Profile.Rut))
            //{
            //    lblNombre.Text = lblNombre.Text + "</BR><span style='color:WHITE'>INHABILITADO PARA VOTAR DEBIDO A QUE NO CUMPLE EL TIEMPO NECESARIO</span>";
            //}
        }
    }
}
