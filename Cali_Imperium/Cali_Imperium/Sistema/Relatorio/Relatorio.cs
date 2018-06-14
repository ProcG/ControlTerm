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
                            relatorio.Temperatura = int.Parse(dr["temperatura"].ToString());
                            
                            DateTime data = DateTime.Parse(dr["data"].ToString());

                            string dataFinal = $"{data.Day}/{data.Month}/{data.Year} - {data.Hour}:{data.Minute}";                         relatorio.Data = dataFinal;


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

        public List<ModalRelatorio> Todos(int codigo_usuario)
        {
            string codArduino = PegarCodigoArduino(codigo_usuario);

            List<ModalRelatorio> listaTemperaturas = new List<ModalRelatorio>();

            ModalRelatorio relatorio = null;

            using (SqlConnection cnx = new SqlConnection(server))
            {
                cnx.Open();

                string sql = "SELECT temperatura, convert(date,data_hora) as 'data' FROM temperatura WHERE codArduino = @arduino";

                using (SqlCommand cmd = new SqlCommand(sql, cnx))
                {
                    cmd.Parameters.AddWithValue("@arduino", codArduino);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            relatorio = new ModalRelatorio();
                            relatorio.Temperatura = int.Parse(dr["temperatura"].ToString());


                            DateTime data = DateTime.Parse(dr["data"].ToString());

                            string dataFinal = $"{data.Day}/{data.Month}/{data.Year} - {data.Hour}:{data.Minute}";

                            relatorio.Data = dataFinal;


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

        
        public static string ViewEntreData(List<ModalRelatorio> lista, string email)
        {

            List<ModalRelatorio> lista2 = lista;

            ModalRelatorio relat = new ModalRelatorio();

            lista2.Sort((x, y) => x.Temperatura.CompareTo(y.Temperatura));

            relat.Media = (int)lista2.Average((x) => x.Temperatura);
            relat.Minima = lista2.Min((x) => x.Temperatura);
            relat.Maxima = lista2.Max((x) => x.Temperatura);

            DateTime dataEtemp = new DateTime();
            string data = $"{dataEtemp.Day}/{dataEtemp.Month}/{dataEtemp.Year} - {dataEtemp.Hour}:{dataEtemp.Minute}";


            /* string infos = $@"

             <div class='pagina_relatorio'>
         < div class='cabeca'>

             <div class='dados'>
                 <p>{data}</p>
                 <p>Relatorio por periodo</p>
                 <p class='email'>{email}</p>
             </div>
             <img src = 'logo.png' >

         </ div >


         < div class='infos'>
             <table> 
                 <tr> 
                     <td>Menor temperatura</td>
                     <td>Temperatura média</td>
                     <td>Maior temperatura</td>
                 </tr>
                 <tr> 
                     <td>{relat.Minima}</td>
                     <td>{relat.Media}</td>
                     <td>{relat.Maxima}</td>
                 </tr>	
             </table>

                 <br> 
                 <br> 
                 <br> 

             <table>		
                 <tr> 
                     <td>Data</td>
                     <td>Temperatura</td>
                 </tr>
                ";
             foreach (ModalRelatorio temp in lista)
             {
                 infos += $@"< tr> 
                                 <td> {temp.Data} </ td >
                                 <td> {temp.Temperatura} </td>
                             </tr>";
             }

             infos += @"</table>
         </div>

     </div>"; */

            string infos = $"<div class='pagina_relatorio'>" +
            "< div class='cabeca'>" +
            "<div class='dados'>" +
                "<p>{data}</p>" +
                "<p>Relatorio por periodo</p>" +
                "<p class='email'>{email}</p>" +

            "</div> " +
            "< img src = 'logo.png' > " +

        "</ div > " +


        "< div class='infos'>" +
            "<table> " +
                "<tr> " +
                    "<td>Menor temperatura</td>" +
                    "<td>Temperatura média</td>" +
                    "<td>Maior temperatura</td>" +
                "</tr>" +
                "<tr> " +
                    "<td>{relat.Minima}</td>" +
                    "<td>{relat.Media}</td>" +
                    "<td>{relat.Maxima}</td>" +
                "</tr>	" +
            "</table>" +

                "<br> " +
                "<br> " +
                "<br> " +
            "<table>" +
                "<tr> " +
                    "<td>Data</td>" +
                    "<td>Temperatura</td>" +
                "</tr>";
            foreach (ModalRelatorio temp in lista)
            {
                infos += $"< tr>"+
                                "<td> {temp.Data} </ td > " +
                                "< td> {temp.Temperatura} </td> " +
                           " </tr>";
            }

            infos += "</table>"+
        "</div> " +

    "</div>";

            return infos;

        }

    }

    public class ModalRelatorio
    {
        public int Temperatura { get; set; }
        public String Data { get; set; }
        public int Minima { get; set; }
        public int Media { get; set; }
        public int Maxima { get; set; }
    }

}


