using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Caliimperium
{
    public class Temperatura//isso é uma classe
    {
        public int PegarTemperatura()//isso é um metodo que retornar INT
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT temperatura FROM Temp WHERE codTemp = (SELECT MAX(codTemp) FROM Temp)", conn))
                {

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read() == true)
                        {
                            return int.Parse(dr["temperatura"].ToString()); // retorna a temperatura que esta no banco
                        }
                        else
                        {
                            return 0; // se não existir nenhuma temperatura no banco ele retornar 0 (****pode ser qualquer numero aqui)
                        }
                    }

                }
            }
        }

        public static int PegarMinima()
        {
            return 0;
        }

        public static int PegarMaxima()
        {
            return 0;
        }

    }
}