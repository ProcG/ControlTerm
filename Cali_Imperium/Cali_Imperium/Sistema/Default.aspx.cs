using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cali_Imperium.Sistema
{
    public partial class Default : System.Web.UI.Page
    {


        Usuario user = new Usuario();


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

            }
        }

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
            Response.Redirect("Perfil/Default.aspx");
        }
    }
}
