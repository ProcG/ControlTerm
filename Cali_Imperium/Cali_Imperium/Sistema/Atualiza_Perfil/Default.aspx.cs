using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Cali_Imperium.Sistema.Atualiza_Perfil
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void BtnAtualizar_Click(object sender, EventArgs e)
        {
            using(SqlConnection cnx = new SqlConnection("Server = tcp:controlterm.database.windows.net,1433; Initial Catalog = ControlTerm; Persist Security Info = False; User ID = Control; Password = Term2k18; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30; "))
            {
                cnx.Open();

                using (SqlCommand cmd = new SqlCommand("UPDATE Usuario SET nome = @nome, telefone = @telefone, email = @email, data_nasc = @data_nasc, senha = @senha, estado = @estado", cnx))
                {
                    cmd.Parameters.AddWithValue("@nome", TxtUsuario.Text);
                    cmd.Parameters.AddWithValue("@email", TxtAtualizarEmail.Text);
                    cmd.Parameters.AddWithValue("@telefone", TxtTelefone.Text);
                    cmd.Parameters.AddWithValue("@estado", DdlEstado.Text);
                    cmd.Parameters.AddWithValue("@senha", TxtAtualizarSenha.Text);

                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}