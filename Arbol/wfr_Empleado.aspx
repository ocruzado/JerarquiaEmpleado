<%@ Page Title="" Language="C#" MasterPageFile="~/smp_Master.Master" AutoEventWireup="true" CodeBehind="wfr_Empleado.aspx.cs" Inherits="Arbol.wfr_Empleado" %>

<asp:Content ID="c_Contenido" ContentPlaceHolderID="cph_Content" runat="server">

    <div class="row">
        <div class="col-md-12 text-center">

            <asp:Button ID="btn_GenerarData" runat="server" Text="Generar Data Aleatoriamente" CssClass="btn btn-primary btn-lg" OnClick="btn_GenerarData_Click" />

        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h4>Tabla Empleado</h4>
            <asp:GridView ID="gvw_EmpleadoData" runat="server" CssClass="table table-striped small" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Id_Empleado" HeaderText="ID"></asp:BoundField>
                    <asp:BoundField DataField="Id_Padre" HeaderText="ID Padre"></asp:BoundField>
                    <asp:BoundField DataField="Emp_Nombre" HeaderText="Nombre"></asp:BoundField>
                    <asp:BoundField DataField="Emp_Fase" HeaderText="Fase"></asp:BoundField>
                    <asp:BoundField DataField="Emp_Horas" HeaderText="Horas" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                </Columns>
                <EmptyDataTemplate>
                    No Hay Datos
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
        <div class="col-md-8">



            <h4>Lista Consolidada de Horas</h4>
            <asp:GridView ID="gvw_EmpleadoConsolidado" runat="server" CssClass="table table-striped small" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Id_Empleado" HeaderText="ID"></asp:BoundField>
                    <asp:BoundField DataField="Emp_Nombre" HeaderText="Nombre"></asp:BoundField>

                    <asp:BoundField DataField="Fas_Analisis" HeaderText="ANALISIS" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                    <asp:BoundField DataField="Fas_Diseno" HeaderText="DISEÑO" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                    <asp:BoundField DataField="Fas_Desarrollo" HeaderText="DESARROLLO" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                    <asp:BoundField DataField="Fas_Pruebas" HeaderText="PRUEBAS" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                    <asp:BoundField DataField="Fas_Implantacion" HeaderText="IMPLEMENTACION" ItemStyle-HorizontalAlign="Center"></asp:BoundField>

                    <asp:BoundField DataField="Fas_Total" HeaderText="TOTAL" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                </Columns>
                <EmptyDataTemplate>
                    No Hay Datos
                </EmptyDataTemplate>
            </asp:GridView>

            <h4>Lista Consolidada de Horas</h4>
            <asp:Literal ID="lit_Arbol" runat="server" />

        </div>
    </div>

</asp:Content>
