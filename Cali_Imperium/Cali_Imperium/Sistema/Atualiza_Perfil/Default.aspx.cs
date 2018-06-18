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

        Usuario user = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                user = (Usuario)Session["Usuario"];
            }
            else
            {
                Response.Redirect("../../Sistema");
            }
        }

        protected void BtnAtualizar_Click(object sender, EventArgs e)
        {

            string nome = TxtUsuario.Text;
            string email = TxtAtualizarEmail.Text;
            string estado = DdlEstado.Text;
            string senha = TxtAtualizarSenha.Text;
            string telefone = TxtTelefone.Text;
                        
            if (TxtUsuario.Text == "")
            {
                nome = user.Nome;
            }
            if (TxtAtualizarEmail.Text == "")
            {
                email = user.Email;
            }
            if (TxtAtualizarSenha.Text == "")
            {
                senha = user.Senha;
            }
            if (DdlEstado.Text == "null")
            {
                estado = user.Estado;
            }                      
            if (TxtTelefone.Text == "")
            {
                telefone = user.Telefone;
            }

           

            using (SqlConnection cnx = new SqlConnection("Server = tcp:controlterm.database.windows.net,1433; Initial Catalog = ControlTerm; Persist Security Info = False; User ID = Control; Password = Term2k18; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30; "))
            {
                cnx.Open();

                using (SqlCommand cmd = new SqlCommand("UPDATE Usuario SET nome = @nome, telefone = @telefone, email = @email, senha = @senha, estado = @estado WHERE codUsuario = @codUsuario", cnx))
                {
                    cmd.Parameters.AddWithValue("@nome", nome);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@telefone", telefone);
                    cmd.Parameters.AddWithValue("@estado", estado);
                    cmd.Parameters.AddWithValue("@senha", senha);

                    cmd.Parameters.AddWithValue("@codUsuario", user.ID);

                    cmd.ExecuteNonQuery();

                    // attSessionUsuario();

                    Session["Usuario"] = null;
                    
                }
            }
            
            Response.Redirect("../../Sistema");

        }

        private void attSessionUsuario()
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:controlterm.database.windows.net,1433;Initial Catalog=ControlTerm;Persist Security Info=False;User ID=Control;Password=Term2k18;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))

            {
                conn.Open();

                // Cria um comando para selecionar registros da tabela, trazendo todas as pessoas que nasceram depois de 1/1/1900
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Usuario WHERE codUsuario = @cod ", conn))
                {
                    cmd.Parameters.AddWithValue("@cod",user.ID);
                     using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        //Obtém os registros, um por vez
                        if (reader.Read() == true)
                        {

                            user = new Usuario();

                            user.ID = int.Parse(reader["codUsuario"].ToString());
                            user.Nome = reader["nome"].ToString();
                            user.Estado = reader["estado"].ToString();
                            user.Nascimento = reader["data_nasc"].ToString();
                            user.Telefone = reader["telefone"].ToString();

                            Session["Usuario"] = null;

                            Session["Usuario"] = user;

                        }
                    }
                }
            }

        }

        protected void BtnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("../../Sistema");
        }
    }




}
