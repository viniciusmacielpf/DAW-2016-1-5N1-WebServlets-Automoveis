<%-- 
    Document   : listar
    Created on : 28/03/2016, 20:23:09
    Author     : Vini
--%>

<%@page import="br.edu.ifsul.modelo.Cidade"%>
<%@page import="br.edu.ifsul.dao.CidadeDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="cidadeDao" scope="session" type="CidadeDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Lista de ciadades</title>
    </head>
    <body>
        <h1>Lista de cidades</h1>
        <a href="../index.html">Início</a>
        <h2><%=cidadeDao.getMensagem()%></h2>
        <div style="float:left;"><a href="ServletCidade?acao=incluir">Nova Cidade</a></div>
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
                <% for(Cidade c : cidadeDao.getLista()){ %>
            <tr>
                <td><%=c.getId()%></td>
                <td><%=c.getNome()%></td>
                <td><%=c.getEstado().getNome()%></td>
                <td><a href="ServletCidade?acao=alterar&id=<%=c.getId()%>">Alterar</a>
                    <a href="ServletCIdade?acao=excluir&id=<%=c.getId()%>">Excluir</a></td>
            </tr>
            <% }%>
            </tbody>
        </table>
    </body>
</html>
