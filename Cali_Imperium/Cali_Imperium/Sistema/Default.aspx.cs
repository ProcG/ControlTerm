using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Cali_Imperium.Sistema
{
    public partial class Default : System.Web.UI.Page
    {


        Usuario user = new Usuario();
        public static List<string> mediasTemperaturas = null;
        


        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["Usuario"] == null)
            {
                Response.Redirect("../TelaLogin/Login.aspx");
            }
            else
            {
               
                user = (Usuario)Session["Usuario"];
                NomeUsuario.Text = user.Nome;

                if (new Caliimperium.Temperatura().UsuarioTemArduino(user.ID) == false)
                {
                    txtMsgNaoTem.Text = $"Prezado Sr(a). {user.Nome}, por favor cadastre seu arduino.";
                }

                //mediamin.Text = mediaminima();
                //mediamax.Text = abc();

            }
        }


        #region
        //public string mediaminima()
        //{
        //    using(SqlConnection cnx = new SqlConnection("Server = tcp:controlterm.database.windows.net,1433; Initial Catalog = ControlTerm; Persist Security Info = False; User ID = Control; Password = Term2k18; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;"))
        //    {
        //        cnx.Open();
        //        using (SqlCommand cmd = new SqlCommand("SELECT AVG (MINIMA) as 'minima' FROM ARDUINO", cnx))
        //        {
        //            using (SqlDataReader br = cmd.ExecuteReader())
        //            {
        //                if (br.Read() == true)
        //                {
        //                    return br["minima"].ToString();
        //                }
        //                else
        //                {
        //                    return "";
        //                }
        //            }
        //        }
        //    }
        //}
        //public string abc()
        //{
        //    using(SqlConnection cde = new SqlConnection("Server = tcp:controlterm.database.windows.net,1433; Initial Catalog = ControlTerm; Persist Security Info = False; User ID = Control; Password = Term2k18; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;"))
        //    {
        //        cde.Open();
        //        using(SqlCommand efg = new SqlCommand("SELECT AVG(maxima) AS 'maxima' FROM ARDUINO", cde))
        //        {
        //            using (SqlDataReader ghi = efg.ExecuteReader())
        //            {
        //                if(ghi.Read() == true)
        //                {
        //                    return ghi["maxima"].ToString();
        //                }
        //                else
        //                {
        //                    return "";
        //                }
        //            }
        //        }
        //    }
        //}
#endregion


        protected void btnAddArduino_Click(object sender, EventArgs e)
        {
            string nome = txtNomeArduino.Text;
            string min = txtMinimaC.Text;
            string max = txtMaximaC.Text;

            if(new Caliimperium.Temperatura().CadastrarArduino(txtNomeArduino.Text, txtMinimaC.Text, txtMaximaC.Text, user.ID) == true)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                Response.Write("<script>alert('Código invalido!')</script>");
            }


        }

        protected void btnEditArduino_Click(object sender, EventArgs e)
        {
            Caliimperium.Temperatura.SetarMinimaEMaxima(int.Parse(txtTempMinima.Text), int.Parse(txtTempMaxima.Text), user.ID);
        }

        protected void btnAtualizarPerfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("Atualiza_perfil/Default.aspx");
        }

    }
}
