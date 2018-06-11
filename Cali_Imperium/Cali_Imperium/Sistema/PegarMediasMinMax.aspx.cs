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
    public partial class PegarMediasMinMax : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(mediaminima()+"+"+abc());
        }

        public string mediaminima()
        {
            using (SqlConnection cnx = new SqlConnection("Server = tcp:controlterm.database.windows.net,1433; Initial Catalog = ControlTerm; Persist Security Info = False; User ID = Control; Password = Term2k18; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;"))
            {
                cnx.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT AVG (MINIMA) as 'minima' FROM ARDUINO", cnx))
                {
                    using (SqlDataReader br = cmd.ExecuteReader())
                    {
                        if (br.Read() == true)
                        {
                            return br["minima"].ToString();
                        }
                        else
                        {
                            return "";
                        }
                    }
                }
            }
        }
        public string abc()
        {
            using (SqlConnection cde = new SqlConnection("Server = tcp:controlterm.database.windows.net,1433; Initial Catalog = ControlTerm; Persist Security Info = False; User ID = Control; Password = Term2k18; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;"))
            {
                cde.Open();
                using (SqlCommand efg = new SqlCommand("SELECT AVG(maxima) AS 'maxima' FROM ARDUINO", cde))
                {
                    using (SqlDataReader ghi = efg.ExecuteReader())
                    {
                        if (ghi.Read() == true)
                        {
                            return ghi["maxima"].ToString();
                        }
                        else
                        {
                            return "";
                        }
                    }
                }
            }
        }

    }
}