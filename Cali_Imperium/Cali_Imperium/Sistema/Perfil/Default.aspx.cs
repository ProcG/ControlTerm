using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cali_Imperium.Sistema.Perfil
{
    public partial class Default : System.Web.UI.Page
    {
        Usuario user = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Usuario"] == null)
            {
                Response.Redirect("../../TelaLogin/Login.aspx");
            }
            else
            {

                user = (Usuario)Session["Usuario"];

            }
        }

    }
}