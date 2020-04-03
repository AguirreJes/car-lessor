<%@ Page Title="Iniciar sesion" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="CarLessor.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="card card-signin my-5">
                    <div class="card-body">
                        <h5 class="card-title text-center">Iniciar sesion</h5>
                        <form class="form-signin">
                            <div class="form-label-group">
                                <label for="inputEmail">Usuario</label>
                                <input type="text" id="inputEmail" class="form-control" placeholder="Usuario" required autofocus>  
                            </div>
                            <div class="form-label-group">
                                <label for="inputPassword">Contrasena</label>
                                <input type="password" id="inputPassword" class="form-control" placeholder="Contrasena" required>    
                            </div>
                            <hr class="my-4">
                            <button class="btn btn-lg btn-block btn btn-dark text-uppercase" type="submit" >Iniciar sesion</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
