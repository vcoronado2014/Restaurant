using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Profile;
using System.Web.Security;

public partial class Votaciones_Inicio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //LimpiarUsuarios();
        //LimpiarUsuariosParticular("15949442-K");
        //DejarUsuariosSinVotar();
        //InsertarRutAUsuario();
        if (Profile.IsAnonymous)
        {
            Response.Redirect("~/Account/Login.aspx");
        }
        else
        {
            //if (DateTime.Now < Convert.ToDateTime("23/06/2011"))
            //    btnVotar.Enabled = false;
            //if (!Votaciones.Negocio.Listados.PuedeVotar(Profile.Rut))
            //{
            //    Response.Redirect("~/account/login.aspx");
            //}
            //else
            //{

                if (Profile.HaVotado == 1)
                {
                    btnVotar.Enabled = false;
                }
                ActualizarGrilla();
                //rdblVotantes.DataBind();
                GrillaSuVoto();
                GrillaIntentos();
                ActualizarGrafico();
            //}
        }
    }
    private void ActualizarGrafico()
    {
        odsVotantes.DataBind();
        Chart1.DataBind();
    }
    private void ActualizarGrilla()
    {
        odsVotantes.DataBind();
        GridView1.DataBind();
    }
    private void GrillaSuVoto()
    {
        List<EnvoltorioVotacion> lista = new List<EnvoltorioVotacion>();
        //List<Votaciones.Entidad.Votacione> listaSuVoto = Votaciones.Negocio.Listados.ObtenerVotacionesPorUsuarioVotador(Profile.UserName);
        List<Votaciones.Entidad.VotacioneNuevo> listaSuVoto = Votaciones.Negocio.Listados.ObtenerVotacionesPorUsuarioVotadorNuevo(Profile.UserName);
        //foreach (Votaciones.Entidad.Votacione vot in listaSuVoto)
        foreach (Votaciones.Entidad.VotacioneNuevo vot in listaSuVoto)
        {
            EnvoltorioVotacion envoltorio = new EnvoltorioVotacion();
            envoltorio.Fecha = Convert.ToDateTime(vot.FECHA_VOTACION);
            envoltorio.Equipo = vot.EQUIPO_VOTADOR;
            //Votaciones.Entidad.Votante persona = Votaciones.Negocio.Listados.BuscarVotantePorId(int.Parse(vot.ID_USUARIO_VOTA.ToString()));
            Votaciones.Entidad.VotanteNuevo persona = Votaciones.Negocio.Listados.BuscarVotantePorIdNuevo(int.Parse(vot.ID_USUARIO_VOTA.ToString()));
            envoltorio.VotoPor = persona.NOMBRE;
            lista.Add(envoltorio);
        }

        grillaSuVoto.DataSource = lista;
        grillaSuVoto.DataBind();
    }
    private void GrillaIntentos()
    {
        List<EnvoltorioVotacion> lista = new List<EnvoltorioVotacion>();
        List<Votaciones.Entidad.LogMovimientoNuevo> listaIntentos = Votaciones.Negocio.Listados.ObtenerMovimientosPorUsuarioVotadorNuevo(Profile.UserName);
        foreach (Votaciones.Entidad.LogMovimientoNuevo vot in listaIntentos)
        {
            EnvoltorioVotacion envoltorio = new EnvoltorioVotacion();
            envoltorio.Fecha = Convert.ToDateTime(vot.FECHA_MOVIMIENTO);
            envoltorio.Equipo = vot.EQUIPO_MOVIMIENTO;
            //Votaciones.Entidad.Votante persona = Votaciones.Negocio.Listados.BuscarVotantePorId(int.Parse(vot.ID_USUARIO_VOTA.ToString()));
            Votaciones.Entidad.VotanteNuevo persona = Votaciones.Negocio.Listados.BuscarVotantePorIdNuevo(int.Parse(vot.ID_USUARIO_VOTA.ToString()));
            envoltorio.VotoPor = persona.NOMBRE;
            lista.Add(envoltorio);
        }

        grillaIntentos.DataSource = lista;
        grillaIntentos.DataBind();
    }
    //tipos de movimiento
    //1 = ya voto vuelve a votar.
    protected void btnVotar_Click(object sender, EventArgs e)
    {
        if (rdblVotantes.SelectedValue != null)
        {
            if (rdblVotantes.SelectedValue != "")
            {
                int idVotante = int.Parse(rdblVotantes.SelectedValue.ToString());
                if (Profile.HaVotado == 1) //el tipo ya voto, debemos insertar al log
                {
                    //System.Net.IPHostEntry hostEntry = System.Net.Dns.GetHostByAddress(Request.UserHostAddress);
                    //Votaciones.Entidad.LogMovimiento log = new Votaciones.Entidad.LogMovimiento();
                    Votaciones.Entidad.LogMovimientoNuevo log = new Votaciones.Entidad.LogMovimientoNuevo();
                    log.EQUIPO_MOVIMIENTO = "";
                    log.FECHA_MOVIMIENTO = DateTime.Now;
                    log.ID_USUARIO_VOTA = idVotante;
                    log.TIPO_MOVIMIENTO = 1;
                    log.USUARIO_VOTADOR = Profile.UserName;
                    Votaciones.Negocio.Listados.InsertarLogNuevo(log);
                    //mostramos historial de votaciones
                    litMensaje.Text = "Ud ya ha votado";

                }
                else
                {
                    if (Profile.KeyUnique == "")
                        litMensaje.Text = "NO PUEDE VOTAR SIN SU IDENTIFICADOR UNICO";
                    else
                    {
                        //switch (Votaciones.Negocio.Listados.Votar(idVotante, Profile.Rut))
                        switch (Votaciones.Negocio.Listados.VotarNuevo(idVotante, Profile.Rut))
                        {
                            case 0:
                                ActualizarUsuario(Profile.UserName, idVotante);
                                litMensaje.Text = "Ud. ha votado con éxito";
                                break;
                            case 1:
                                litMensaje.Text = "No existe el usuario por el que esta votando";
                                break;
                            case 2:
                                litMensaje.Text = "NO PUEDE VOTAR POR UD MISMO";
                                break;
                        }
                    }
                }
            }
            else
            {
                litMensaje.Text = "Debe seleccionar un candidato de la Lista";

            }
            
        }
        else
        {
            litMensaje.Text = "Debe seleccionar un candidato de la Lista";
        }
        ActualizarGrilla();
        GrillaSuVoto();
        GrillaIntentos();
        ActualizarGrafico();
    }
    private void LimpiarUsuariosParticular(string rut)
    {
        MembershipUserCollection usuarios = Membership.GetAllUsers();
        //primero eliminamos
        foreach (MembershipUser us in usuarios)
        {
            if (us.UserName == rut)
                Membership.DeleteUser(us.UserName, true);
        }
        List<Votaciones.Entidad.Votante> listaTodosLosUsuarios = Votaciones.Negocio.Listados.ListaTodos();
        foreach (Votaciones.Entidad.Votante vot in listaTodosLosUsuarios)
        {
            if (vot.RUT == rut)
            {
                MembershipUser us = Membership.CreateUser(vot.RUT, vot.RUT);
                if (us != null)
                {
                    ProfileCommon prof = new ProfileCommon().GetProfile(us.UserName);
                    prof.HaVotado = 0;
                    prof.Rut = vot.RUT;
                    prof.IntentosVotaciones = 0;
                    prof.Nombre = vot.NOMBRE;
                    prof.Save();
                }
            }

        }
        //luego creamos
        //foreach (MembershipUser us in usuarios)
        //{

        //    ProfileCommon prof = new ProfileCommon().GetProfile(us.UserName);
        //    prof.HaVotado = 0;
        //    prof.Save();

        //}
    }
    private void LimpiarUsuarios()
    {
        MembershipUserCollection usuarios = Membership.GetAllUsers();
        //primero eliminamos
        foreach (MembershipUser us in usuarios)
        {
            if (us.UserName != "vcoronado")
                Membership.DeleteUser(us.UserName, true);
        }
        List<Votaciones.Entidad.Votante> listaTodosLosUsuarios = Votaciones.Negocio.Listados.ListaTodos();
        foreach (Votaciones.Entidad.Votante vot in listaTodosLosUsuarios)
        {
            MembershipUser us = Membership.CreateUser(vot.RUT, vot.RUT);
            if (us != null)
            {
                ProfileCommon prof = new ProfileCommon().GetProfile(us.UserName);
                prof.HaVotado = 0;
                prof.Rut = vot.RUT;
                prof.IntentosVotaciones = 0;
                prof.Nombre = vot.NOMBRE;
                prof.Save();
            }
            
        }
        //luego creamos
        //foreach (MembershipUser us in usuarios)
        //{
            
        //    ProfileCommon prof = new ProfileCommon().GetProfile(us.UserName);
        //    prof.HaVotado = 0;
        //    prof.Save();

        //}
    }
    private void DejarUsuariosSinVotar()
    {
        MembershipUserCollection usuarios = Membership.GetAllUsers();
        foreach (MembershipUser us in usuarios)
        {
            ProfileCommon prof = new ProfileCommon().GetProfile(us.UserName);
            prof.HaVotado = 0;
            prof.Save();

        }
    }
    private void InsertarRutAUsuario()
    {
        MembershipUserCollection usuarios = Membership.GetAllUsers();
        foreach (MembershipUser us in usuarios)
        {
            ProfileCommon prof = new ProfileCommon().GetProfile(us.UserName);
            prof.Rut = "12535306-1";
            prof.Save();

        }
    }
    private int ActualizarUsuario(string userName, int idUsuarioVota)
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

                retorno = 1;
            }
            else
            {
                //si tiene
                prof.HaVotado = 1;
                prof.IntentosVotaciones++;
                prof.Save();
                retorno = 0;
                //guardamos la votacion
                Votaciones.Entidad.Votacione votacion = new Votaciones.Entidad.Votacione();

                //System.Net.IPHostEntry hostEntry = System.Net.Dns.GetHostByAddress(Request.UserHostAddress);
                votacion.EQUIPO_VOTADOR = "";
                votacion.FECHA_VOTACION = DateTime.Now;
                votacion.ID_USUARIO_VOTA = idUsuarioVota;
                votacion.OBSERVACIONES = "";
                votacion.USUARIO_VOTADOR = userName;
                Votaciones.Negocio.Listados.InsertarVotacion(votacion);

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
public class EnvoltorioVotacion
{
    public EnvoltorioVotacion()
    {

    }
    public DateTime Fecha { get; set; }
    public string VotoPor { get; set; }
    public string Equipo { get; set; }
}