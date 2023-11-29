<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //Receber o código digitado
            String c;
            c = request.getParameter("codigo");
            try {
                //Conectar com o banco de dados
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "Cmtc98290594");
                //Excluir o curso
                PreparedStatement st = con.prepareStatement("DELETE FROM curso WHERE codigo = ?");
                st.setString(1, c);
                int retorno = st.executeUpdate(); //Executa o Delete
                if (retorno == 1) {
                    out.print("Curso " + c + " excluído com sucesso");
                } else {
                    out.print("Este curso " + c + " não está cadastrado");
                }
            } catch (Exception erro) {
                out.print("Entre em contato com o suporte e informe o erro " + erro.getMessage());
            }
        %>
    </body>
</html>
