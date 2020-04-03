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
            if (GridViewDetail.Rows.Count > 0)
            {
                foreach (GridView row in GridViewDetail.Rows)
                {
                    TextBox inputQuantityDays = (TextBox)row.FindControl("quantityDays");
                    TextBox inputQuantityCars = (TextBox)row.FindControl("quantityCar");

                    if(null != inputQuantityDays && null != inputQuantityCars)
                    {

                    }
                }
            }

        }
    }
}