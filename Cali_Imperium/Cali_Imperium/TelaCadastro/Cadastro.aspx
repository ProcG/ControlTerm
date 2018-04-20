<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cadastro.aspx.cs" Inherits="Cali_Imperium.TelaCadastro.Cadastro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Cadastre - se | Cali Imperium</title>
	<meta charset="utf-8">
	<link rel="icon" href="Logos/Logo2.png" type="image/png" sizes="55x55">
	<link rel="stylesheet" type="text/css" href="CSS/style_cadastro.css">
</head>
<body>
    <header>
		<div class="Menu"> 
			<ul>
				<a href="../TelaLogin/Login.aspx"><li>Login</li></a>
				<a href="../Default.aspx"><li>Pagina Inicial</li></a>		
			</ul>
		</div>
	</header>
	<div class="fundo">
		<div class="area_formulario" > 
			<div class="img"></div>
			<form id="form1" runat="server">
                <asp:TextBox runat="server" CssClass="usuario" placeholder="Digite seu nome" ID="TxtUsuario"/>
                <asp:TextBox runat="server" CssClass="data" placeholder="Data de Nascimento" ID="TxtData"/>
                <asp:TextBox runat="server" CssClass="telefone" placeholder="Telefone" ID="TxtTelefone"/>				
				<div>
					<!-- <div position="relative"><img src="estado.png";
						width="10%"; height="80%"></div> -->
				<select>
					<option value="">--Selecione uma estado--</option>
					<option value="AC">Acre</option>
					<option value="AL">Alagoas</option>
					<option value="AP">Amapá</option>
					<option value="AM">Amazonas</option>
					<option value="BA">Bahia</option>
					<option value="CE">Ceará</option>
					<option value="DF">Distrito Federal</option>
					<option value="ES">Espírito Santo</option>
					<option value="GO">Goiás</option>
					<option value="MA">Maranhão</option>
					<option value="MT">Mato Grosso</option>
					<option value="MS">Mato Grosso do Sul</option>
					<option value="MG">Minas Gerais</option>
					<option value="PA">Pará</option>
					<option value="PB">Paraíba</option>
					<option value="PR">Paraná</option>
					<option value="PE">Pernambuco</option>
					<option value="PI">Piauí</option>
					<option value="RJ">Rio de Janeiro</option>
					<option value="RN">Rio Grande do Norte</option>
					<option value="RS">Rio Grande do Sul</option>
					<option value="RO">Rondônia</option>
					<option value="RR">Roraima</option>
					<option value="SC">Santa Catarina</option>
					<option value="SP">São Paulo</option>
					<option value="SE">Sergipe</option>
					<option value="TO">Tocantins</option>
				</select>
				</div>
                    <asp:TextBox runat="server" CssClass="email" placeholder="Digite seu Email" ID="TxtEmail"/>
                    <asp:TextBox runat="server" TextMode="Password" CssClass="senha" placeholder="Senha" ID="TextSenha"/>
                    <asp:TextBox runat="server" TextMode="Password" CssClass="senha" placeholder="Confirmar Senha" ID="TextConfSenha"/>
				<!--  -->
				<button class="voltar" type="reset">Cancelar</button>
				<button class="cadastrar" type="submit" onclick="alert('O seu cadastro foi efetuado com sucesso!')" >
				Cadastrar</button>
			</form>

		</div>
	</div>
  
</body>
</html>
