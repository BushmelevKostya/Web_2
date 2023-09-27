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



<table class="main-table">
  <tr>
    <td rowspan="14" class="side-panel"></td>
    <td colspan="4">
      <div>
        <h4 class="header gradient-white">Bushmelev Kostya, Group P3218, Variant 557474</h4>
      </div>
    </td>
    <td rowspan="14" class="side-panel"></td>
  </tr>
  <form method="POST" class="main-form" action="controller">
    <tr>
      <th class="header-x">x</th>
      <th>y</th>
      <th class="R">R</th>

      <td rowspan="10" class="submit-button-block">
        <input type="submit" class="submit-button" id="submit-button" value="Отправить">
      </td>

    </tr>
    <tr>
      <td class="radio-button-block">
        <label for="radio1">-4
          <input type="radio" id="radio1" name="radio" value="-4" class="radio-button">
          <span class="custom-radio"></span>
        </label>
      </td>
      <td rowspan="9" class="input-text-block">
        <label for="text" class="text-label">
          <div class="gradient-blue">Область определения: [-5, ..., 3]</div>
        </label>
        <input type="text" id="text" name="text" class="input-text">
      </td>
      <td rowspan="2" class="input-button-block">
        <input type="button" id="button1" name="button" value="1" onclick="send.call(this, 1)"
               class="input-button">
        <input type="hidden" name="press_button" value="" id="press_button">
      </td>
    </tr>
    <tr>
      <td class="radio-button-block">
        <label for="radio2">-3
          <input type="radio" id="radio2" name="radio" value="-3" class="radio-button">
          <span class="custom-radio"></span>
        </label>
      </td>
    </tr>
    <tr>
      <td class="radio-button-block">
        <label for="radio3">-2
          <input type="radio" id="radio3" name="radio" value="-2" class="radio-button">
          <span class="custom-radio"></span>
        </label>
      </td>
      <td rowspan="2" class="input-button-block">
        <input type="button" id="button2" name="button" value="2" onclick="send.call(this, 1.5)"
               class="input-button">
      </td>
    </tr>
    <tr>
      <td class="radio-button-block">
        <label for="radio4">-1
          <input type="radio" id="radio4" name="radio" value="-1" class="radio-button">
          <span class="custom-radio"></span>
        </label>
      </td>
    </tr>
    <tr>
      <td class="radio-button-block">
        <label for="radio5">0
          <input type="radio" id="radio5" name="radio" value="0" class="radio-button">
          <span class="custom-radio"></span>
        </label>
      </td>
      <td rowspan="2" class="input-button-block">
        <input type="button" id="button3" name="button" value="3" onclick="send.call(this, 2)"
               class="input-button">
      </td>
    </tr>
    <tr>
      <td class="radio-button-block">
        <label for="radio6">1
          <input type="radio" id="radio6" name="radio" value="1" class="radio-button">
          <span class="custom-radio"></span>
        </label>
      </td>
    </tr>
    <tr>
      <td class="radio-button-block">
        <label for="radio7">2
          <input type="radio" id="radio7" name="radio" value="2" class="radio-button">
          <span class="custom-radio"></span>
        </label>
      </td>
      <td rowspan="2" class="input-button-block">
        <input type="button" id="button4" name="button" value="4" onclick="send.call(this, 2.5)"
               class="input-button">
      </td>
    </tr>
    <tr>
      <td class="radio-button-block">
        <label for="radio8">3
          <input type="radio" id="radio8" name="radio" value="3" class="radio-button">
          <span class="custom-radio"></span>
        </label>
      </td>
    </tr>
    <tr>
      <td class="radio-button-block">
        <label for="radio9">4
          <input type="radio" id="radio9" name="radio" value="4" class="radio-button">
          <span class="custom-radio"></span>
        </label>
      </td>
      <td class="input-button-block">
        <input type="button" id="button5" name="button" value="5" onclick="send.call(this, 3)"
               class="input-button">
      </td>
    </tr>
  </form>
  <tr>
    <td colspan="4" class="gradient-blue">
      <h2>ТЗ</h2>

      <canvas id = "shedule" width="500" height="500"></canvas>

      <p>Разработать PHP-скрипт, определяющий попадание точки на координатной плоскости в заданную
        область, и
        создать HTML-страницу, которая формирует данные для отправки их на обработку этому скрипту.
      </p>

      <p>
        Параметр R и координаты точки должны передаваться скрипту посредством HTTP-запроса. Скрипт
        должен
        выполнять валидацию данных и возвращать HTML-страницу с таблицей, содержащей полученные
        параметры и
        результат вычислений - факт попадания или непопадания точки в область. Предыдущие результаты
        должны
        сохраняться между запросами и отображаться в таблице.

        Кроме того, ответ должен содержать данные о текущем времени и времени работы скрипта.
      </p>
      <p><b>
        Разработанная HTML-страница должна удовлетворять следующим требованиям:
      </b>
      </p>
      <ul>
        <li class="li-tasks1">
          Для расположения текстовых и графических элементов необходимо использовать табличную
          верстку.
        </li>
        <li class="li-tasks2">
          Данные формы должны передаваться на обработку посредством GET-запроса.
        </li>
        <li class="li-tasks3">
          Таблицы стилей должны располагаться в отдельных файлах.
        </li>
        <li class="li-tasks4">
          При работе с CSS должно быть продемонстрировано использование селекторов псевдоклассов,
          селекторов
          псевдоэлементов, селекторов потомств, селекторов элементов а также такие свойства стилей
          CSS,
          как
          наследование и каскадирование.
        </li>
        <li class="li-tasks5">
          HTML-страница должна иметь "шапку", содержащую ФИО студента, номер группы и новер варианта.
          При
          оформлении шапки необходимо явным образом задать шрифт (cursive), его цвет и размер в
          каскадной
          таблице
          стилей.
        </li>
        <li class="li-tasks6">
          Отступы элементов ввода должны задаваться в процентах.
        </li>
        <li class="li-tasks7">
          Страница должна содержать сценарий на языке JavaScript, осуществляющий валидацию значений,
          вводимых
          пользователем в поля формы. Любые некорректные значения (например, буквы в координатах точки
          или
          отрицательный радиус) должны блокироваться.
        </li>
      </ul>
    </td>
  </tr>
  <tr>
  <td colspan="4">
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
  </td>
  </tr>
</table>

<script src="script/send-form.js"></script>
<script src="script/draw-canvas.js"></script>
<script src="script/validate-form.js"></script>

</body>
</html>