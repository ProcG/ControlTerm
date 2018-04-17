<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Cali_Imperium.TelaLogin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8">
	<title>Login | Cali Imperium</title>
	<link rel="icon" href="Logos/Logo2.png" type="image/png" sizes="55x55">
	<link rel="stylesheet" type="text/css" href="CSS/estilo.css">
</head>
<body>
    <!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Login | Cali Imperium</title>
	<link rel="icon" href="Logos/Logo2.png" type="image/png" sizes="55x55">
	<link rel="stylesheet" type="text/css" href="CSS/estilo.css">
</head>
<body>
	<header>
		<div class="Menu"> 
			<ul>
				<a href="../Default.aspx"><li>Pagina Inicial</li></a>		
			</ul>
		</div>
	</header>
	<div id="bg"></div>
					<div class="box">
						<p class="txtsenha"><img src="../TelaCadastro/Logos/senha.jpg">Esqueci minha senha</p>
						<p class="txt">Digite seu E-mail</p></span>
						<input class="cxemail" type="text" placeholder="E-mail"/>
						<button class="enviar">Enviar</button>
						<a href="Login.aspx" id="close">X</a>
					</div>
		<div class="login"> 
			<div class="form">
				<img src="Logos/Logo_Cali1.png"  height="180px" width="190px">
				<form class="register-form">
					<input type="text" placeholder="name"/>
					<input type="password" placeholder="password"/>
					<input type="text" placeholder="email address"/>
				</form>
				<form class="login-form">
					<input required="required" type="email" placeholder="E-mail"/>
					<input required="required" type="password" placeholder="Senha"/>
					<button>login</button>
					<p class="mensagem">Não é registrado ? <a href="../TelaCadastro/cadastro.aspx">Crie sua Conta.</a><br>
					<a href="#bg">Recuperação de senha</a></p>

				</form>

			</div>
			
		</div>

</body>
</html>
</body>
</html>
