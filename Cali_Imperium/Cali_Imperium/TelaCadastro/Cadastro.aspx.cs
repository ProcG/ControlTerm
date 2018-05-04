using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Cali_Imperium.TelaCadastro
{
    public partial class Cadastro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                Response.Redirect("../Sistema");
            }
        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            if (TextSenha.Text == TextConfSenha.Text && TextSenha.Text !="" && TextConfSenha.Text != "")
            {
                using (SqlConnection conn = new SqlConnection("Server=tcp:servigabriel.database.windows.net,1433;Initial Catalog=bd;Persist Security Info=False;User ID=gabriel;Password=559428Asdf;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
                {
                    conn.Open();

                    // Cria um comando para inserir um novo registro à tabela
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Teste (nome, telefone, email, data_nasc, senha,estado) VALUES (@nome, @telefone, @email, @data_nasc, @senha,@estado)", conn))
                    {
                        // Esses valores poderiam vir de qualquer outro lugar, como uma TextBox...
                        cmd.Parameters.AddWithValue("@nome", TxtUsuario.Text);
                        cmd.Parameters.AddWithValue("@data_nasc", TxtData.Text);
                        cmd.Parameters.AddWithValue("@email", TxtEmail.Text);
                        cmd.Parameters.AddWithValue("@telefone", TxtTelefone.Text);
                        cmd.Parameters.AddWithValue("@estado", TextEstado.Text);
                        cmd.Parameters.AddWithValue("@senha", TextSenha.Text);

                        cmd.ExecuteNonQuery();


                        Response.Write("<script>Alert('Cadastrado com Sucesso')</script>");
                        Response.Redirect("../TelaLogin/Login.aspx");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Senhas Não são Iguais');</script>");
            }
        }
    }
}