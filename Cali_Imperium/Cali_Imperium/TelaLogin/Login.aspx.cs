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

            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))

            {
                conn.Open();

                // Cria um comando para selecionar registros da tabela, trazendo todas as pessoas que nasceram depois de 1/1/1900
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Usuario WHERE email = @email and senha = @senha ", conn))
                {
                    // Esse valor poderia vir de qualquer outro lugar, como uma TextBox...
                    cmd.Parameters.AddWithValue("@email", user.Email);
                    cmd.Parameters.AddWithValue("@senha", user.Senha);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        //Obtém os registros, um por vez
                        if (reader.Read() == true)
                        {

                            user.ID = int.Parse(reader["codUsuario"].ToString());
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

        protected void btnRecuperarSenha_Click(object sender, EventArgs e)
        {
            string email = txtEmailRec.Text;

            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                string sql = "SELECT senha FROM Usuario WHERE email = @email";
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(sql,conn))
                {
                    cmd.Parameters.AddWithValue("@email", email);
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if(dr.Read())
                        {
                            string senha = dr["senha"].ToString();
                            if (Ultilitarios.EnviarEmail($"Sua senha do Caliimperium é essa: {senha}", "Recuperação de senha do Caliiperium", email) == true)
                            {
                                Response.Write("<script>alert('Sua senha foi enviada para seu Email!')</script>");
                                return;
                            }
                            else
                            {
                                Response.Write("<script>alert('Erro ao mandar o email!')</script>");
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Email não cadastrado!')</script>");
                        }
                    }
                }
            }

        }
    }
}