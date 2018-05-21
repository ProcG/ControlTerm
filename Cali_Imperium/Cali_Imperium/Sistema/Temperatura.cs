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

        public void CadastrarArduino(string codigo, string tempMinima, string tempMaxima, int idUsuario)
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Arduino (codArduino, codUsuario, minima, maxima) VALUES(@cod,@id,@min,@max)", conn))
                {
                    cmd.Parameters.AddWithValue("@cod",codigo);
                    cmd.Parameters.AddWithValue("@id", idUsuario);
                    cmd.Parameters.AddWithValue("@min", tempMinima);
                    cmd.Parameters.AddWithValue("@max", tempMaxima);
                    
                    cmd.ExecuteNonQuery();
                    
                }
            }
        }

        public bool UsuarioTemArduino(int id)
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Arduino WHERE codUsuario = @id", conn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            return true;
                        }

                    }
                }
            }
            return false;        
        }


        public int PegarTemperatura(int codUsuario)//isso é um metodo que retornar INT
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT temperatura FROM Temperatura WHERE codTemperatura = (SELECT MAX(codTemperatura) FROM Temperatura) AND codArduino = (SELECT codArduino FROM Arduino WHERE codUsuario = @id)", conn))
                {
                    cmd.Parameters.AddWithValue("@id", codUsuario);
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

        public int PegarTempMinima(int id)
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("select min(temperatura) as 'minima' from temperatura where codArduino = (SELECT codArduino FROM Arduino where codUsuario = @id)", conn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
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

        public int Pegar2Quartil(int id)
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT DISTINCT PERCENTILE_CONT(0.25) WITHIN GROUP(ORDER BY temperatura) OVER(PARTITION BY 1) as '2q' from temperatura where codArduino = (SELECT codArduino FROM Arduino where codUsuario = @id)", conn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read() == true)
                        {
                            return int.Parse(dr["2q"].ToString()); // retorna a temperatura que esta no banco
                        }
                        else
                        {
                            return 0; // se não existir nenhuma temperatura no banco ele retornar 0 (****pode ser qualquer numero aqui)
                        }
                    }

                }
            }
        }

        public int PegarMediana(int id)
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT DISTINCT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY temperatura) OVER(PARTITION BY 1) as 'mediana' from temperatura where codArduino = (SELECT codArduino FROM Arduino where codUsuario = @id)", conn))
                {
                    cmd.Parameters.AddWithValue("@id",id);
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read() == true)
                        {
                            return int.Parse(dr["mediana"].ToString()); // retorna a temperatura que esta no banco
                        }
                        else
                        {
                            return 0; // se não existir nenhuma temperatura no banco ele retornar 0 (****pode ser qualquer numero aqui)
                        }
                    }

                }
            }
        }

        public int Pegar3Quartil(int id)
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT DISTINCT PERCENTILE_CONT(0.75) WITHIN GROUP(ORDER BY temperatura) OVER(PARTITION BY 1) as '3q' from temperatura where codArduino = (SELECT codArduino FROM Arduino where codUsuario = @id)", conn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read() == true)
                        {
                            return int.Parse(dr["3q"].ToString()); // retorna a temperatura que esta no banco
                        }
                        else
                        {
                            return 0; // se não existir nenhuma temperatura no banco ele retornar 0 (****pode ser qualquer numero aqui)
                        }
                    }

                }
            }
        }

        public int PegarTempMaxima(int id)
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("select max(temperatura) as 'maxima' from temperatura where codArduino = (SELECT codArduino FROM Arduino where codUsuario = @id)", conn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
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

        public static int PegarMinima(int id)
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT minima FROM Arduino WHERE codUsuario = @id", conn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
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


        public static int PegarMaxima(int id)
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT maxima FROM Arduino WHERE codUsuario = @id", conn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
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

        public static void SetarMinimaEMaxima(int minima, int maxima, int id)
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("UPDATE Arduino set minima = @min, maxima = @max WHERE codUsuario = @id", conn))
                {
                    cmd.Parameters.AddWithValue("@min", minima);
                    cmd.Parameters.AddWithValue("@max", maxima);
                    cmd.Parameters.AddWithValue("@id", id);

                    cmd.ExecuteNonQuery();
                }
            }
        }


    }
}