<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getTemperatura.aspx.cs" Inherits="Cali_Imperium.Sistema.getTemperatura" %>

<% Cali_Imperium.Usuario a = (Cali_Imperium.Usuario)Session["Usuario"]; if (a == null) { Response.Redirect("../TelaLogin/Login.aspx"); } %>

<% try{ %>
<%=Caliimperium.Temperatura.GetNumeros(a.ID)%>
<% }catch{ Response.Write(""); } %>
