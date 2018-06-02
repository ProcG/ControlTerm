using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;

namespace Cali_Imperium.Sistema.Relatorio
{
    public class Relatorio
    {
        static readonly string server = "Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";

        public string PegarCodigoArduino(int codigo_usuario)
        {
            using (SqlConnection conexao = new SqlConnection(server))
            {
                conexao.Open();

                string sql = "SELECT codArduino FROM Arduino WHERE codUsuario = @codigo_usuario";

                using (SqlCommand cmd = new SqlCommand(sql, conexao))
                {
                    cmd.Parameters.AddWithValue("@codigo_usuario", codigo_usuario);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            return dr["codArduino"].ToString();
                        }
                        else
                        {
                            return "Usuario sem arduino";
                        }
                    }

                }
            }
        }

        public List<ModalRelatorio> EntreDatas(int codigo_usuario, DateTime data_inicio, DateTime data_fim)
        {
            string codArduino = PegarCodigoArduino(codigo_usuario);
            
            string dataMin = "";
            dataMin += data_inicio.Year+"-";
            dataMin += data_inicio.Month+"-";
            dataMin += data_inicio.Day+"";

            string dataMax = "";
            dataMax += data_fim.Year + "-";
            dataMax += data_fim.Month + "-";
            dataMax += data_fim.Day + "";

            List<ModalRelatorio> listaTemperaturas = new List<ModalRelatorio>();

            ModalRelatorio relatorio = null;

            using (SqlConnection cnx = new SqlConnection(server))
            {
                cnx.Open();

                string sql = "SELECT temperatura, convert(date,data_hora) as 'data' FROM temperatura WHERE convert(date,data_hora) BETWEEN @data_inicio and @data_fim AND codArduino = @arduino";

                using (SqlCommand cmd = new SqlCommand(sql, cnx))
                {
                    cmd.Parameters.AddWithValue("@data_inicio", dataMin);
                    cmd.Parameters.AddWithValue("@data_fim", dataMax);
                    cmd.Parameters.AddWithValue("@arduino", codArduino);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            relatorio = new ModalRelatorio();
                            relatorio.Temperatura = dr["temperatura"].ToString();
                            relatorio.Data = dr["data"].ToString();

                            listaTemperaturas.Add(relatorio);
                        }

                    }

                }

                if (relatorio != null)
                {
                    return listaTemperaturas;
                }
                return null;
            }

        }

        public static void alert(Control control, string texto)
        {
            ScriptManager.RegisterStartupScript(control, control.GetType(), "showalert", $"alert('{texto}');", true);
        }

        public static string ViewEntreData(List<ModalRelatorio> lista)
        {
            string div = "<div class='modal_relatorio'>";
            foreach (ModalRelatorio temp in lista)
            {
                div += "<p class='numeros'>Temperatura: " + temp.Temperatura + " | Data: " + temp.Data + "</p>";
            }
            div += "</div>";

            return div;

        }

    }

    public class ModalRelatorio
    {
        public string Temperatura { get; set; }
        public string Data { get; set; }
    }

}


