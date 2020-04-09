using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace CarLessor
{
    public class ConnectionSevice
    {
        public static Boolean SignIn(String user, String pass)
        {
            Boolean response = false;
            try
            {
                MySqlConnection connectionBd = getConnection();
                
                string query = "select count(1) from carlessor.login where username = @username and password = @password";
                MySqlCommand cmd;
                cmd = new MySqlCommand(query, connectionBd);
                cmd.Parameters.AddWithValue("@username", user);
                cmd.Parameters.AddWithValue("@password", pass);
                cmd.ExecuteNonQuery();
                int countUser = Convert.ToInt32(cmd.ExecuteScalar());
                connectionBd.Close();
                if (countUser > 0)
                {
                    response = true;
                }
            }
            catch (Exception exc)
            {
                showMessage("Error Message", exc.Message);
            }
            return response;
        }

        public static void DetailInformation(GridView gridView, string querySentence)
        {
            try
            {
                MySqlConnection connectionBd = getConnection();
                MySqlCommand cmd;
                cmd = new MySqlCommand(querySentence, connectionBd);
                gridView.DataSource = cmd.ExecuteReader();
                gridView.DataBind();
                connectionBd.Close();
            }
            catch (Exception exc)
            {
                showMessage("Error Message", exc.Message);
            }
            
        }

        public static void DetailInformation(GridView gridView, string querySentence, string idSale)
        {
            try
            {
                MySqlConnection connectionBd = getConnection();
                MySqlCommand cmd;
                cmd = new MySqlCommand(querySentence, connectionBd);
                cmd.Parameters.AddWithValue("@idcompra", idSale);
                gridView.DataSource = cmd.ExecuteReader();
                gridView.DataBind();
                connectionBd.Close();
            }
            catch (Exception exc)
            {
                showMessage("Error Message", exc.Message);
            }

        }

        public static void updateDetail(int idcar, string quantityDays, string quantityCars, int quantityStock, double amount, double discount, double totalAmount)
        {
            try
            {
                MySqlConnection connectionBd = getConnection();
            string query = "update carlessor.autos set diaalquilado = @diaalquilado, cantidadauto = @cantidadauto, stock = @stock, subtotal = @subtotal, descuento = @descuento, total = @total  where idautos = @idautos";
            MySqlCommand cmd;
            cmd = new MySqlCommand(query, connectionBd);
                
            cmd.Parameters.AddWithValue("@idautos", idcar);
            cmd.Parameters.AddWithValue("@diaalquilado", quantityDays);
            cmd.Parameters.AddWithValue("@cantidadauto", quantityCars);
            cmd.Parameters.AddWithValue("@stock", quantityStock);
            cmd.Parameters.AddWithValue("@subtotal", String.Format("{0:0.00}", amount));
            cmd.Parameters.AddWithValue("@descuento", String.Format("{0:0.00}", discount));
            cmd.Parameters.AddWithValue("@total", String.Format("{0:0.00}", totalAmount));
            cmd.ExecuteNonQuery();
            connectionBd.Close();
            }
            catch (Exception exc)
            {
                showMessage("Error Message", exc.Message);
            }

        }

        public static void DropDownListInfo(DropDownList dropDownList, string querySentence)
        {
            try
            {
                MySqlConnection connectionBd = getConnection();
                MySqlCommand cmd;
                cmd = new MySqlCommand(querySentence, connectionBd);
                dropDownList.DataSource = cmd.ExecuteReader();
                dropDownList.DataTextField = "descripcion";
                dropDownList.DataValueField = "tipo";
                dropDownList.DataBind();
                connectionBd.Close();
                dropDownList.Items.Insert(0, new ListItem("Seleccionar", "Seleccionar"));
            }        
            catch (Exception exc)
            {
                showMessage("Error Message", exc.Message);
            }
        }

        public static double getCoverageById(String id)
        {
            double tax = 0;
            try
            {
                MySqlConnection connectionBd = getConnection();

                string query = "select valor from carlessor.cobertura where tipo = @tipo";
                MySqlCommand cmd;
                cmd = new MySqlCommand(query, connectionBd);
                cmd.Parameters.AddWithValue("@tipo", id);
                cmd.ExecuteNonQuery();
                tax = Convert.ToDouble(cmd.ExecuteScalar());
                connectionBd.Close();
            }
            catch (Exception exc)
            {
                showMessage("Error Message", exc.Message);
            }
            return tax;
        }

        public static void insertSale(int idCar, int idSale)
        {
            try
            {
                MySqlConnection connectionBd = getConnection();

                string query = "INSERT INTO carlessor.autos_has_compra(autos_idautos,compra_idcompra) VALUES (@idauto,@idcompra)";
                MySqlCommand cmd;
                cmd = new MySqlCommand(query, connectionBd);
                cmd.Parameters.AddWithValue("@idauto", idCar);
                cmd.Parameters.AddWithValue("@idcompra", idSale);
                cmd.ExecuteNonQuery();
                connectionBd.Close();
            }
            catch (Exception exc)
            {
                showMessage("Error Message", exc.Message);
            }
        }

        public static Boolean insertSaleDetail(int idSale, string sex, string coverage, double amount, double discount, double totalAmount)
        {
            Boolean redirect = false;
            try
            {
                MySqlConnection connectionBd = getConnection();
                string query = "INSERT INTO carlessor.compra(idcompra,sexo,cobertura,csubtotal,cdescuento,ctotal) VALUES(@idcompra, @idsexo, @idcobertura, @idamount, @iddescuento, @idtotalamount);";
                MySqlCommand cmd;
                cmd = new MySqlCommand(query, connectionBd);
                cmd.Parameters.AddWithValue("@idcompra", idSale);
                cmd.Parameters.AddWithValue("@idsexo", sex);
                cmd.Parameters.AddWithValue("@idcobertura", coverage);
                cmd.Parameters.AddWithValue("@idamount", String.Format("{0:0.00}", amount));
                cmd.Parameters.AddWithValue("@iddescuento", String.Format("{0:0.00}", discount));
                cmd.Parameters.AddWithValue("@idtotalamount", String.Format("{0:0.00}",totalAmount));
                cmd.ExecuteNonQuery();
                connectionBd.Close();
                redirect = true;
            }
            catch (Exception exc)
            {
                showMessage("Error Message", exc.Message);
            }
            return redirect;
        }

        private static MySqlConnection getConnection()
        {
            MySqlConnection con;
            con = new MySqlConnection("Data Source=localhost;Database=carlessor;User ID=root;Password=rootnitch;port=3306");
            try
            {
                con.Open();
            }
            catch (Exception exc)
            {
                showMessage("Error Message", exc.Message);
            }
            return con;
        }

        private static void showMessage(string v, string message)
        {
            throw new NotImplementedException(message);
        }

    }
}