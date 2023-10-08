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
<p class="error-message">
<%= "   Error: " + request.getAttribute("error") + ".\nPlease check correctness of fields" %>
</p>
</body>

</html>