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
                Int32 countUser = Convert.ToInt32(cmd.ExecuteScalar());
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

        public static Boolean updateDetail(string idcar, string quantityDays, string quantityCars, Int32 quantityStock)
        {
            Boolean redirect = false;
            try
            {
                MySqlConnection connectionBd = getConnection();
            string query = "update carlessor.autos set diaalquilado = @diaalquilado, cantidadauto = @cantidadauto, stock = @stock  where idautos = @idautos";
            MySqlCommand cmd;
            cmd = new MySqlCommand(query, connectionBd);
            cmd.Parameters.AddWithValue("@idautos", idcar);
            cmd.Parameters.AddWithValue("@diaalquilado", quantityDays);
            cmd.Parameters.AddWithValue("@cantidadauto", quantityCars);
            cmd.Parameters.AddWithValue("@stock", quantityStock);
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
            throw new NotImplementedException();
        }

    }
}