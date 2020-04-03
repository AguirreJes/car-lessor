using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarLessor
{
    public class ConnectionSevice
    {
        
        public static Boolean SignIn(String user, String pass)
        {
            
            Boolean response = false;
            String query = "select count(1) from carlessor.login where username = @username and password = @password";

            MySqlCommand cmd;
            cmd = new MySqlCommand(query, getConnection());
            cmd.Parameters.AddWithValue("@username", user);
            cmd.Parameters.AddWithValue("@password", pass);
            cmd.ExecuteNonQuery();
            Int32 countUser = Convert.ToInt32(cmd.ExecuteScalar());

            if (countUser > 0)
            {
                response = true;
            }
            return response;
        }

        public static MySqlConnection getConnection()
        {
            MySqlConnection con;
            con = new MySqlConnection("Data Source=localhost;Database=carlessor;User ID=root;Password=rootnitch;port=3306");
            con.Open();
            return con;
        }
    }
}