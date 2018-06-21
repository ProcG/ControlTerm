<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Cali_Imperium.Sistema.Atualiza_Perfil.Default" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Atualização de Cadastro</title>
    <link rel="stylesheet" href="atualizar.css">
    <link rel="icon" href="../../Logos/Logo2.png" type="image/png" sizes="55x55">
</head>
    <body>
     <form name="form1" method="post" id="formulario" runat="server">
                <div class="logar"> 
                    <h1>Alteração de Cadastro</h1>
                    <div class="pp">
                        <asp:TextBox runat="server" CssClass="atual" ID="TxtUsuario" placeholder="Digite seu nome"/>
				        <asp:TextBox runat="server" CssClass="atual" ID="TxtTelefone" placeholder="Digite o seu Telefone"/>      
                    
                        <asp:DropDownList runat="server" ID="DdlEstado">
                            
                            <asp:ListItem value="null" Text="--Selecione um estado--"></asp:ListItem>
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
                       </asp:DropDownList>                  
                        <asp:TextBox runat="server" TextMode="Email" CssClass="atual" ID="TxtAtualizarEmail" placeholder="Digite seu Email"/>
                        <asp:TextBox runat="server" TextMode="Password" CssClass="atual" ID="TxtAtualizarSenha" placeholder="Senha"/>
                                          
                    </div>
                   

                    <asp:Button Text="Voltar" CssClass="Cancelar" ID="BtnVoltar" runat="server" OnClick="BtnVoltar_Click"/>

                    <asp:Button Text="Atualizar" CssClass="Alterar" ID="BtnAtualizar" runat="server" OnClick="BtnAtualizar_Click"/>

                   </div>
        </form>
</body>
</html>
