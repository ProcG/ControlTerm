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
        public int PegarTemperatura(int codUsuario)//isso é um metodo que retornar INT
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT temperatura FR OM Temperatura WHERE codTemperatura = (SELECT MAX(codTemperatura) FROM Temperatura) AND codArduino = (SELECT codArduino FROM Arduino WHERE codUsuario = " + codUsuario + ")", conn))
                {
                    
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read() == true)
                        {
                            return int.Parse(dr["temperatura"].ToString()); // retorna a temperatura que esta no banco
                        }
                        else
                        {
                            return codUsuario; // se não existir nenhuma temperatura no banco ele retornar 0 (****pode ser qualquer numero aqui)
                        }
                    }

                }
            }
        }

        public int PegarTempMinima()
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT minima FROM Controle WHERE codControle = (SELECT MAX(codControle) FROM Controle)", conn))
                {

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read() == true)
                        {
                            return int.Parse(dr["minima"].ToString()); // retorna a temperatura que esta no banco
                        }
                        else
                        {
                            return 0; // se não existir nenhuma temperatura no banco ele retornar 0 (****pode ser qualquer numero aqui)
                        }
                    }

                }
            }
        }

        public int Pegar2Quartil()
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT minima FROM Controle WHERE codControle = (SELECT MAX(codControle) FROM Controle)", conn))
                {

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read() == true)
                        {
                            return int.Parse(dr["minima"].ToString()); // retorna a temperatura que esta no banco
                        }
                        else
                        {
                            return 0; // se não existir nenhuma temperatura no banco ele retornar 0 (****pode ser qualquer numero aqui)
                        }
                    }

                }
            }
        }

        public int PegarMediana()
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT minima FROM Controle WHERE codControle = (SELECT MAX(codControle) FROM Controle)", conn))
                {

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read() == true)
                        {
                            return int.Parse(dr["minima"].ToString()); // retorna a temperatura que esta no banco
                        }
                        else
                        {
                            return 0; // se não existir nenhuma temperatura no banco ele retornar 0 (****pode ser qualquer numero aqui)
                        }
                    }

                }
            }
        }

        public int Pegar3Quartil()
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT minima FROM Controle WHERE codControle = (SELECT MAX(codControle) FROM Controle)", conn))
                {

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read() == true)
                        {
                            return int.Parse(dr["minima"].ToString()); // retorna a temperatura que esta no banco
                        }
                        else
                        {
                            return 0; // se não existir nenhuma temperatura no banco ele retornar 0 (****pode ser qualquer numero aqui)
                        }
                    }

                }
            }
        }

        public int PegarTempMaxima()
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT minima FROM Controle WHERE codControle = (SELECT MAX(codControle) FROM Controle)", conn))
                {

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read() == true)
                        {
                            return int.Parse(dr["minima"].ToString()); // retorna a temperatura que esta no banco
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
            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT minima FROM Controle WHERE codControle = (SELECT MAX(codControle) FROM Controle)", conn))
                {

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read() == true)
                        {
                            return int.Parse(dr["minima"].ToString()); // retorna a temperatura que esta no banco
                        }
                        else
                        {
                            return 0; // se não existir nenhuma temperatura no banco ele retornar 0 (****pode ser qualquer numero aqui)
                        }
                    }

                }
            }
        }


        public static int PegarMaxima()
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT maxima FROM Controle WHERE codControle = (SELECT MAX(codControle) FROM Controle)", conn))
                {

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read() == true)
                        {
                            return int.Parse(dr["maxima"].ToString()); // retorna a temperatura que esta no banco
                        }
                        else
                        {
                            return 0; // se não existir nenhuma temperatura no banco ele retornar 0 (****pode ser qualquer numero aqui)
                        }
                    }

                }
            }
        }

        public static void SetarMinimaEMaxima(int minima, int maxima)
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("INSERT INTO Controle(minima, maxima) VALUES(@min, @max)", conn))
                {
                    cmd.Parameters.AddWithValue("@min", minima);
                    cmd.Parameters.AddWithValue("@max", maxima);

                    cmd.ExecuteNonQuery();
                }
            }
        }


    }
}