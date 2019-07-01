<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
    .style1
    {
        width: 421.5pt;
        font-size: 11.0pt;
        font-family: Calibri, sans-serif;
    }
    .style2
    {
        width: 113.25pt;
        font-size: 11.0pt;
        font-family: Calibri, sans-serif;
    }
    .style3
    {
        width: 98.25pt;
        font-size: 11.0pt;
        font-family: Calibri, sans-serif;
    }
</style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Bienvenido
        <asp:Literal ID="litUsuario" runat="server"></asp:Literal>
    </h2>
    <p>
        Ud
        <asp:Literal ID="litMensaje" runat="server"></asp:Literal>
&nbsp;del proceso de votación para el Comité Paritario de la Empresa.</p>
    <div align="center">
        <table border="0" cellpadding="0" cellspacing="0" class="style1" 
            style="mso-cellspacing: 0cm; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 0cm 0cm 0cm" 
            width="562">
            <tr style="mso-yfti-irow: 0; mso-yfti-firstrow: yes; height: 18.75pt">
                <td style="padding: 0cm 0cm 0cm 0cm; height: 18.75pt">
                    <p class="MsoNormal">
                        <b>
                        <span style="font-size: 13.5pt; font-family: &quot;Arial&quot;,&quot;sans-serif&quot;; mso-fareast-language: ES-CL">
                        Evitar accidentes laborales es una tarea compartida</span></b><span 
                            style="font-size: 12.0pt; font-family: &quot;Times New Roman&quot;,&quot;serif&quot;; mso-fareast-language: ES-CL"><o:p></o:p></span></p>
                </td>
            </tr>
            <tr style="mso-yfti-irow: 1">
                <td style="padding: 0cm 0cm 0cm 0cm">
                    <p class="MsoNormal">
                        <b>
                        <span style="font-size: 7.5pt; font-family: &quot;Arial&quot;,&quot;sans-serif&quot;; mso-fareast-language: ES-CL">
                        A. MARÍA DE LA LUZ GALLEGUILLOS A.</span></b><span 
                            style="font-size: 10.0pt; font-family: &quot;Arial&quot;,&quot;sans-serif&quot;; mso-fareast-language: ES-CL">
                        </span>
                        <span style="font-size: 12.0pt; font-family: &quot;Times New Roman&quot;,&quot;serif&quot;; mso-fareast-language: ES-CL"><o:p></o:p>
                        </span>
                    </p>
                </td>
            </tr>
            <tr style="mso-yfti-irow: 2; mso-yfti-lastrow: yes">
                <td style="padding: 0cm 0cm 0cm 0cm">
                    <p class="MsoNormal">
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl="~/Documentos/Ley.aspx">Infórmese sobre la Ley</asp:HyperLink>
                        <span style="font-size: 12.0pt; font-family: &quot;Times New Roman&quot;,&quot;serif&quot;; mso-fareast-language: ES-CL">
                        &nbsp;<o:p></o:p></span></p>
                </td>
            </tr>
            <tr style="mso-yfti-irow: 2; mso-yfti-lastrow: yes">
                <td style="padding: 0cm 0cm 0cm 0cm">
                    <%--<center><embed src="videos/comiteparitario_5.00(1).mp4" width="800px" height="500px" autostart="false" menu="true"></center> --%>
                    </td>
            </tr>
        </table>
</div>
<p class="MsoNormal">
    <span lang="ES-CL" 
        style="font-size: 12.0pt; font-family: &quot;Times New Roman&quot;,&quot;serif&quot;; mso-ansi-language: ES-CL; mso-fareast-language: ES-CL"><o:p>
    &nbsp;</o:p></span></p>
<div align="center">
    <table border="0" cellpadding="0" cellspacing="0" class="style1" 
        style="mso-cellspacing: 0cm; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 0cm 0cm 0cm" 
        width="562">
        <tr style="mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes; height: 129.0pt">
            <td style="width: 123.0pt; padding: 0cm 0cm 0cm 0cm; height: 129.0pt" 
                width="164">
                <table border="0" cellpadding="0" cellspacing="0" class="style2" 
                    style="mso-cellspacing: 0cm; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 0cm 0cm 0cm" 
                    width="151">
                    <tr style="mso-yfti-irow: 0; mso-yfti-firstrow: yes">
                        <td style="padding: 0cm 0cm 0cm 0cm">
                            <p class="MsoNormal">
                                <asp:Image ID="Image1" runat="server" ImageUrl="trabajador.jpg" />
                                <span style="font-size: 12.0pt; font-family: &quot;Times New Roman&quot;,&quot;serif&quot;; mso-fareast-language: ES-CL">
                                <!--[if gte vml 1]><v:shapetype id="_x0000_t75"
     coordsize="21600,21600" o:spt="75" o:preferrelative="t" path="m@4@5l@4@11@9@11@9@5xe"
     filled="f" stroked="f">
     <v:stroke joinstyle="miter" xmlns:v="urn:schemas-microsoft-com:vml"/>
     <v:formulas>
      <v:f eqn="if lineDrawn pixelLineWidth 0" xmlns:v="urn:schemas-microsoft-com:vml"/>
      <v:f eqn="sum @0 1 0" xmlns:v="urn:schemas-microsoft-com:vml"/>
      <v:f eqn="sum 0 0 @1" xmlns:v="urn:schemas-microsoft-com:vml"/>
      <v:f eqn="prod @2 1 2" xmlns:v="urn:schemas-microsoft-com:vml"/>
      <v:f eqn="prod @3 21600 pixelWidth" xmlns:v="urn:schemas-microsoft-com:vml"/>
      <v:f eqn="prod @3 21600 pixelHeight" xmlns:v="urn:schemas-microsoft-com:vml"/>
      <v:f eqn="sum @0 0 1" xmlns:v="urn:schemas-microsoft-com:vml"/>
      <v:f eqn="prod @6 1 2" xmlns:v="urn:schemas-microsoft-com:vml"/>
      <v:f eqn="prod @7 21600 pixelWidth" xmlns:v="urn:schemas-microsoft-com:vml"/>
      <v:f eqn="sum @8 21600 0" xmlns:v="urn:schemas-microsoft-com:vml"/>
      <v:f eqn="prod @7 21600 pixelHeight" xmlns:v="urn:schemas-microsoft-com:vml"/>
      <v:f eqn="sum @10 21600 0" xmlns:v="urn:schemas-microsoft-com:vml"/>
     </v:formulas>
     <v:path o:extrusionok="f" gradientshapeok="t" o:connecttype="rect" 
                                    xmlns:v="urn:schemas-microsoft-com:vml"/>
     <o:lock v:ext="edit" aspectratio="t" xmlns:o="urn:schemas-microsoft-com:office:office"/>
    </v:shapetype><v:shape id="Imagen_x0020_1" o:spid="_x0000_i1025" type="#_x0000_t75"
     alt="Descripción: http://www.paritarios.cl/images/minero1-chico.jpg"
     style='width:112.5pt;height:125.25pt'>
     <v:imagedata src="file:///C:\DOCUME~1\ADMINI~1\LOCALS~1\Temp\msohtmlclip1\01\clip_image001.jpg"
      o:href="cid:image001.jpg@01CC0F0A.87E71620" xmlns:v="urn:schemas-microsoft-com:vml"/>
    </v:shape><![endif]--><o:p></o:p></span></p>
                        </td>
                    </tr>
                    <tr style="mso-yfti-irow: 1; mso-yfti-lastrow: yes; height: 105.0pt">
                        <td style="padding: 0cm 0cm 0cm 0cm; height: 105.0pt">
                            <p class="MsoNormal">
                                <span style="font-size: 10.0pt; font-family: &quot;Arial&quot;,&quot;sans-serif&quot;; mso-fareast-language: ES-CL">
                                &nbsp;</span><span 
                                    style="font-size: 12.0pt; font-family: &quot;Times New Roman&quot;,&quot;serif&quot;; mso-fareast-language: ES-CL"> <o:p></o:p>
                                </span>
                            </p>
                            <table border="0" cellpadding="0" cellspacing="0" class="style3" 
                                style="mso-cellspacing: 0cm; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 0cm 0cm 0cm" 
                                width="131">
                                <tr style="mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes">
                                    <td style="padding: 0cm 0cm 0cm 0cm">
                                        <p class="MsoNormal">
                                            <i>
                                            <span style="font-size: 10.0pt; font-family: &quot;Arial&quot;,&quot;sans-serif&quot;; mso-fareast-language: ES-CL">
                                            Los comités paritarios velan por que los trabajadores cumplan con medidas para 
                                            prevenir accidentes, como el uso de casco y guantes</span></i><span 
                                                style="font-size: 12.0pt; font-family: &quot;Times New Roman&quot;,&quot;serif&quot;; mso-fareast-language: ES-CL"><o:p></o:p></span></p>
                                    </td>
                                </tr>
                            </table>
                            <p class="MsoNormal">
                                <i>
                                <span style="font-size: 10.0pt; font-family: &quot;Arial&quot;,&quot;sans-serif&quot;; mso-fareast-language: ES-CL">
                                .</span></i><span 
                                    style="font-size: 12.0pt; font-family: &quot;Times New Roman&quot;,&quot;serif&quot;; mso-fareast-language: ES-CL"><o:p></o:p></span></p>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 298.5pt; padding: 0cm 0cm 0cm 0cm; height: 129.0pt" 
                valign="top" width="398">
                <p class="MsoNormal">
                    <span style="font-size: 10.0pt; font-family: &quot;Arial&quot;,&quot;sans-serif&quot;; mso-fareast-language: ES-CL">
                    Toda empresa que tenga más de 25 trabajadores debe crear un Comité Paritario de 
                    Higiene y Seguridad, es decir, un equipo que colabore en la búsqueda de 
                    soluciones efectivas de mejoramiento en el ámbito de la prevención de accidentes 
                    del trabajo y enfermedades profesionales. Éste debe tener seis miembros 
                    titulares, cada uno con su respectivo suplente. Tres son representantes de la 
                    empresa y son designados. Los otros tres son trabajadores elegidos por votación 
                    directa. Duran dos años, con posibilidad de reelección. Deben ser mayores de 18 
                    años, saber leer y escribir, y participar en un curso de prevención de riesgos 
                    dictado por un organismo como la Asociación Chilena de Seguridad, la Mutual de 
                    Seguridad o el Instituto de Seguridad del Trabajo. </span>
                    <span style="font-size: 12.0pt; font-family: &quot;Times New Roman&quot;,&quot;serif&quot;; mso-fareast-language: ES-CL"><o:p></o:p>
                    </span>
                </p>
                <p class="MsoNormal">
                    <span style="font-size: 10.0pt; font-family: &quot;Arial&quot;,&quot;sans-serif&quot;; mso-fareast-language: ES-CL">
                    La ley les asigna funciones: instruir y motivar a los trabajadores en el uso 
                    correcto de los elementos de protección personal; velar por el cumplimiento de 
                    las medidas de prevención, higiene y seguridad; investigar las causas de los 
                    accidentes en el trabajo y enfermedades profesionales y promover la realización 
                    de actividades de capacitación. </span>
                    <span style="font-size: 12.0pt; font-family: &quot;Times New Roman&quot;,&quot;serif&quot;; mso-fareast-language: ES-CL"><o:p></o:p>
                    </span>
                </p>
            </td>
        </tr>
    </table>
</div>
    <p>
        &nbsp;</p>
</asp:Content>
