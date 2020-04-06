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
            <div class="form-group col-md-3">
                <div class="container">
                    <label>Sexo</label>
                    <div class="form-check form-check-inline">
                        <asp:RadioButtonList ID="radioTypeSex" runat="server" class="form-check-input" RepeatDirection="Horizontal">
                            <asp:ListItem Text="Masculino" Value="M"/>
                            <asp:ListItem Text="Femenino" Value="F"/>
                        </asp:RadioButtonList>
                    </div>
                </div>
            </div>
            <div class="form-group col-md-3">
                <div class="container">
                    <label>Cobertura</label>
                    <div class="form-check form-check-inline">
                        <asp:RadioButtonList ID="radioTypeCoverage" runat="server" class="form-check-input" RepeatDirection="Horizontal">
                            <asp:ListItem Text="Completo" Value="F"/>
                            <asp:ListItem Text="Parcial" Value="P"/>
                        </asp:RadioButtonList>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-2">
                <asp:Button ID="sendDetail" runat="server" Text="Guardar" class="btn btn-lg btn-block btn btn-dark" type="submit" OnClick="sendDetail_Click" />
            </div>
        </div>
    </div>
</asp:Content>
