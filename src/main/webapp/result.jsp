<%@ page import="model.Dote" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html public "-//W3C//DTD HTML 4.01//EN">
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Bomb project</title>
    <link rel="stylesheet" href="stylesheets/style.css">
    <link rel="icon" href="ico/favicon.ico">
</head>
<body>

<div class="data-table" id="main-data-table">

    <table border="1" class="data-table" id="data-table">
        <caption class="gradient-blue">Таблица результатов запроса</caption>
        <tr>
            <th class="data-header">id</th>
            <th class="data-header">x</th>
            <th class="data-header">y</th>
            <th class="data-header">R</th>
            <th class="data-header">Попадание</th>
        </tr>
        <tbody id="data-body">
        <%
            ArrayList<Dote> dotList = (ArrayList<Dote>) request.getAttribute("Dot-list");
            ArrayList<Double> RList = (ArrayList<Double>) request.getAttribute("R-list");
            ArrayList<String> AnswerList = (ArrayList<String>) request.getAttribute("Answer-list");
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
            <th><%= AnswerList.get(i) %>
            </th>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

</body>
</html>
