using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cali_Imperium.TelaLogin
{
    public partial class Recuperar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string valor = Request.QueryString["email"];

            Response.Write("<script>alert('"+valor+"')</script>");
            
        }
    }
}