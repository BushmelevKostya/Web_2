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

<header>
    <div class="header gradient-white">Bushmelev Kostya, Group P3218, Variant 557474</div>
</header>

<body>
<div class="main-form">
    <form method="POST" action="controller">

        <div class="x radio-button-block">
            <label for="radio1">-4
                <input type="radio" id="radio1" name="radio" value="-4" class="radio-button">
                <span class="custom-radio"></span>
            </label>

            <label for="radio2">-3
                <input type="radio" id="radio2" name="radio" value="-3" class="radio-button">
                <span class="custom-radio"></span>
            </label>

            <label for="radio3">-2
                <input type="radio" id="radio3" name="radio" value="-2" class="radio-button">
                <span class="custom-radio"></span>
            </label>

            <label for="radio4">-1
                <input type="radio" id="radio4" name="radio" value="-1" class="radio-button">
                <span class="custom-radio"></span>
            </label>

            <label for="radio5">0
                <input type="radio" id="radio5" name="radio" value="0" class="radio-button">
                <span class="custom-radio"></span>
            </label>

            <label for="radio6">1
                <input type="radio" id="radio6" name="radio" value="1" class="radio-button">
                <span class="custom-radio"></span>
            </label>

            <label for="radio7">2
                <input type="radio" id="radio7" name="radio" value="2" class="radio-button">
                <span class="custom-radio"></span>
            </label>

            <label for="radio8">3
                <input type="radio" id="radio8" name="radio" value="3" class="radio-button">
                <span class="custom-radio"></span>
            </label>

            <label for="radio9">4
                <input type="radio" id="radio9" name="radio" value="4" class="radio-button">
                <span class="custom-radio"></span>
            </label>
        </div>

        <div class="y input-text-block">
            <label for="text" class="text-label">
                <span class="gradient-blue">Область определения: [-5, ..., 3]</span>
            </label>
            <input type="text" id="text" name="text" class="input-text">
        </div>

        <div class="R input-button-block">
            <input type="button" id="button1" name="button" value="1" onclick="send.call(this, 1)"
                   class="input-button">
            <input type="hidden" name="press_button" value="" id="press_button">

            <input type="button" id="button2" name="button" value="2" onclick="send.call(this, 2)"
                   class="input-button">

            <input type="button" id="button3" name="button" value="3" onclick="send.call(this, 3)"
                   class="input-button">

            <input type="button" id="button4" name="button" value="4" onclick="send.call(this, 4)"
                   class="input-button">

            <input type="button" id="button5" name="button" value="5" onclick="send.call(this, 5)"
                   class="input-button">
        </div>

        <div class="submit submit-button-block">
            <input type="submit" class="submit-button" id="submit-button" value="Отправить">
        </div>

    </form>
</div>
<div class="canvas">
    <canvas id="shedule" width="500" height="500"></canvas>
</div>
<div class="tasks">
    <ul>
        <li class="li-tasks1">
            Разработанная страница JSP должна содержать:

            "шапку", содержащую ФИО студента, номер группы и номер варианта;
        </li>
        <li class="li-tasks2">
            Форму, отправляющую данные на сервер;
        </li>
        <li class="li-tasks3">
            Набор полей для задания координат точки и радиуса области в соответствии с вариантом задания;
        </li>
        <li class="li-tasks4">
            Сценарий на языке JavaScript, осуществляющий валидацию значений, вводимых пользователем в поля формы;
        </li>
        <li class="li-tasks5">
            Интерактивный элемент, содержащий изображение области на координатной плоскости (в соответствии с вариантом
            задания) и реализующий следующую функциональность:
            Если радиус области установлен, клик курсором мыши по изображению должен обрабатываться JavaScript-функцией,
            определяющей координаты точки, по которой кликнул пользователь и отправляющей полученные координаты на
            сервер для проверки факта попадания;
            В противном случае после клика по картинке должно выводиться сообщение о невозможности определения координат
            точки;
            После проверки факта попадания точки в область изображение должно быть обновлено с учётом результатов этой
            проверки (т.е., на нём должна появиться новая точка);
        </li>
        <li class="li-tasks6">
            Таблицу с результатами предыдущих проверок. Список результатов должен браться из HTTP-сессии.
        </li>
        <li class="li-tasks7">
            Страница, возвращаемая AreaCheckServlet, должна содержать:

            таблицу, содержащую полученные параметры;
            Результат вычислений - факт попадания или непопадания точки в область;
            Ссылку на страницу с веб-формой для формирования нового запроса.
        </li>
    </ul>
</div>

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
            HttpSession httpSession = request.getSession();
            ArrayList<Dote> dotList = (ArrayList<Dote>) httpSession.getAttribute("Dot-list");
            ArrayList<Double> RList = (ArrayList<Double>) httpSession.getAttribute("R-list");
            ArrayList<String> AnswerList = (ArrayList<String>) httpSession.getAttribute("Answer-list");
            if (dotList == null) dotList = new ArrayList<>();
            if (RList == null) RList = new ArrayList<>();
            if (AnswerList == null) AnswerList = new ArrayList<>();
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

<input type="hidden" id="R-data">
<script src="script/send-form.js"></script>
<script type="module" src="script/draw-canvas.js"></script>
<script src="script/validate-form.js"></script>
<script src="script/touch-shedule.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="module" src="script/draw-dots.js"></script>

</html>