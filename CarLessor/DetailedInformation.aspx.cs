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
            ConnectionSevice.DetailInformation(inventoryCar: GridViewDetail);
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
                    string quantityDays = inputQuantityDays.Text;
                    string quantityCars = inputQuantityCars.Text;

                    if (!string.IsNullOrEmpty(quantityDays) && !string.IsNullOrEmpty(quantityCars))
                    {
                        Label inputIdCar = (Label)GridViewDetail.Rows[i].FindControl("idautos");
                        redirect = ConnectionSevice.updateDetail(inputIdCar.Text, inputQuantityDays.Text, inputQuantityCars.Text);      
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