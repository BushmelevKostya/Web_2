<%@ page import="model.Dote" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Bomb project</title>
    <link rel="stylesheet" href="stylesheets/style.css">
    <link rel="icon" href="ico/favicon.ico">
</head>
<body>
<a href="${pageContext.request.contextPath}/">Вернуться на главную страницу</a>
<div class="data-table" id="main-data-table">

    <table border="1" class="data-table" id="data-table">
        <caption class="gradient-red">Таблица результатов запроса</caption>
        <tr>
            <th class="gradient-black">id</th>
            <th class="gradient-black">x</th>
            <th class="gradient-black">y</th>
            <th class="gradient-black">R</th>
            <th class="gradient-black">Попадание</th>
        </tr>
        <tbody id="data-body">
        <%
            
            ArrayList<Dote> dotList = (ArrayList<Dote>) session.getAttribute("Dot-list");
            ArrayList<Double> RList = (ArrayList<Double>) session.getAttribute("R-list");
            ArrayList<String> AnswerList = (ArrayList<String>) session.getAttribute("Answer-list");
            int size = dotList.size();
            for (int i = 0; i < size; i++) {
        %>
        <tr>
            <th><%= i + 1 %>
            </th>
            <th><%= dotList.get(i).x() %>
            </th>
            <th><%= dotList.get(i).y() %>
            </th>
            <th><%= RList.get(i) %>
            </th>
            <%
                String answer = AnswerList.get(i);
                if (answer.equals("yes")) {
            %>
            <th class="green-response"><%= answer %>
            </th>
            <%
            } else {
            %>
            <th class="red-response"><%= answer %>
            </th>
            <%
                }
            %>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

</body>
</html>
