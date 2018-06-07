using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cali_Imperium.Sistema.Relatorio
{
    public partial class frm_relatorio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string email = Request.QueryString["email"];
                int codUser = int.Parse(Request.QueryString["codUser"]);
                DateTime data_inicio = DateTime.Parse(Request.QueryString["data_inicio"]);
                DateTime data_fim = DateTime.Parse(Request.QueryString["data_fim"]);
            }
            catch
            {
                Response.Redirect("../Default.aspx");
            }
        }
    }
}