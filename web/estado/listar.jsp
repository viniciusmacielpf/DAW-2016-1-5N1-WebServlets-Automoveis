<%-- 
    Document   : listar
    Created on : 28/03/2016, 20:23:09
    Author     : Vini
--%>

<%@page import="br.edu.ifsul.modelo.Estado"%>
<%@page import="br.edu.ifsul.dao.EstadoDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="estadoDao" scope="session" type="EstadoDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Lista de estados</title>
    </head>
    <body>
        <h1>Lista de estados</h1>
        <a href="../index.html">Início</a>
        <h2><%=estadoDao.getMensagem()%></h2>
        <div style="float:left;"><a href="ServletEstado?acao=incluir">Novo estado</a></div>
        <br>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>UF</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <% for(Estado e : estadoDao.getLista()){ %>
            <tr>
                <td><%=e.getId()%></td>
                <td><%=e.getNome()%></td>
                <td><%=e.getUf()%></td>
                <td><a href="ServletEstado?acao=alterar&id=<%=e.getId()%>">Alterar</a>
                    <a href="ServletEstado?acao=excluir&id=<%=e.getId()%>">Excluir</a></td>
            </tr>
            <% }%>
            </tbody>
        </table>
    </body>
</html>
