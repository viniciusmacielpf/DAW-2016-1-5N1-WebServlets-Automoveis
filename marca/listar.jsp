<%-- 
    Document   : listar
    Created on : 28/03/2016, 20:23:09
    Author     : Vini
--%>

<%@page import="br.edu.ifsul.modelo.Marca"%>
<%@page import="br.edu.ifsul.dao.MarcaDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="marcaDao" scope="session" type="MarcaDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Lista de marca</title>
    </head>
    <body>
        <h1>Lista de marca</h1>
        <a href="../index.html">Início</a>
        <h2><%=marcaDao.getMensagem()%></h2>
        <div style="float:left;"><a href="ServletMarca?acao=incluir">Novo marca</a></div>
        <br>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <% for(Marca m : marcaDao.getLista()){ %>
            <tr>
                <td><%=m.getId()%></td>
                <td><%=m.getNome()%></td>
                <td><a href="ServletMarca?acao=alterar&id=<%=m.getId()%>">Alterar</a>
                    <a href="ServletMarca?acao=excluir&id=<%=m.getId()%>">Excluir</a></td>
            </tr>
            <% }%>
            </tbody>
        </table>
    </body>
</html>
