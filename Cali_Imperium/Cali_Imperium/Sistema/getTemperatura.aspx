<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getTemperatura.aspx.cs" Inherits="Cali_Imperium.Sistema.getTemperatura" %>

<%=new Caliimperium.Temperatura().PegarTemperatura()+"-"%>
<%=new Caliimperium.Temperatura().PegarTempMinima()+"-"%>
<%=new Caliimperium.Temperatura().Pegar2Quartil()+"-"%>
<%=new Caliimperium.Temperatura().PegarMediana()+"-"%>
<%=new Caliimperium.Temperatura().Pegar3Quartil()+"-"%>
<%=new Caliimperium.Temperatura().PegarTempMaxima()+"-"%>

