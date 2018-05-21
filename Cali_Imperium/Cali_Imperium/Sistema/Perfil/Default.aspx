<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Cali_Imperium.Sistema.Perfil.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Atualizar usuário</title>
    <link rel="stylesheet" href="css/atualizar.css">
</head>
<body>
    <form id="form1" runat="server" name="meuForm" method="post" >
                <div class="logar"> 
                    <h1>Alteração de Cadastro</h1>
                    <div class="pp">
                    <input type="text" class="atual" placeholder="Digite seu nome">
				    <input type="date" class="atual" placeholder="Digite o novo Email">
                    <input type="text" class="atual" placeholder="Digite o seu Telefone">      
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
                        <input type="email" class="atual" placeholder="Digite seu Email">
                        <input type="password" class="atual" placeholder="Senha">
                    </div>
                    <button class="btnCancelar" type="reset">Cancelar</button>
				    <button class="btnAlterar" type="submit">Alterar Cadastrar</button>
                </div>
    </form>
</body>
</html>
