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



        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Usuario"] == null)
            {
                Response.Redirect("../TelaLogin/Login.aspx");
            }
            else
            { 
                Usuario user = new Usuario();
                user = (Usuario)Session["Usuario"];
                NomeUsuario.Text = user.Nome;
            }
        }

        protected void btnAdicionarArduino_Click(object sender, EventArgs e)
        {
                Caliimperium.Temperatura.SetarMinimaEMaxima(int.Parse(txtTempMinima.Text), int.Parse(txtTempMaxima.Text));
           
        }
        
    }
}