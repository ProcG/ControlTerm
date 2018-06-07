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
            }
        }

        protected void btnGerarPorData_Click(object sender, EventArgs e)
        {
            if(data_minima.SelectedDate <= data_maxima.SelectedDate && (data_minima.SelectedDate != DateTime.Parse("01 / 01 / 0001 00:00:00") && data_maxima.SelectedDate != DateTime.Parse("01 / 01 / 0001 00:00:00")))
            {
                List<ModalRelatorio> relatorio = new Relatorio().EntreDatas(user.ID, data_minima.SelectedDate, data_maxima.SelectedDate);

                if (relatorio != null)
                {
                    Response.Write("<script>window.onload = function(){document.getElementById('ar').innerHTML = \"" + Relatorio.ViewEntreData(relatorio,user.Email)+ "\";}</script>");
                }
                else
                {
                    Relatorio.alert(this, "Nenhuma temperatura registrada nesse periodo");
                }

            }
            else
            {
                Relatorio.alert(this, "Selecione um periodo valido");
            }
        }
    }
}