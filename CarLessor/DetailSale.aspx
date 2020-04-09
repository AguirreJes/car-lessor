<%@ Page Title="Detalle compra" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetailSale.aspx.cs" Inherits="CarLessor.DetailSale" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="alert alert-warning" role="alert" id="bannerAlertTax">
            <p>Si usted es de sexo femenino, su deducible tendrá un valor de $250.00 y si es de sexo masculino será de $300.00</p>
        </div>
        <h5 class="text-center text-uppercase" id="titleInventory">Detalle compra</h5>
        <asp:GridView ID="GridViewDetailSale" CssClass="table table-bordered" HeaderStyle-CssClass="bg-dark text-white" AutoGenerateColumns="False" runat="server">
            <Columns>
                <asp:BoundField HeaderText="Id de compra" DataField="idcompra" />
                <asp:BoundField HeaderText="Sexo" DataField="sexo" />
                <asp:BoundField HeaderText="Cobertura" DataField="cobertura" />
                <asp:BoundField HeaderText="Subtotal" DataField="csubtotal" />
                <asp:BoundField HeaderText="Descuento" DataField="cdescuento" />
                <asp:BoundField HeaderText="Total" DataField="ctotal" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
