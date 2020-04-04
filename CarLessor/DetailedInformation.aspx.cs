using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarLessor
{
    public partial class DetailedInformation : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindDataList();
            }
        }

        private void BindDataList()
        {
            string query = "select * from carlessor.autos";
            ConnectionSevice.DetailInformation(gridView: GridViewDetail, query);
        }

        protected void sendDetail_Click(object sender, EventArgs e)
        {
            Boolean redirect = false;
            if (GridViewDetail.Rows.Count > 0)
            {
                for(int i = 0; i < GridViewDetail.Rows.Count; i++)
                {
                    TextBox inputQuantityDays = (TextBox)GridViewDetail.Rows[i].FindControl("quantityDay");
                    TextBox inputQuantityCars = (TextBox)GridViewDetail.Rows[i].FindControl("quantityCar");
                    Label labelquantityCarsBd = (Label)GridViewDetail.Rows[i].FindControl("stock");

                    string quantityDays = inputQuantityDays.Text;
                    string quantityCars = inputQuantityCars.Text;
                    string quantityCarsBd = labelquantityCarsBd.Text;

                    if (!string.IsNullOrEmpty(quantityDays) && !string.IsNullOrEmpty(quantityCars) && !string.IsNullOrEmpty(quantityCarsBd))
                    {
                        Label inputIdCar = (Label)GridViewDetail.Rows[i].FindControl("idautos");
                        if (Convert.ToInt32(quantityCars) <= Convert.ToInt32(quantityCarsBd))
                        {
                            Int32 stockFinal = Convert.ToInt32(quantityCarsBd) - Convert.ToInt32(quantityCars);
                            redirect = ConnectionSevice.updateDetail(inputIdCar.Text, inputQuantityDays.Text, inputQuantityCars.Text, stockFinal);
                        }
                        else
                        {

                        }
                            
                    }
                }
            }
            if (redirect) 
                {
                    Response.Redirect("~/FormFinal.aspx");
                }
            else
                {
                    Response.Redirect("~/ErrorSignIn.aspx");
                }
        }
    }
}