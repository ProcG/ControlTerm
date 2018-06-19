using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cali_Imperium.Sistema.Relatorio
{
    public partial class Default : System.Web.UI.Page
    {
        Usuario user = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Response.Redirect("../../TelaLogin/Login.aspx");
            }
            else
            {
                user = (Usuario)Session["Usuario"];
                NomeUsuario.Text = user.Nome;
            }
        }

        protected void btnGerarPorData_Click(object sender, EventArgs e)
        {
            if(data_minima.SelectedDate <= data_maxima.SelectedDate && (data_minima.SelectedDate != DateTime.Parse("01 / 01 / 0001 00:00:00") && data_maxima.SelectedDate != DateTime.Parse("01 / 01 / 0001 00:00:00")))
            {
                 
                Response.Redirect($"frm_relatorio.aspx?codUser={user.ID}&data_inicio={data_minima.SelectedDate}&data_fim={data_maxima.SelectedDate}&email={user.Email}&all=false");
               
            }
            else
            {
                Response.Redirect($"frm_relatorio.aspx?codUser={user.ID}&data_inicio={data_minima.SelectedDate}&data_fim={data_maxima.SelectedDate}&email={user.Email}&all=true");
            }
        }

        protected void btnAtualizarPerfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Atualiza_perfil");
            
        }

        protected void btnAddArduino_Click(object sender, EventArgs e)
        {
            string nome = txtNomeArduino.Text;
            string min = txtMinimaC.Text;
            string max = txtMaximaC.Text;

            if (new Caliimperium.Temperatura().CadastrarArduino(txtNomeArduino.Text, txtMinimaC.Text, txtMaximaC.Text, user.ID) == true)
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
    }
}