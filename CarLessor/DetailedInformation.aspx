<%@ Page Title="Informacion detallada" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="DetailedInformation.aspx.cs" Inherits="CarLessor.DetailedInformation" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="alert alert-warning" role="alert" id="bannerAlertTax">
            <p>Si usted es de sexo femenino, su deducible tendrá un valor de $250.00 y si es de sexo masculino será de $300.00</p>
        </div>
        <h5 class="text-center text-uppercase" id="titleInventory">Inventario de autos</h5>
        <asp:GridView ID="GridViewDetail" CssClass="table table-bordered" HeaderStyle-CssClass="bg-dark text-white" AutoGenerateColumns="False" runat="server">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="idautos" runat="server" Text='<%# Bind("idautos") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ImageField HeaderText="Imagen" ControlStyle-Height="140" ControlStyle-Width="160" DataImageUrlField="imagen">
                    <ControlStyle Height="140px" Width="160px"></ControlStyle>
                </asp:ImageField>
                <asp:BoundField HeaderText="Modelo" DataField="modelo" />
                <asp:BoundField HeaderText="Año" DataField="año" />
                <asp:TemplateField HeaderText="Tarifa día">
                    <ItemTemplate>
                        <asp:Label ID="tarifadia" runat="server" Text='<%# Bind("tarifadia") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Descripción" DataField="descripcion" />
                <asp:TemplateField HeaderText="Cantidad disponible">
                    <ItemTemplate>
                        <asp:Label ID="stock" runat="server" Text='<%# Bind("stock") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cantidad de autos">
                    <ItemTemplate>
                        <asp:TextBox ID="quantityCar" runat="server" Width="100px" Max="9999" Min="1" CausesValidation="true" type="Number"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cantidad de dias">
                    <ItemTemplate>
                        <asp:TextBox ID="quantityDay" runat="server" Width="100px" Max="9999" Min="1" CausesValidation="true" type="Number"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="bg-dark text-white"></HeaderStyle>
        </asp:GridView>
        <h4 id="additionalDataSection">Datos adicionales</h4>
        <div class="row">
            <div class="form-group col-md-3">
                <div class="container">
                    <label class="font-weight-bold">Sexo</label>
                    <div class="form-check form-check-inline">
                        <asp:RadioButtonList ID="radioTypeSex" runat="server" class="form-check-input" RepeatDirection="Horizontal">
                            <asp:ListItem Text="Masculino" Value="M"/>
                            <asp:ListItem Text="Femenino" Value="F"/>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator runat="server" ID="SexRequired"
                            ControlToValidate="radioTypeSex" ErrorMessage="Seleccione una opción"
                            ValidationGroup="sendDetail">Seleccione un valor</asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="form-group col-md-3">
                <div class="container">
                    <label class="font-weight-bold">Cobertura</label>
                    <div>
                        <asp:DropDownList ID="coverageInfo" runat="server" OnSelectedIndexChanged="coverageInfo_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredCovegae" runat="server" ControlToValidate="coverageInfo"
                            ErrorMessage="Seleccione una opción" InitialValue="Seleccionar" SetFocusOnError="true" validationgroup="sendDetail"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-2">
                <asp:Button ID="sendDetail" runat="server" Text="Guardar" class="btn btn-lg btn-block btn btn-dark" type="submit" OnClick="sendDetail_Click" validationgroup="sendDetail"/>
            </div>
        </div>
    </div>
</asp:Content>
