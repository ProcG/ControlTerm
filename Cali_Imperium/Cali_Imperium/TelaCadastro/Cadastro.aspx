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
				<a href="../TelaSistema/index.aspx"><li>Pagina Inicial</li></a>		
			</ul>
		</div>
	</header>
	<div class="fundo">
		<div class="area_formulario" > 
			<div class="img"></div>
			<form action="../TelaLogin/Login.aspx">
				<input type="text" class="usuario" placeholder="Digite seu nome">
				<input type="date" class="data" placeholder="Data de nascimento">
				<input type="text" class="telefone" placeholder="Telefone">
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
				<input type="email" class="email" placeholder="Digite seu Email">
				<input type="password" class="senha" placeholder="Senha">
				<input type="password" class="senha" placeholder="Confirma Senha">
				<!--  -->
				<button class="voltar" type="reset">Cancelar</button>
				<button class="cadastrar" type="submit" onclick="alert('O seu cadastro foi efetuado com sucesso!')" >
				Cadastrar</button>
			</form>

		</div>
	</div>
  
</body>
</html>
