<%@ Page Title="Informacion detallada" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="DetailedInformation.aspx.cs" Inherits="CarLessor.DetailedInformation" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-4">
        <h5 class="text-center text-uppercase">Inventario de autos</h5>
        <asp:GridView ID="GridViewDetail" CssClass="table table-bordered" HeaderStyle-CssClass="bg-dark text-white" AutoGenerateColumns="False" runat="server">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="idautos" />
                <asp:BoundField HeaderText="Modelo" DataField="modelo" />
                <asp:BoundField HeaderText="Año" DataField="año" />
                <asp:BoundField HeaderText="Tarifa día" DataField="tarifadia" />
                <asp:BoundField HeaderText="Cantidad disponible" DataField="stock" />
                <asp:TemplateField HeaderText="Ingrese cantidad de autos">
                    <ItemTemplate>
                        <asp:TextBox ID="quantityCar" runat="server"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ingrese cantidad de dias">
                    <ItemTemplate>
                        <asp:TextBox ID="quantityDays" runat="server"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="bg-dark text-white"></HeaderStyle>
        </asp:GridView>
        <div class="row">
            <div class="col-2">
                <asp:Button ID="sendDetail" runat="server" Text="Guardar" class="btn btn-lg btn-block btn btn-dark" type="submit" OnClick="sendDetail_Click"/>
            </div>
        </div>
    </div>
</asp:Content>
