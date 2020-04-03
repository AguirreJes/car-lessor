<%@ Page Title="Iniciar sesion" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="CarLessor.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="card card-signin my-5">
                    <div class="card-body">
                        <h5 class="card-title text-center">Iniciar sesion</h5>
                        <div class="form-signin">
                            <div class="form-label-group">
                                <label for="inputEmail">Usuario</label>
                                <asp:TextBox ID="inputUser" runat="server" type="text" class="form-control" placeholder="Usuario" required="true"> </asp:TextBox> 
                            </div>
                            <div class="form-label-group">
                                <label for="inputPassword">Contrasena</label>
                                <asp:TextBox ID="inputPassword" runat="server" type="password" class="form-control" placeholder="Contrasena" required="true"> </asp:TextBox> 
                            </div>
                            <hr class="my-4">
                            <asp:Button ID="signIn" runat="server" Text="Iniciar sesion" class="btn btn-lg btn-block btn btn-dark text-uppercase" type="submit" OnClick="signIn_Click"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
