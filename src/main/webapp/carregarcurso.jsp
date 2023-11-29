<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //Recebe o código digitada do forme altcur
            String c;
            c = request.getParameter("codigo");
            //Conexão com o banco de dados
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "Cmtc98290594");
            //Buscar o cursos na tabela do banco de dados
            PreparedStatement st = con.prepareStatement("SELECT * FROM curso WHERE codigo = ?");
            st.setString(1, c);
            ResultSet curso = st.executeQuery(); //Executa o select da linha anterior
            //Checar se o curso foi encontrado
            if(curso.next()){
            //Carregar o curso em um form html
                String periodo = curso.getString("periodo");
            %>
            <form method="post" action="altcur.jsp">
            <p>
           <label for="cod">Código:</label>
           <input id="cod" type="text" name="codigo" size="6" maxlength="6" required readonly value="<%= curso.getString("codigo") %>">  
        </p>
        <p>
            <label for="nom">Nome do curso:</label>
            <input id="nom" type="text" name="nome" size="50" maxlength="50" required value="<%= curso.getString("nome") %>">  
         </p>
         <p>
            <label for="dur">Duração:</label>
            <input id="dur" type="text" name="duracao" size="15" maxlength="15" value="<%= curso.getString("duracao") %>">  
         </p>
         <p>
            <label for="per">Período:</label>
            <select id="per" name="periodo">
                <option value="Diurno">Manhã</option>
                <option value="Noturno">Noite</option>                
            </select>

            <input type="hidden" id="periodo" value="<%= periodo %>" />
         </p>
         <p>
            <input type="submit" value="Salvar Alterações">
         </p>

         <script>
            const periodo = document.getElementById('periodo');
            const periodoCombobox = document.getElementById('per');

            window.onload = function() {
                for (var i = 0; i < periodoCombobox.options.length; i++) {
                    const option = periodoCombobox.options[i];
                    if (option.value === periodo.value) {
                        periodoCombobox.selectedIndex = i;
                        break;
                    }
                }
            };
         </script>
        </form>
            <%
            } else { //se não for encontrado
              out.print("Curso não encontrado");
            }
            %>
    </body>
</html>
