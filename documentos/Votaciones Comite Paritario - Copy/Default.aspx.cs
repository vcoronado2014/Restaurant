using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Profile;
using System.Web.Security;

public partial class _Default : System.Web.UI.Page
{
    private void VotarMasivo(string userName)
    {
        //ya existe modiciamos el profile
        ProfileCommon prof = new ProfileCommon().GetProfile(userName);
        
        
            //si tiene
            prof.HaVotado = 1;
            prof.IntentosVotaciones++;
            prof.Save();
            //guardamos la votacion
            Votaciones.Entidad.Votacione votacion = new Votaciones.Entidad.Votacione();
            //System.Net.IPHostEntry hostEntry = System.Net.Dns.GetHostByAddress(Request.UserHostAddress);
            votacion.EQUIPO_VOTADOR = "";
            votacion.FECHA_VOTACION = DateTime.Now;
            votacion.ID_USUARIO_VOTA = 52;
            votacion.OBSERVACIONES = "";
            votacion.USUARIO_VOTADOR = userName;
            Votaciones.Negocio.Listados.InsertarVotacion(votacion);

        
    }

    private void ProcesoLimpiezaUsuarios()
    {
        List<Votaciones.Entidad.Votante> todos = Votaciones.Negocio.Listados.ListaTodos();
        if (todos != null && todos.Count > 0)
        {
            foreach(Votaciones.Entidad.Votante votante in todos)
            {
                //obtenemos al usuario
                MembershipUser us = Membership.GetUser(votante.RUT);
                if (us != null)
                {
                    //usuario ya existe limpiar sus datos
                    ProfileCommon prof = new ProfileCommon().GetProfile(us.UserName);
                    prof.HaVotado = 0;
                    prof.IntentosVotaciones = 0;
                    prof.Save();
                    

                }
                else
                {
                    //usuario no existe CREAR
                    MembershipUser us1 = Membership.CreateUser(votante.RUT, votante.RUT);
                    ProfileCommon prof = new ProfileCommon().GetProfile(votante.RUT);
                    prof.HaVotado = 0;
                    prof.Rut = votante.RUT;
                    prof.IntentosVotaciones = 0;
                    prof.Nombre = votante.NOMBRE;
                    prof.Save();

                }

            }

        }

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //CrearUsuario("15478857-3");
        //CrearUsuario("15722533-2");
        //CrearUsuario("16724985-K");
        //CrearUsuario("16400747-2");
        //CrearUsuario("16740438-3");
        //CrearUsuario("21378262-2");
        //CrearUsuario("16474644-5");
        //CrearUsuario("16067268-4");

        //VotarMasivo("15478857-3");
        //VotarMasivo("15722533-2");
        //VotarMasivo("16724985-K");
        //VotarMasivo("16400747-2");
        //VotarMasivo("16740438-3");
        //VotarMasivo("21378262-2");
        //VotarMasivo("16474644-5");
        //VotarMasivo("16067268-4");
        //ProcesoLimpiezaUsuarios();
        


        if (Profile.IsAnonymous)
        {
            //altiro enviarlo a login
            litMensaje.Text = "NO HA SIDO PARTICIPE ";
        }
        else
        {
            
            litUsuario.Text = Profile.Nombre;
            //tiene KeyUnique?
            if (Profile.KeyUnique == "")
            {
                Response.Redirect("~/votaciones/solicitudKey.aspx");
            }
            else
            {
                if (Profile.HaVotado == 1)
                {
                    litMensaje.Text = "HA SIDO PARTICIPE CON SU VOTO ";
                }
                else
                {
                    litMensaje.Text = "NO HA SIDO PARTICIPE ";
                }
            }
        }
    }
    public void CrearUsuario(string userName)
    {
        MembershipUser us1 = Membership.GetUser(userName);
        if (us1 == null)
        {

            Votaciones.Entidad.Votante vot = Votaciones.Negocio.Listados.BuscarVotantePorRut(userName);
            if (vot != null)
            {
                MembershipUser us = Membership.CreateUser(vot.RUT, vot.RUT);
                ProfileCommon prof = new ProfileCommon().GetProfile(userName);
                prof.HaVotado = 0;
                prof.Rut = vot.RUT;
                prof.IntentosVotaciones = 0;
                prof.Nombre = vot.NOMBRE;
                prof.Save();
            }
        }
        else
        {
            Votaciones.Entidad.Votante vot = Votaciones.Negocio.Listados.BuscarVotantePorRut(userName);
            if (vot != null)
            {
                ProfileCommon prof = new ProfileCommon().GetProfile(userName);
                prof.HaVotado = 0;
                prof.Rut = vot.RUT;
                prof.IntentosVotaciones = 0;
                prof.Nombre = vot.NOMBRE;
                prof.Save();
            }
        }

    }
}
