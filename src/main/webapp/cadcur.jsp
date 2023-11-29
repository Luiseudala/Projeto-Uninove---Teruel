<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
        // Recebendo os dados digitados no form
        String codigo = request.getParameter("codigo");
        String nome = request.getParameter("nome");
        String duracao = request.getParameter("duracao");
        String periodo = request.getParameter("periodo");

    %>
        <p>
            Salvando curso <strong><%= nome %></strong>
        </p>
        <%

            try {
                // Conectar com o banco de dados          
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "Cmtc98290594");
                //Jogar os dados na tabela cursos do BD
                PreparedStatement st = con.prepareStatement("INSERT INTO curso VALUES(?,?,?,?)");
                st.setString(1, codigo);
                st.setString(2, nome);
                st.setString(3, duracao);
                st.setString(4, periodo);
                st.executeUpdate(); //Executa o INSERT

                out.print("O curso foi cadastrado com sucesso");
            } catch (Exception erro) {
                erro.printStackTrace();
                out.print(erro);
            }
        %>
    </body>
</html>

