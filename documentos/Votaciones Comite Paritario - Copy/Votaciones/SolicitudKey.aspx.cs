using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Profile;
using System.Web.Security;

public partial class Votaciones_SolicitudKey : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Profile.IsAnonymous)
            Response.Redirect("~/Account/Login.aspx");
        else
        {
            //if (!Votaciones.Negocio.Listados.PuedeVotar(Profile.Rut))
            //{
            //    Response.Redirect("~/account/login.aspx");
            //}
            //else
            //{
                if (Profile.KeyUnique != "")
                    litKey.Text = "Ud ya cuenta con Key Válida : " + Profile.KeyUnique;
            //}
        }
    }
    protected void btnSolicitar_Click(object sender, EventArgs e)
    {
        string key = SolicitudKey(20);
        if (ActualizarUsuario(Profile.UserName, key) == 0)
        {
            //usuario actualizado con exito
            //litMensaje.Text = "Para solicitar su clave unica de identificación y poder participar en el proceso de votación presione el botón siguiente. Una vez que el sistema haya realizado las validaciones correspondientes le otorgorá un Identificador que Ud debe guardar para luego utilizarlo y votar.";
            litKey.Text = "Su Key a sido generada con éxito :" + Profile.KeyUnique;
        }
        if (ActualizarUsuario(Profile.UserName, key) == 1)
        {
            //litMensaje.Text = "Para solicitar su clave unica de identificación y poder participar en el proceso de votación presione el botón siguiente. Una vez que el sistema haya realizado las validaciones correspondientes le otorgorá un Identificador que Ud debe guardar para luego utilizarlo y votar.";
            litKey.Text = "Ud ya cuenta con Key Válida : "  + Profile.KeyUnique;
        }
        if (ActualizarUsuario(Profile.UserName, key) == 2)
        {
            //litMensaje.Text = "Para solicitar su clave unica de identificación y poder participar en el proceso de votación presione el botón siguiente. Una vez que el sistema haya realizado las validaciones correspondientes le otorgorá un Identificador que Ud debe guardar para luego utilizarlo y votar.";
            litKey.Text = "No es ususario del sistema, solicite clave al Administrador";
        }
        
    }
    private readonly Random _rng = new Random(); 
    private string SolicitudKey(int length)
    {
        const string allowedChars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        char[] buffer = new char[length];
        for (int i = 0; i < length; i++)
        {
            buffer[i] = allowedChars[_rng.Next(allowedChars.Length)];
        }
        return new string(buffer);
    }
    
    private int ActualizarUsuario(string userName, string keyIdentifier)
    {
        //0 modificado
        //1 ya tiene key
        //2 no existe
        int retorno = 0;
        //obtenemos al usuario y guardar los datos
        MembershipUser user = Membership.GetUser(userName);
        if (user != null)
        {
            //ya existe modiciamos el profile
            ProfileCommon prof = new ProfileCommon().GetProfile(userName);
            if (prof.KeyUnique == "")
            {
                //no tiene hay que crearlo
                prof.KeyUnique = keyIdentifier;
                prof.Save();
                retorno = 0;
            }
            else
            {
                //si tiene
                retorno = 1;
            }
        }
        else
        {
            //no existe debemos redireccionar
            retorno = 2;
        }
        return retorno;
    }
}