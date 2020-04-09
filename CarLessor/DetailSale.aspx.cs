using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarLessor
{
    public partial class DetailSale : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string idSale = Convert.ToString(System.Web.HttpContext.Current.Session["idSale"]);
            string query = "SELECT * FROM carlessor.compra where idcompra = @idcompra";
            ConnectionSevice.DetailInformation(gridView: GridViewDetailSale, query, idSale);
        }
    }
}