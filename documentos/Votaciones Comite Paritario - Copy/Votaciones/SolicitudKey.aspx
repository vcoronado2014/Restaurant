<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SolicitudKey.aspx.cs" Inherits="Votaciones_SolicitudKey" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width: 100%;">
    <tr>
        <td colspan="3">
            <asp:Literal ID="litMensaje" runat="server" 
                Text="Para solicitar su clave unica de identificación y poder participar en el proceso de votación presione el botón siguiente. Una vez que el sistema haya realizado las validaciones correspondientes le otorgorá un Identificador que Ud debe guardar para luego utilizarlo y votar. "></asp:Literal>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td align="right">
            <asp:Button ID="btnSolicitar" runat="server" onclick="btnSolicitar_Click" 
                Text="Solicitar/Verificar" PostBackUrl="~/Votaciones/SolicitudKey.aspx" />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td style="font-family: Tahoma; font-size: 14px; font-weight: bold">
            <asp:Literal ID="litKey" runat="server"></asp:Literal>
        </td>
    </tr>
</table>
</asp:Content>

