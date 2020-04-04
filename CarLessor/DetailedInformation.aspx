<%@ Page Title="Informacion detallada" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="DetailedInformation.aspx.cs" Inherits="CarLessor.DetailedInformation" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <h5 class="text-center text-uppercase">Inventario de autos</h5>
        <asp:GridView ID="GridViewDetail" CssClass="table table-bordered" HeaderStyle-CssClass="bg-dark text-white" AutoGenerateColumns="False" runat="server">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="idautos" runat="server" Text='<%# Bind("idautos") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ImageField HeaderText="Imagen" ControlStyle-Height="140" ControlStyle-Width="160" DataImageUrlField="imagen">
                </asp:ImageField>
                <asp:BoundField HeaderText="Modelo" DataField="modelo" />
                <asp:BoundField HeaderText="Año" DataField="año" />
                <asp:BoundField HeaderText="Tarifa día" DataField="tarifadia" />
                <asp:BoundField HeaderText="Descripción" DataField="descripcion" />
                <asp:TemplateField HeaderText="Cantidad disponible">
                    <ItemTemplate>
                        <asp:Label ID="stock" runat="server" Text='<%# Bind("stock") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ingrese cantidad de autos">
                    <ItemTemplate>
                        <asp:TextBox ID="quantityCar" runat="server"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ingrese cantidad de dias">
                    <ItemTemplate>
                        <asp:TextBox ID="quantityDay" runat="server"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="bg-dark text-white"></HeaderStyle>
        </asp:GridView>
        <div class="row">
            <div class="col-2">
                <asp:Button ID="sendDetail" runat="server" Text="Guardar" class="btn btn-lg btn-block btn btn-dark" type="submit" OnClick="sendDetail_Click" />
            </div>
        </div>
    </div>
</asp:Content>
