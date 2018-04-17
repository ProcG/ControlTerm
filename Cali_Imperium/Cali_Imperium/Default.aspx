<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Cali_Imperium.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="icon" href="Logos/Logo_da_empresa2.png" type="image/gif" sizes="100x100">
	<title>Cali Imperium | O coltrole que você merece!</title>
	<link rel="stylesheet" type="text/css" href="CSS/index.css">
	<link href="https://fonts.googleapis.com/css?family=Poiret+One|Raleway|Roboto+Slab|Slabo+27px|Tajawal" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript"></script>
	<script>
        (function () {
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 900);
                });
            });
        }());
	</script>
	<script type="text/javascript">
        var flag = true;
        window.onscroll = function () {
            scroll();
        };
        function scroll() {
            var div = document.getElementById("menu");
            if (document.body.scrollTop > 50 && flag) {
                div.className = "Menu2";
                flag = !flag;
            } else if (document.body.scrollTop < 50 && !flag) {
                div.className = "Menu1";
                flag = !flag;
            }
        }
	</script>
</head>
<body>
            <!--MENU-->
		<header>  
			<div id ="menu" class="Menu1"> 
				<img src="Logos/Logo_da_empresa2.png"/>
				<ul>
					<a  href="../TelaCadastro/cadastro.aspx"><li>Cadastre-se</li></a>
					<a href="../TelaLogin/Login.aspx"><li>Login</li></a>
					<a class="scroll" href="#colaboradores"><li>Colaboradores</li></a>
					<a class="scroll" href="#sobre"><li>Sobre Nós</li></a>
					<a class="scroll" href="#greetings"><li>Início</li></a>
						
				</ul>
			</div>
		</header>

<!--PARALLAX-->
			<div id="greetings" class="parallax">
				<h1>Bem vindo a Control Term!</h1>
				<h2> Uma empresa com soluções inovadoras e com foco em implantações de sensores. Oferecendo serviços de qualidade e preço justo para nossos clientes, buscando alcançar mais supects, assim crescendo em varios apectos.</h2>
			</div>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$('.parallax').each(function(){
			var $obj = $(this);
			$obj.css('background-position', '50% 0');
			$obj.css('background-attachment', 'fixed');
			$obj.css('background-size', '100%');
				$(window).scroll(function(){
					var offset = $obj.offset();
					var yPos = -($(window).scrollTop() - offset.top) / 10;
					var bgpos = '50% ' + yPos + 'px';
					$obj.css('background-position', bgpos);
				});
		});
	</script>

<!--Institucional-->
		<div id="sobre">			
			<div class="historia">
				<h1>Institucional</h1>
					<p>A partir de ideias inovadoras, 5 jovens fundaram a startup <b>Control Term</b>, em 2018,
					almejavamos crescer com implantações de serviços, desde o início tivemos grandes conquistas, 
					hoje já somos reconhecidos como uma empresa inovadora. Tudo iniciou na faculdade através 
					de projetos apresentados por seus professores, <i>“a partir de 
					escolhas surgiu a oportunidade de nos juntarmos, e assim iniciamos nosso projeto. Tivemos diversas ideias
					e entre elas surgiu o <b>Cali Imperium</b> com soluções na melhoria da produtividade e conforto de nossos clientes”</i>. 
					Pessoas distintas com conhecimentos diferentes, mas que se completavam. <i>“Almejávamos coisas parecidas, crescer, 
					estudar e conquistar, então tudo se iniciou”</i>.</p>
			</div>			
			<div class="control">
				<img class="Term" src="Logos/Logo_da_empresa.png" width="290px" height="200px" style="margin-top: 10%;"/>
			</div>
			<div class="cali">
				<img class="Cali" src="Logos/Logo.png" width="200px" height="200px"/>
			</div>
		</div>
		
<!--MISSÃO, VISÃO E VALORES-->
		<div id="mvv">
			<div class="missão">
				<img src="Logos/missão.png" width="245" height="360"/>
					<p class="cor" ><b>Crescer por toda América do Sul, sendo referência no mercado tecnológico.
					Implantando sensores e dando inicialização a projetos novos e inovadores.</b></p>
			</div>
			<div class="visão">
				<img src="Logos/visão.png" width="245" height="360"/>			
				<p class="cor2" ><b>Visamos para 10 anos, ser referência no mercado tecnológico e reconhecida mundialmente. 		   
				Implementando novos serviços, assim expandindo nosso campo de atuação e mantendo nossos valores.</b></p>				
			</div>
			<div class="valores">
				<img src="Logos/valores.png" width="245" height="360"/>
					<p class="cor3"><b>•	Comprometiento;<br>
					   •	Integridade;<br>
                       •	Respeito;<br>
					   •	Inovação;<br>
					   •	Proatividade;<br>
					   •	Resiliência;<br>
					   •	Dedicação;<br>
					   •	Honestidade;<br>
					   •	União.</b>
					</p>				
			</div>	
		</div>	
		
<!--COLABORADORES-->
		<div id="colaboradores">
			<div class="j">
				<img src="Logos/rosto.jpg"/>
				<p>Full Stack</p>
				<h1>Juvencio</h1>
				<div class="contatos">
					<img src="Logos/github.png" width="40px" height="40px" />
					<img src="Logos/linkedin.png" width="50px" height="50px" />
				</div>
			</div>
			<div class="p">
				<img src="Logos/pablo.jpg"/>
				<p>Full Stack ( ͡° ͜ʖ ͡°)</p>
				<h1>Pedro</h1>
				<div class="contatos">
					<img src="Logos/github.png" width="40px" height="40px" />
					<img src="Logos/linkedin.png" width="50px" height="50px" />
				</div>
			</div>
			<div class="g">
				<img src="Logos/rosto.jpg"/>
				<p>Full Stack</p>
				<h1>Gabriel</h1>
				<div class="contatos">
					<img src="Logos/github.png" width="40px" height="40px" />
					<img src="Logos/linkedin.png" width="50px" height="50px" />
				</div>
			</div>
			<div class="m">
				<img src="Logos/mateus.jpg"/>
				<p>Full Stack</p>
				<h1>Mito</h1>
				<div class="contatos">
					<img src="Logos/github.png" width="40px" height="40px" />
					<img src="Logos/linkedin.png" width="50px" height="50px" />
				</div>
			</div>
			<div class="eu">
				<img src="Logos/rosto.jpg"/>
				<p>Full Stack</p>
				<h1>Eu</h1>
				<div class="contatos">
					<img src="Logos/github.png" width="40px" height="40px" />
					<img src="Logos/linkedin.png" width="50px" height="50px" />
				</div>
			</div>
		</div>
		
<!--RODAPÉ-->
		<footer> 
			<div class="faleConosco">
				<p>Fale conosco: controlterm@hotmail.com</p>
			</div>			
			<div class="direitos">
				<p>Todos os direitos reservados.</p>
				<img src="Logos/Logo_da_empresa2.png"/>
			</div>
		</footer>

      
</body>
</html>
