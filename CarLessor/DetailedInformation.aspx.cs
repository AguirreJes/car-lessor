using CarLessor.Class;
using System;
using System.Web;
using System.Web.UI.WebControls;

namespace CarLessor
{
    public partial class DetailedInformation : System.Web.UI.Page
    {
        public string coverage;
        public static double totalAmount;
        public static double amount;
        public static double discount;
        public static string sex;

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
            if (GridViewDetail.Rows.Count > 0)
            {
                Random rnd = new Random();
                int idSale = rnd.Next(1000);
                for (int i = 0; i < GridViewDetail.Rows.Count; i++)
                {
                    TextBox inputQuantityDays = (TextBox)GridViewDetail.Rows[i].FindControl("quantityDay");
                    TextBox inputQuantityCars = (TextBox)GridViewDetail.Rows[i].FindControl("quantityCar");
                    Label labelquantityCarsBd = (Label)GridViewDetail.Rows[i].FindControl("stock");
                    Label labeltaxByCarsBd = (Label)GridViewDetail.Rows[i].FindControl("tarifadia");

                    sex = radioTypeSex.SelectedValue;
                    coverageInfo_SelectedIndexChanged(sender, e);

                    int quantityDays = !string.IsNullOrEmpty(inputQuantityDays.Text) ? Convert.ToInt32(inputQuantityDays.Text):0;
                    int quantityCars = !string.IsNullOrEmpty(inputQuantityCars.Text) ? Convert.ToInt32(inputQuantityCars.Text) : 0;
                    int quantityCarsBd = !string.IsNullOrEmpty(labelquantityCarsBd.Text) ? Convert.ToInt32(labelquantityCarsBd.Text) : 0;
                    double taxByCar = !string.IsNullOrEmpty(labeltaxByCarsBd.Text) ? Convert.ToDouble(labeltaxByCarsBd.Text) : 0;

                    Pricing pricingInfo = CalculateBySex(sex, quantityDays, quantityCars, taxByCar, coverage);

                    if (quantityDays > 0 && quantityCars > 0 && quantityCarsBd > 0)
                    {
                        Label inputIdCar = (Label)GridViewDetail.Rows[i].FindControl("idautos");
                        int idCar = !string.IsNullOrEmpty(inputIdCar.Text) ? Convert.ToInt32(inputIdCar.Text) : 0;
                        if (quantityCars <= quantityCarsBd)
                        {
                            int stockFinal = quantityCarsBd - quantityCars;
                            ConnectionSevice.updateDetail(idCar, inputQuantityDays.Text, inputQuantityCars.Text, stockFinal, pricingInfo.amount, pricingInfo.discount, pricingInfo.totalAmount);
                            ConnectionSevice.insertSale(idCar, idSale);
                            
                            totalAmount = totalAmount + pricingInfo.totalAmount;
                            amount = amount + pricingInfo.amount;
                            discount = discount + pricingInfo.discount;
                        }
                        else
                        {
                            BindDataList();
                            coverageInfo.ClearSelection();
                            radioTypeSex.ClearSelection();
                            Response.Write("<script>alert('Cantidad de autos ingresa es mayor a nuestro stock, Favor verifique') </script>");
                        }
                    }
                }
                

                if (ConnectionSevice.insertSaleDetail(idSale, sex, coverage, amount, discount, totalAmount))
                {
                    HttpContext.Current.Session["idSale"] = idSale;
                    Response.Redirect("~/DetailSale.aspx");
                }
            }
        }

        protected void coverageInfo_SelectedIndexChanged(object sender, EventArgs e)
        {
            coverage = coverageInfo.SelectedItem.Value;
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

        private Pricing CalculateBySex(string sex, int quantityDays, int quantityCars, double taxByCar, string coverage)
        {
            Pricing pricing = new Pricing();
            double coverageTax = ConnectionSevice.getCoverageById(coverage);
            
            pricing.amount = quantityDays * coverageTax * quantityCars * taxByCar;
            
            switch (sex)
            {
                case "M":
                    pricing.discount = quantityDays >=5 ? pricing.amount * 0.20 : pricing.amount * 0.05;
                    break;

                case "F":
                    pricing.discount = quantityDays >= 5 ? pricing.amount * 0.15 : pricing.amount * 0.10;
                    break;

                default:
                    Console.WriteLine("No llego el dato sexo");
                    break;
            }
            pricing.totalAmount = pricing.amount - pricing.discount;
            return pricing;
        }
    }
}