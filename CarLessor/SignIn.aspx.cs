using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarLessor
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signIn_Click(object sender, EventArgs e)
        {
            //Validar que devolvera BD como confirmacion
            //Validar BD mostrar error si no existe de lo contrario redireccionar a la consulta de datos
            if (ConnectionSevice.SignIn(inputUser.Text, inputPassword.Text))
            {
                Response.Redirect("Pagina de consulta");
            }
            else
            {
                Response.Redirect("Pagina de error");
            }      
        }
    }
}