﻿using System;
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
            //using (SqlConnection conectar = new SqlConnection("Server=tcp:servigabriel.database.windows.net,1433;Initial Catalog=bd;Persist Security Info=False;User ID=gabriel;Password=559428Asdf;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            //{
            //    conectar.Open();

            //    // Cria um comando para inserir um novo registro à tabela
            //    using (SqlCommand cmd = new SqlCommand("INSERT INTO Teste (nome, telefone, email, data_nasc, senha,estado) VALUES (@nome, @telefone, @email, @data_nasc, @senha,@estado)", conn))
            //    {
            //        // Esses valores poderiam vir de qualquer outro lugar, como uma TextBox...
            //        cmd.Parameters.AddWithValue("@nome", TxtUsuario.Text);
            //        cmd.Parameters.AddWithValue("@data_nasc", TxtData.Text);
            //        cmd.Parameters.AddWithValue("@email", TxtEmail.Text);
            //        cmd.Parameters.AddWithValue("@telefone", TxtTelefone.Text);
            //        cmd.Parameters.AddWithValue("@estado", TextEstado.Text);
            //        cmd.Parameters.AddWithValue("@senha", TextSenha.Text);

            //        cmd.ExecuteNonQuery();


            //        Response.Write("<script>Alert('Cadastrado com Sucesso')</script>");
            //        Response.Redirect("../TelaLogin/Login.aspx");
            //    }
            //}

        }
    }
}