<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Cali_Imperium.Sistema.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>TermometrOnline</title>
    <link rel="stylesheet" type="text/css" href="css/inicio.css" />
    <link rel="stylesheet" type="text/css" href="css/padroes.css" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <script src="http://www.chartjs.org/dist/2.7.1/Chart.js"></script>
    <script src="http://www.chartjs.org/samples/latest/utils.js"></script>


    <style>
        canvas {
            -moz-user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
        }
    </style>

</head>

<body>

  

    <form id="form1" runat="server">
        <div class="area" id="ar">
            <div class="menu">
                <div class="confs_usuario">
                    <img src="img/usuario.png" class="foto_usuario" />
                    <div>
                        <p class="nome_usuario">
                            <asp:Label Text="" runat="server" ID="NomeUsuario" />
                        </p>
                        <p class="funcao_usuario">Usuário</p>
                    </div>
                    <asp:Button Text="Editar" runat="server" ID="btnAtualizarPerfil" OnClick="btnAtualizarPerfil_Click" CssClass="atualizar_perfil"></asp:button>
                </div>
                <div class="sub_menus">
                    <ul>
                        <li>
                            <asp:HyperLink NavigateUrl="#" runat="server" CssClass="links" Text="Relatórios de Temperatura"></asp:HyperLink></li>
                        <li>
                            <asp:HyperLink NavigateUrl="#" runat="server" CssClass="links" Text="Temperaturas Ideais"></asp:HyperLink></li>
                        <li>
                            <asp:HyperLink NavigateUrl="#" runat="server" CssClass="links" Text="Configurações" onclick="getViewConfiguracoes()"></asp:HyperLink>
                        </li>
                    </ul>
                    <ul class="sair_site">
                        <li>
                            <asp:HyperLink NavigateUrl="Logout.aspx" runat="server" CssClass="links" Text="Sair" ID="btnSair" ></asp:HyperLink></li>
                    </ul>
                </div>
            </div>

              <%
                  Caliimperium.Temperatura t = new Caliimperium.Temperatura();
                  Cali_Imperium.Usuario u = (Cali_Imperium.Usuario)Session["Usuario"];


                  if (t.UsuarioTemArduino(u.ID) == true)
                  {
            %>

            <div class="pos_area_termo">
                <div id="area_termometro">
                    <div id="circ" class="termometro" onclick="att()">
                        <p class="temperatura" id="txt_temperatura">10°c</p>
                        <p class="ultima_att" id="ult_att"></p>
                    </div>
                    <div id="textos">
                        <canvas id="chart"></canvas>
                        
                    </div>
                </div>
            </div>

            <div class="analytics">
                <div class="medias">
                    <p class="temperatura_medias"  id="txtMinima">10</p>
                    <p class="desc_temp">Minima</p>
                </div>
                <div class="medias">
                    <p class="temperatura_medias" id="txt2Q">10</p>
                    <p class="desc_temp">2º Quartil</p>
                </div>
                <div class="medias">
                    <p class="temperatura_medias"id="txtMediana">10</p>
                    <p class="desc_temp">Mediana</p>
                </div>
                <div class="medias">
                    <p class="temperatura_medias" id="txt3Q">10</p>
                    <p class="desc_temp">3º Quartil</p>
                </div>
                <div class="medias">
                    <p class="temperatura_medias" id="txtMaxima">10</p>
                    <p class="desc_temp">Maxima</p>
                </div>
            </div>     
            <% }// FIM ID
                else
                {
                    %>
                        <div class="sem_termometro">
                            <asp:Label runat="server"  class="txtNaoTem" ID="txtMsgNaoTem"></asp:Label>
                        </div>
                    <%
                }
              %>
        </div>

        <audio id="alerta" loop>
            <source src="js/bythesword.mp3" type="audio/mp3" />
        </audio>

        <div id="fundo_modal" class="fundo_modal_off">
            <div id="tela_confs">
                <p class="titulo">Configurações</p>
              <% 
                  if (t.UsuarioTemArduino(u.ID) == true)
                    {
            %>
                <a href="#" class="confs_opc" onclick="getViewAddArduino()">Editar Termometro</a>
              <%}
                else
                { %>

                <a href="#" class="confs_opc" onclick="getViewAddArduino()">Adicionar Termometro</a>
                
                <%} %>
                <a href="#" class="confs_opc">Suporte</a>
                <a href="#" class="confs_opc">Ajuda</a>
                <a href="#" class="fechar" onclick="removerViewConfiguracoes()">x</a>
            </div>

            <div id='fundo_addArduino' class="fundo_addArduino_off">
                
                 <% 
                if (t.UsuarioTemArduino(u.ID) == true)
                {
                %>
                <div id='conf_arduino'>
                    <p class='titulo'>Editar Termometro</p>
                    <%--<input type='text' name='' class='input_padrao' placeholder='Código do termometro'>
                    <input type='text' name='' class='input_padrao' placeholder='Nome de Exibição do Termometro'>--%>
                    <asp:TextBox runat="server" CssClass="term_input" placeholder='Temperatura Minima' ID="txtTempMinima" MaxLength="2"></asp:TextBox>
                    <asp:TextBox runat="server" CssClass="term_input" placeholder='Temperatura Maxima' ID="txtTempMaxima" MaxLength="2"></asp:TextBox>
                    <asp:Button Text="Cancelar" CssClass="cnl" ID="Button1" runat="server" />
                    <asp:Button Text="Adicionar" CssClass="adc" ID="btnEditArduino" runat="server" OnClick="btnEditArduino_Click" />
                    <a href='#' class='fechar' onclick='removerViewAddArduino()'>x</a>
                </div>
                <% } else{ %>
                    <div id='conf_arduino'>
                    <p class='titulo'>Adicionar Termometro</p>
                    <asp:TextBox runat="server" CssClass='input_padrao' placeholder='Código do termometro' ID="txtNomeArduino"></asp:TextBox>
                    <asp:TextBox runat="server" CssClass="term_input" placeholder='Temperatura Minima' ID="txtMinimaC" MaxLength="2"></asp:TextBox>
                    <asp:TextBox runat="server" CssClass="term_input" placeholder='Temperatura Maxima' ID="txtMaximaC" MaxLength="2"></asp:TextBox>
                    <asp:Button Text="Cancelar" CssClass="cnl" ID="Button2" runat="server" />
                    <asp:Button Text="Adicionar" CssClass="adc" ID="btnAddArduino" runat="server" OnClick="btnAddArduino_Click" />
                    <a href='#' class='fechar' onclick='removerViewAddArduino()'>x</a>
                </div>
                <%} %>
            </div>
        </div>

    </form>
    
</body>
</html>
<script type="text/javascript" src="js/eventos.js"></script>
<script type="text/javascript" src="js/atualizar.js"></script>
<script>
    var numeros = new Array();
    function att() {

        var xhttp = new XMLHttpRequest();        
       
        xhttp.open("GET", "getTemperatura.aspx", true);
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState === xhttp.DONE && xhttp.status === 200) {
                numeros = xhttp.responseText.split("-");


                if (numeros[0] == -100) {
                    return;
                }

                atualiza_numeros(document.getElementById('txt_temperatura').innerHTML.replace('°c', ''), Math.floor(numeros[0]), Math.floor(numeros[6]), Math.floor(numeros[7]));//numeros[0] == Última temperatura registrada, numeros[6] == Temperatura minima aceitavel, numeros[7] == Temperatura maxima aceitavel
                Analytics(numeros[1], numeros[2], numeros[3], numeros[4], numeros[5]);

            } 
        }

        xhttp.send();
         

        
    }

    att();
    

    setInterval(() => {
        try{
            att();
        } catch (err) { console.log(err);}
    }, 5000);


</script>