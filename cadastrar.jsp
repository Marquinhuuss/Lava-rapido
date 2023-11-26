<%-- 
    Document   : cadastrar
    Created on : 24 de nov. de 2023, 19:08:21
    Author     : marco
--%>

<%@page import="model.Conexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Lavagem"%>
<%@page import="java.text.*" import="java.lang.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Lavagens</title>
    </head>
    <body>
        <h1>Lavagem</h1>
        <%
         
            Lavagem lav = new Lavagem();  

            lav.setNome(request.getParameter("nome"));
            lav.setSobrenome(request.getParameter("sobrenome"));
            lav.setCarro(request.getParameter("carro"));
            lav.setPlaca(request.getParameter("placa"));
            lav.setTipo(request.getParameter("tipo"));
            

           
            try {
                Connection con = Conexao.getConexao();
                PreparedStatement comando = con.prepareStatement("insert into lavagens (nome, sobrenome, carro, placa, tipo) values(?,?,?,?,?)"); 
                comando.setString(1, lav.getNome());
                comando.setString(2, lav.getSobrenome());
                comando.setString(3, lav.getCarro());
                comando.setString(4, lav.getPlaca());
                comando.setString(5, lav.getTipo());
                
                comando.execute();
                con.close();
                                
            } catch (Exception ex) {
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
            }

            
            out.println("<b> Lavagem Registrada </b>");
            out.println("<br> Nome: " + lav.getNome());
            out.println("<br>Sobrenome: " + lav.getSobrenome());
            out.println("<br> Carro: " + lav.getCarro());
            out.println("<br> Placa: " + lav.getPlaca());
            out.println("<br>Tipo: " + lav.getTipo());
            
        %>
    </body>
</html>
