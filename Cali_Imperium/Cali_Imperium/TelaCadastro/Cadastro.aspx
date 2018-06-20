<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cadastro.aspx.cs" Inherits="Cali_Imperium.TelaCadastro.Cadastro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Cadastre - se | Cali Imperium</title>
	<meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" href="Logos/Logo2.png" type="image/png" sizes="55x55"/>
	<link rel="stylesheet" type="text/css" href="CSS/style_cadastro.css"/>
	<link rel="stylesheet" type="text/css" href="CSS/cadastro_responsivo.css"/>
</head>
<body>
    <header>
		<div class="Menu"> 
			<ul>
				<a href="../TelaLogin/Login.aspx"><li>Login</li></a>
				<a href="../Default.aspx"><li>Inicial</li></a>		
			</ul>
            <img src="../Logos/PoweredBy.png" class="power"/>
		</div>
	</header>
	<div class="fundo">
		<div class="area_formulario" > 
			<div class="img"></div>
			<form id="form1" runat="server">
                <asp:TextBox runat="server" CssClass="usuario" placeholder="Digite seu nome" ID="TxtUsuario" REQUIRED/>
                <asp:TextBox runat="server" CssClass="data" placeholder="Data de Nascimento" ID="TxtData" TextMode="Date" REQUIRED/>
                <asp:TextBox runat="server" CssClass="telefone" placeholder="Telefone" ID="TxtTelefone" value='' onkeypress='return SomenteNumero(event)' maxlength="15" REQUIRED/>				
				<div>
					<!-- <div position="relative"><img src="estado.png";
						width="10%"; height="80%"></div> -->
				
                    <asp:dropdownlist runat="server" ID="TextEstado">
					<asp:ListItem value= "null" Text="Selecione uma estado"></asp:ListItem>
					<asp:ListItem value="AC" Text="Acre"></asp:ListItem>
					<asp:ListItem value="AL" Text="Alagoas"></asp:ListItem>
					<asp:ListItem value="AP" Text="Amapá"></asp:ListItem>
					<asp:ListItem value="AM" Text="Amazonas"></asp:ListItem>
					<asp:ListItem value="BA" Text="Bahia"></asp:ListItem>
					<asp:ListItem value="CE" Text="Ceará"></asp:ListItem>
					<asp:ListItem value="DF" Text="Distrito Federal"></asp:ListItem>
					<asp:ListItem value="ES" Text="Espírito Santo"></asp:ListItem>
					<asp:ListItem value="GO" Text="Goiás"></asp:ListItem>
					<asp:ListItem value="MA" Text="Maranhão"></asp:ListItem>
					<asp:ListItem value="MT" Text="Mato Grosso"></asp:ListItem>
					<asp:ListItem value="MS" Text="Mato Grosso do Sul"></asp:ListItem>
					<asp:ListItem value="MG" Text="Minas Gerais"></asp:ListItem>
					<asp:ListItem value="PA" Text="Pará"></asp:ListItem>
					<asp:ListItem value="PB" Text="Paraíba"></asp:ListItem>
					<asp:ListItem value="PR" Text="Paraná"></asp:ListItem>
					<asp:ListItem value="PE" Text="Pernambuco"></asp:ListItem>
					<asp:ListItem value="PI" Text="Piauí"></asp:ListItem>
					<asp:ListItem value="RJ" Text="Rio de Janeiro"></asp:ListItem>
					<asp:ListItem value="RN" Text="Rio Grande do Norte"></asp:ListItem>
					<asp:ListItem value="RS" Text="Rio Grande do Sul"></asp:ListItem>
					<asp:ListItem value="RO" Text="Rondônia"></asp:ListItem>
					<asp:ListItem value="RR" Text="Roraima"></asp:ListItem>
					<asp:ListItem value="SC" Text="Santa Catarina"></asp:ListItem>
					<asp:ListItem value="SP" Text="São Paulo"></asp:ListItem>
					<asp:ListItem value="SE" Text="Sergipe"></asp:ListItem>
					<asp:ListItem value="TO" Text="Tocantins"></asp:ListItem>

				</asp:dropdownlist>     
				</div>                      
                    <asp:TextBox runat="server" CssClass="email" TextMode="Email" placeholder="Digite seu Email" ID="TxtEmail" REQUIRED/>
                    <asp:TextBox runat="server" TextMode="Password" CssClass="senha" placeholder="Senha" ID="TextSenha" REQUIRED/>
                    <asp:TextBox runat="server" TextMode="Password" CssClass="senha" placeholder="Confirmar Senha" ID="TextConfSenha" REQUIRED/>
				<!--  -->
                <asp:Button Text="Cadastrar" ID="btnCadastrar" runat="server" OnClick="btnCadastrar_Click" class="cadastrar" />
				
			</form>

		</div>
	</div>
  
</body>
</html>
<script language='JavaScript'>
	function SomenteNumero(e){
		var tecla=(window.event)?event.keyCode:e.which;   
		if((tecla>47 && tecla<58)) return true;
		else{
			if (tecla==8 || tecla==0) return true;
		else  return false;
		}
	}
</script>
	