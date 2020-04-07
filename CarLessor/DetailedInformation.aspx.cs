using CarLessor.Class;
using System;
using System.Web.UI.WebControls;

namespace CarLessor
{
    public partial class DetailedInformation : System.Web.UI.Page
    {
        //Protected Methods
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDataList();
                BindDropDownList();
            }
        }

        protected void sendDetail_Click(object sender, EventArgs e)
        {
            Boolean redirect = false;
            if (GridViewDetail.Rows.Count > 0)
            {
                for (int i = 0; i < GridViewDetail.Rows.Count; i++)
                {
                    TextBox inputQuantityDays = (TextBox)GridViewDetail.Rows[i].FindControl("quantityDay");
                    TextBox inputQuantityCars = (TextBox)GridViewDetail.Rows[i].FindControl("quantityCar");
                    Label labelquantityCarsBd = (Label)GridViewDetail.Rows[i].FindControl("stock");
                    Label labeltaxByCarsBd = (Label)GridViewDetail.Rows[i].FindControl("tarifadia");

                    string sex = Request.Form["radioTypeSex"].ToString();
                    string coverage = Request.Form["coverageInfo"].ToString();

                    Int32 quantityDays = !string.IsNullOrEmpty(inputQuantityDays.Text) ? Convert.ToInt32(inputQuantityDays.Text):0;
                    Int32 quantityCars = !string.IsNullOrEmpty(inputQuantityCars.Text) ? Convert.ToInt32(inputQuantityCars.Text) : 0;
                    Int32 quantityCarsBd = !string.IsNullOrEmpty(labelquantityCarsBd.Text) ? Convert.ToInt32(labelquantityCarsBd.Text) : 0;
                    double taxByCar = !string.IsNullOrEmpty(labeltaxByCarsBd.Text) ? Convert.ToDouble(labeltaxByCarsBd.Text) : 0;

                    Pricing response = CalculateBySex(sex, quantityDays, taxByCar, coverage);

                    if (quantityDays > 0 && quantityCars > 0 && quantityCarsBd > 0)
                    {
                        Label inputIdCar = (Label)GridViewDetail.Rows[i].FindControl("idautos");
                        if (quantityCars <= quantityCarsBd)
                        {
                            Int32 stockFinal = quantityCarsBd - quantityCars;
                            redirect = ConnectionSevice.updateDetail(inputIdCar.Text, inputQuantityDays.Text, inputQuantityCars.Text, stockFinal);
                        }
                        else
                        {
                            Response.Write("<div class=+"+"alert alert-danger"+"+>strong>Error!</strong>Cantidad de autos ingresa es mayor a nuestro stock, Favor verifique</div>");
                        }
                    }
                }
                if (redirect)
                {
                    Response.Redirect("~/FormFinal.aspx");
                }
            }
        }

        //Private Methods
        private void BindDataList()
        {
            string query = "select * from carlessor.autos";
            ConnectionSevice.DetailInformation(gridView: GridViewDetail, query);
        }

        private void BindDropDownList()
        {
            string query = "select * from carlessor.cobertura";
            ConnectionSevice.DropDownListInfo(dropDownList: coverageInfo, query);
        }

        private Pricing CalculateBySex(string sex, Int32 quantityDays, double taxByCar, string coverage)
        {
            Pricing pricing = new Pricing();
            double coverageTax = ConnectionSevice.getCoverageById(coverage);
    
            switch (sex)
            {
                case "M":
                    pricing.amount = pricing.amount + 1;
                    pricing.discount = pricing.amount + 1;
                    break;

                case "F":
                    break;

                default:
                    Console.WriteLine("No llego el dato sexo");
                    break;
            }
            return pricing;
        }
    }
}