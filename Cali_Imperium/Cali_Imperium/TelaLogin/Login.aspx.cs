using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Cali_Imperium.TelaLogin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                Response.Redirect("../Sistema");
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            Usuario user = new Usuario();
            user.Email = txtEmail.Text;
            user.Senha = txtSenha.Text;

            using (SqlConnection conn = new SqlConnection("Server=tcp:servigabriel.database.windows.net,1433;Initial Catalog=bd;Persist Security Info=False;User ID=gabriel;Password=559428Asdf;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))

            {
                conn.Open();

                // Cria um comando para selecionar registros da tabela, trazendo todas as pessoas que nasceram depois de 1/1/1900
                using (SqlCommand cmd = new SqlCommand("SELECT *  FROM Teste WHERE Email= @email and senha = @senha ", conn))
                {
                    // Esse valor poderia vir de qualquer outro lugar, como uma TextBox...
                    cmd.Parameters.AddWithValue("@email", user.Email);
                    cmd.Parameters.AddWithValue("@senha", user.Senha);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        //Obtém os registros, um por vez
                        if (reader.Read() == true)
                        {

                            user.Nome = reader["nome"].ToString();
                            user.Estado = reader["estado"].ToString();
                            user.Nascimento = reader["data_nasc"].ToString();
                            user.Telefone = reader["telefone"].ToString();
                            Session["Usuario"] = user;
                            
                            Response.Redirect("../Sistema/Default.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Login Inválido')</script>");
                        }
                    }
                }
            }


        }

        protected void btnRecuperar_Click(object sender, EventArgs e)
        {
            Ultilitarios.EnviarEmail("Funciona :D", "aeeeeee", "mateus.covos@hotmail.com");
        }
    }
}