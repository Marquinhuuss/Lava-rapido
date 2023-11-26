<%-- 
    Document   : ex_atualizar
    Created on : 24 de nov. de 2023, 19:54:27
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
        <title>Atualizar</title>
    </head>
    <body>
        <h1>Lavagem</h1>
        <%            
             // Recebendo dados
            int id = Integer.parseInt(request.getParameter("ident"));
            String nome = request.getParameter("nome");
            String sobrenome = request.getParameter("sobrenome");
            String carro = request.getParameter("carro");
            String placa = request.getParameter("placa");
            String tipo = request.getParameter("tipo");
            
            
            //Alterar!
            try{
                Connection con = Conexao.getConexao();
                PreparedStatement comando = con.prepareStatement("update lavagens set nome = ?, sobrenome = ?, carro = ?, placa = ?, tipo = ? where id = ?");
                comando.setString(1, nome);
                comando.setString(2, sobrenome);
                comando.setString(3, carro);
                comando.setString(4, placa);
                comando.setString(5, tipo);
                comando.setInt(6, id);
                comando.execute();
                con.close(); //fecha

                //Saída
                out.println("<b> Registro alterado com sucesso! </b>");                 
            }
            catch(Exception ex){
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
            }
            
            //Saída
            out.println("<b> Registro  Alterado </b>");
         

        %>
    </body>
</html>
