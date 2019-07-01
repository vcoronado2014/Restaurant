<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Documentos.aspx.cs" Inherits="Documentos_Documentos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width:100%;">
    <tr>
        <td align="center" class="subTitulo" colspan="3">
            Documentos Descargables</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td align="center">
            <asp:HyperLink ID="HyperLink1" runat="server" 
                NavigateUrl="~/Documentos/acta _de_eleciones.doc" Target="_blank">Acta de Elecciones</asp:HyperLink>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td align="center">
            <asp:HyperLink ID="HyperLink2" runat="server" 
                NavigateUrl="~/Documentos/constitucion_funcionamiento_cphs.ppt" Target="_blank">Cosntitución del Comité</asp:HyperLink>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td align="center">
            <asp:HyperLink ID="HyperLink3" runat="server" 
                NavigateUrl="~/Documentos/manual_de_constitucion_comites_paritarios.doc" 
                Target="_blank">Manual de Cosntitución</asp:HyperLink>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td align="center">
            <asp:HyperLink ID="HyperLink4" runat="server" 
                NavigateUrl="~/videos/comiteparitario_5.00(1).mp4" 
                Target="_blank">Descargar Video</asp:HyperLink>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

