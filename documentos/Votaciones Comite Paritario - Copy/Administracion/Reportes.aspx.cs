using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Profile;
using System.Web.Security;
using System.Text;


public partial class Administracion_Reportes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Profile.IsAnonymous)
            Response.Redirect("../default.aspx");
        else
        {
            switch (Profile.Rut)
            {
                    //solo los del Comité Paritario
                case "12535306-1":
                case "8899856-1":
                case "13671095-8":
                case "16069167-0":
                case "12886090-8":
                case "12325957-2":
                    grillaNoHanVotado.DataSource = ObtenerNoVotaron();
                    grillaNoHanVotado.DataBind();
                    grillaHanVotado.DataSource = ObtenerVotaron();
                    grillaHanVotado.DataBind();
                    grillaVotaciones.DataSource = ObtenerVotados();
                    grillaVotaciones.DataBind();
                    break;
                default:
                    Response.Redirect("../default.aspx");
                    break;
            }
            //if (Profile.Rut == "12535306-1")
            //{
            //    grillaNoHanVotado.DataSource = ObtenerNoVotaron();
            //    grillaNoHanVotado.DataBind();
            //    grillaHanVotado.DataSource = ObtenerVotaron();
            //    grillaHanVotado.DataBind();
            //    grillaVotaciones.DataSource = ObtenerVotados();
            //    grillaVotaciones.DataBind();
            //}
            //else
            //    Response.Redirect("../default.aspx");
        }
    }
    private List<EnvoltorioNoVotacion> ObtenerNoVotaron()
    {
        MembershipUserCollection colection = Membership.GetAllUsers();
        List<EnvoltorioNoVotacion> lista = new List<EnvoltorioNoVotacion>();
        //List<Votaciones.Entidad.Votante> listaVotantes = Votaciones.Negocio.Listados.ListaTodos();
        List<Votaciones.Entidad.VotanteNuevo> listaVotantes = Votaciones.Negocio.Listados.ListaTodosNuevo();
        //foreach (Votaciones.Entidad.Votante vot in listaVotantes)
        foreach (Votaciones.Entidad.VotanteNuevo vot in listaVotantes)
        {
            MembershipUser us = Membership.GetUser(vot.RUT);
            if (us != null)
            {
                ProfileCommon prof = new ProfileCommon().GetProfile(us.UserName);
                if (prof.HaVotado == 0)
                {
                    EnvoltorioNoVotacion env = new EnvoltorioNoVotacion();
                    env.Nombre = vot.NOMBRE;
                    env.Rut = vot.RUT;
                    lista.Add(env);
                }
            }
            else
            {

            }
        }
        litMensajeNoHanVotado.Text = "Actualmente existen " + lista.Count.ToString() + " usuarios que aún no han votado de un total de " + listaVotantes.Count.ToString();


        return lista;
    }
    private List<EnvoltorioVotacion> ObtenerVotaron()
    {
        List<EnvoltorioVotacion> lista = new List<EnvoltorioVotacion>();
        //List<Votaciones.Entidad.Votante> listaVotantes = Votaciones.Negocio.Listados.ListaTodos();
        List<Votaciones.Entidad.VotanteNuevo> listaVotantes = Votaciones.Negocio.Listados.ListaTodosNuevo();
        //foreach (Votaciones.Entidad.Votante vot in listaVotantes)
        foreach (Votaciones.Entidad.VotanteNuevo vot in listaVotantes)
        {
            MembershipUser us = Membership.GetUser(vot.RUT);
            if (us != null)
            {
                ProfileCommon prof = new ProfileCommon().GetProfile(us.UserName);
                if (prof.HaVotado == 1)
                {
                    EnvoltorioVotacion env = new EnvoltorioVotacion();
                    env.Nombre = vot.NOMBRE;
                    env.Rut = vot.RUT;
                    //List<Votaciones.Entidad.Votacione> votaciones = Votaciones.Negocio.Listados.ObtenerVotacionesPorUsuarioVotador(env.Rut);
                    List<Votaciones.Entidad.VotacioneNuevo> votaciones = Votaciones.Negocio.Listados.ObtenerVotacionesPorUsuarioVotadorNuevo(env.Rut);
                    if (votaciones.Count > 0)
                    {
                        env.Fecha = Convert.ToDateTime(votaciones[0].FECHA_VOTACION);
                        //Votaciones.Entidad.Votante votante = Votaciones.Negocio.Listados.BuscarVotantePorId(int.Parse(votaciones[0].ID_USUARIO_VOTA.ToString()));
                        Votaciones.Entidad.VotanteNuevo votante = Votaciones.Negocio.Listados.BuscarVotantePorIdNuevo(int.Parse(votaciones[0].ID_USUARIO_VOTA.ToString()));
                        env.Equipo = votaciones[0].EQUIPO_VOTADOR;
                        env.Candidato = votante.NOMBRE;
                        lista.Add(env);
                    }
                    else
                    {
                    }
                }
            }
        }
        litMensajeHanVotado.Text = "Actualmente existen " + lista.Count.ToString() + " de usuarios que ya han votado de un total de " + listaVotantes.Count.ToString();

        return lista;
    }
    private List<EnvoltorioVotados> ObtenerVotados()
    {
        List<EnvoltorioVotados> listaDevolver = new List<EnvoltorioVotados>();
        //List<Votaciones.Entidad.Votante> listaVotantes = Votaciones.Negocio.Listados.ListaTodos();
        List<Votaciones.Entidad.VotanteNuevo> listaVotantes = Votaciones.Negocio.Listados.ListaTodosNuevo();
        //foreach (Votaciones.Entidad.Votante vot in listaVotantes)
        foreach (Votaciones.Entidad.VotanteNuevo vot in listaVotantes)
        {
            EnvoltorioVotados votado = new EnvoltorioVotados();
            votado.Nombre = vot.NOMBRE;
            votado.Rut = vot.RUT;
            votado.Cantidad = int.Parse(vot.CANTIDADVOTACIONES.ToString());
            listaDevolver.Add(votado);
        }

        //List<Votaciones.Entidad.Votante> listaSeis = Votaciones.Negocio.Listados.ListaSeisVotacionesMaximas();
        List<Votaciones.Entidad.VotanteNuevo> listaSeis = Votaciones.Negocio.Listados.ListaSeisVotacionesMaximasNuevo();
        StringBuilder sb = new StringBuilder();

        sb.Append("Las máximas 6 votaciones son: ");
        //foreach (Votaciones.Entidad.Votante vot1 in listaSeis)
        foreach (Votaciones.Entidad.VotanteNuevo vot1 in listaSeis)
        {
            sb.Append(vot1.NOMBRE);
            sb.AppendFormat(" ({0}) votos", vot1.CANTIDADVOTACIONES.ToString());
            sb.Append(" - ");
        }
        litMensajeVotaciones.Text = sb.ToString();
        return listaDevolver.OrderByDescending(p => p.Cantidad).ToList();
    }

}
public class EnvoltorioNoVotacion
{
    public EnvoltorioNoVotacion()
    {

    }
    public string Nombre { get; set; }
    public string Rut { get; set; }

}
public class EnvoltorioVotados
{
    public EnvoltorioVotados()
    {

    }
    public string Nombre { get; set; }
    public string Rut { get; set; }
    public int Cantidad { get; set; }

}
public class EnvoltorioVotacion
{
    public EnvoltorioVotacion()
    {

    }
    public string Nombre { get; set; }
    public string Rut { get; set; }
    public DateTime Fecha { get; set; }
    public string Equipo { get; set; }
    public string Candidato { get; set; }

}