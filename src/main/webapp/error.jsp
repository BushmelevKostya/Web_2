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
<a href="${pageContext.request.contextPath}/">Return to main page</a>
<div class="error-info">
    <p class="error-type">Type: <%= pageContext.getException().getClass().toString()%>
    <p class="error-message">Message: <%= pageContext.getException().getMessage()%>
</div>
</body>

</html>