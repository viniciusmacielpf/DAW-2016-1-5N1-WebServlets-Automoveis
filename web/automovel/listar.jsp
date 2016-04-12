<%-- 
    Document   : listar
    Created on : 28/03/2016, 20:23:09
    Author     : Vini
--%>

<%@page import="br.edu.ifsul.modelo.Automovel"%>
<%--<%@page import="br.edu.ifsul.modelo.Cidade"%>--%>
<%@page import="br.edu.ifsul.dao.AutomovelDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="automovelDao" scope="session" type="AutomovelDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Lista de ciadades</title>
    </head>
    <body>
        <h1>Lista de Automoveis</h1>
        <a href="../index.html">Início</a>
        <h2><%=automovelDao.getMensagem()%></h2>
        <div style="float:left;"><a href="ServletAutomovel?acao=incluir">Novo Automovel</a></div>
        <br>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Modelo</th>
                    <th>Marca</th>
                    <th>Ano</th>
                    <th>KM</th>
                    <th>Estado</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <% for(Automovel a : automovelDao.getLista()){ %>
            <tr>
                <td><%=a.getId()%></td>
                <td><%=a.getModelo()%></td>
                <td><%=a.getMarca().getNome()%></td>
                <td><%=a.getAno()%></td>
                <td><%=a.getQuilometragem()%></td> 
                <td><%=a.getEstadoAtual()%></td>
                <td><a href="ServletAutomovel?acao=alterar&id=<%=a.getId()%>">Alterar</a>
                    <a href="ServletAutomovel?acao=excluir&id=<%=a.getId()%>">Excluir</a></td>
            </tr>
            <% }%>
            </tbody>
        </table>
    </body>
</html>
