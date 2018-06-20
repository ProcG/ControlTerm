<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Cali_Imperium.TelaLogin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Login | Cali Imperium</title>
	<link rel="icon" href="Logos/Logo2.png" type="image/png" sizes="55x55">
	<link rel="stylesheet" type="text/css" href="CSS/estilo.css">
	<link rel="stylesheet" type="text/css" href="CSS/estilo_responsivo.css">
</head>
<body>
	<header>
		<div class="Menu"> 
			<ul>
				<a href="../Default.aspx"><li>Início</li></a>		
			</ul>
            <img src="../Logos/PoweredBy.png" class="power" />
		</div>
	</header>
					

        <script>
            function recsenha() {

                var email = document.getElementById("recsenha").innerHTML;
                window.location.href = "Recuperar.aspx?email="+email;

            }
        </script>

		<div class="login"> 
			<div class="form">
				<img src="Logos/Logo_Cali1.png"  height="180px" width="190px">
				<form class="register-form">
					<input type="text" placeholder="name"/>
					<input type="password" placeholder="password"/>
					<input type="text" placeholder="email address"/>
				</form>
				<form id="form1" class="login-form" runat="server">


                    <asp:TextBox runat="server" placeholder="E-mail" TextMode="Email" ID="txtEmail"/>
                    <asp:TextBox runat="server" placeholder="Senha" TextMode="Password" ID="txtSenha"/>
                    <asp:Button Text="Login" runat="server" ID="btnEnviar" OnClick="btnEnviar_Click" />
					<p class="mensagem">Não é registrado ? <a href="../TelaCadastro/cadastro.aspx">Crie sua Conta.</a><br>
					<a href="#bg">Recuperação de senha</a><br /><br />                        
                    <a href="https://desk.zoho.com/portal/controlterm/home" target="_blank">Suporte</a>
					</p>

                    <div id="bg"></div>
	
                    <div class="box">
						<p class="txtsenha"><img src="../TelaCadastro/Logos/senha.jpg">Esqueci minha senha</p>
						<p class="txt">Digite seu E-mail</p></span>
						<asp:TextBox runat="server" TextMode="Email" CssClass="cxemail" placeholder="E-mail" ID="txtEmailRec"/>
                        <asp:Button Text="Enviar" CssClass="enviar" runat="server" ID="btnRecuperarSenha" OnClick="btnRecuperarSenha_Click"/>
						<a href="Login.aspx" id="close">X</a>
					</div>

				</form>

			</div>
			
		</div>

</body>
</html>
