<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Reportes.aspx.cs" Inherits="Administracion_Reportes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript" src="../Scripts/jquery-1.4.1.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#divNoHanVotado').hide();
        $('#divHanVotado').hide();
        $('#divVotaciones').hide();
        $('#ctl00_MainContent_hlHanVotado').click(function () {
            $('#divNoHanVotado').hide();
            $('#divHanVotado').show();
            $('#divVotaciones').hide();
        });
        $('#ctl00_MainContent_hlNoHanVotado').click(function () {
            $('#divNoHanVotado').show();
            $('#divHanVotado').hide();
            $('#divVotaciones').hide();
        });
        $('#ctl00_MainContent_hlVotaciones').click(function () {
            $('#divNoHanVotado').hide();
            $('#divHanVotado').hide();
            $('#divVotaciones').show();
        });

    });

</script>
    <table style="width: 100%;">
        <tr>
            <td colspan="2">
                <table style="width:100%;">
                    <tr>
                        <td class="importante">
                            <asp:Literal ID="litMensajeHanVotado" runat="server"></asp:Literal>
&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:HyperLink ID="hlHanVotado" runat="server" NavigateUrl="#">Ver...</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="importante">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td class="importante">
                            <asp:Literal ID="litMensajeNoHanVotado" runat="server"></asp:Literal>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:HyperLink ID="hlNoHanVotado" runat="server" NavigateUrl="#">Ver...</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="importante">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td class="importante">
                            <asp:Literal ID="litMensajeVotaciones" runat="server"></asp:Literal>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:HyperLink ID="hlVotaciones" runat="server" NavigateUrl="#">Ver...</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="importante">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td class="importante">
                            <input type="button" value="Imprimir" name="imprimir" onclick="window.print();" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <td colspan="2">
            <div id="divNoHanVotado" style="width: 100%">
                <table width="100%">
                    <tr>
                        <td colspan="2" class="subTitulo">
                            Listado de Usuarios que aún no han votado
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="grillaNoHanVotado" runat="server" Width="100%" 
                                BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="3" GridLines="Horizontal">
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
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </div>
        </td>
        </tr>
        <tr>
            <td colspan="2">
                <div id="divHanVotado" style="width: 100%">
                    <table width="100%">
                        <tr>
                            <td colspan="2" class="subTitulo">
                                Listado de Usuarios que ya han Votado
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="grillaHanVotado" runat="server" Width="100%" 
                                    BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                                    CellPadding="2" ForeColor="Black" GridLines="None">
                                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                    <FooterStyle BackColor="Tan" />
                                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                                        HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                    <SortedAscendingCellStyle BackColor="#FAFAE7" />
                                    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                                    <SortedDescendingCellStyle BackColor="#E1DB9C" />
                                    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                                </asp:GridView>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div id="divVotaciones" style="width: 100%">
                    <table width="100%">
                        <tr>
                            <td colspan="2" class="subTitulo">
                                Listado de Votaciones
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="grillaVotaciones" runat="server" Width="100%" 
                                    BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                                    CellPadding="3" GridLines="Vertical">
                                    <AlternatingRowStyle BackColor="#DCDCDC" />
                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#000065" />
                                </asp:GridView>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>

