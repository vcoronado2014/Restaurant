<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Inicio.aspx.cs" Inherits="Votaciones_Inicio" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width:100%;">
    <tr>
        <td>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </td>
    </tr>
    <tr>
        <td>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table style="width:100%;">
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                    DataSourceID="odsVotantes" Visible="False">
                                    <Columns>
                                        <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                                        <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" 
                                            SortExpression="NOMBRE" />
                                        <asp:BoundField DataField="RUT" HeaderText="RUT" SortExpression="RUT" />
                                        <asp:BoundField DataField="CANTIDADVOTACIONES" HeaderText="CANTIDADVOTACIONES" 
                                            SortExpression="CANTIDADVOTACIONES" />
                                    </Columns>
                                </asp:GridView>
                                <asp:GridView ID="grillaIntentos" runat="server" Visible="False">
                                </asp:GridView>
                                <asp:ObjectDataSource ID="odsVotantes" runat="server" 
                                    SelectMethod="ListaVotantesNuevo" TypeName="Votaciones.Negocio.Listados">
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="importante">
                                <strong>Importante:</strong> Antes de votar debe asegurarse que efectivamente 
                                ese sea su voto, no podrá volver a votar luego de haberlo hecho por primera vez, 
                                debe contar además con su Identificador único el cual le permitirá votar. Para 
                                obtener su identificador debe seleccionar &quot;Solicitud/Verificación de Key&quot; del 
                                Menu. No puede votar por Ud. mismo.</td>
                        </tr>
                        <tr>
                            <td class="subTitulo">
                                Lista de Candidatos a Votar.</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButtonList ID="rdblVotantes" runat="server" 
                                    DataSourceID="odsVotantes" DataTextField="NOMBRE" DataValueField="ID" 
                                    Font-Size="7pt" Height="20px" RepeatColumns="4" Width="100%">
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 15px">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="subTitulo">
                                Su Votación</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="grillaSuVoto" runat="server" BackColor="White" 
                                    BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                                    GridLines="Horizontal" Width="60%">
                                    <AlternatingRowStyle BackColor="#F7F7F7" />
                                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="subTitulo">
                                Graficos de Votaciones</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:ObjectDataSource ID="odsMaxSeis" runat="server" 
                                    SelectMethod="ListaSeisVotacionesMaximasNuevo" 
                                    TypeName="Votaciones.Negocio.Listados"></asp:ObjectDataSource>
                                <asp:Chart ID="Chart1" runat="server" DataSourceID="odsMaxSeis" Height="250px" 
                                    Width="850px" Palette="Excel">
                                    <series>
                                        <asp:Series Font="Microsoft Sans Serif, 7pt" MarkerSize="50" Name="Series1" 
                                            XValueMember="NOMBRE" YValueMembers="CANTIDADVOTACIONES" 
                                            BackGradientStyle="VerticalCenter" BackImageAlignment="Top" 
                                            CustomProperties="DrawingStyle=Cylinder, EmptyPointValue=Zero, PointWidth=0.6, DrawSideBySide=True" 
                                            IsValueShownAsLabel="True" IsVisibleInLegend="False" LabelAngle="90" 
                                            Palette="Excel" XValueType="String">
                                            <SmartLabelStyle CalloutLineAnchorCapStyle="Diamond" />
                                        </asp:Series>
                                    </series>
                                    <chartareas>
                                        <asp:ChartArea Name="ChartArea1">
                                            <Area3DStyle Enable3D="True" IsClustered="True" />
                                        </asp:ChartArea>
                                    </chartareas>
                                    <Titles>
                                        <asp:Title Name="Votaciones">
                                        </asp:Title>
                                    </Titles>
                                </asp:Chart>
                            </td>
                        </tr>
                        <tr>
                            <td class="errorMensaje">
                                <asp:Literal ID="litMensaje" runat="server"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnVotar" EventName="Click">
                    </asp:AsyncPostBackTrigger>
                </Triggers>
            </asp:UpdatePanel>
            <br />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="btnVotar" runat="server" onclick="btnVotar_Click" 
                Text="Votar" />
        </td>
    </tr>
    </table>
</asp:Content>

