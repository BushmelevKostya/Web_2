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

<table class="main-table">
  <tr>
    <td rowspan="14" class="side-panel"></td>
    <td colspan="4">
      <div>
        <h4 class="header gradient-white">Bushmelev Kostya, Group P3218, Variant 2801</h4>
      </div>
    </td>
    <td rowspan="14" class="side-panel"></td>
  </tr>
  <form method="GET" class="main-form">
    <tr>
      <th class="header-x">x</th>
      <th>y</th>
      <th class="R">R</th>

      <td rowspan="10" class="submit-button-block">
        <input type="button" class="submit-button" id="submit-button" value="Отправить">
      </td>
    </tr>
    <tr>
      <td class="radio-button-block">
        <label for="radio1">-2
          <input type="radio" id="radio1" name="radio" value="-2" class="radio-button">
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
        <label for="radio2">-1.5
          <input type="radio" id="radio2" name="radio" value="-1.5" class="radio-button">
          <span class="custom-radio"></span>
        </label>
      </td>
    </tr>
    <tr>
      <td class="radio-button-block">
        <label for="radio3">-1
          <input type="radio" id="radio3" name="radio" value="-1" class="radio-button">
          <span class="custom-radio"></span>
        </label>
      </td>
      <td rowspan="2" class="input-button-block">
        <input type="button" id="button2" name="button" value="1.5" onclick="send.call(this, 1.5)"
               class="input-button">
      </td>
    </tr>
    <tr>
      <td class="radio-button-block">
        <label for="radio4">-0.5
          <input type="radio" id="radio4" name="radio" value="-0.5" class="radio-button">
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
        <input type="button" id="button3" name="button" value="2" onclick="send.call(this, 2)"
               class="input-button">
      </td>
    </tr>
    <tr>
      <td class="radio-button-block">
        <label for="radio6">0.5
          <input type="radio" id="radio6" name="radio" value="0.5" class="radio-button">
          <span class="custom-radio"></span>
        </label>
      </td>
    </tr>
    <tr>
      <td class="radio-button-block">
        <label for="radio7">1
          <input type="radio" id="radio7" name="radio" value="1" class="radio-button">
          <span class="custom-radio"></span>
        </label>
      </td>
      <td rowspan="2" class="input-button-block">
        <input type="button" id="button4" name="button" value="2.5" onclick="send.call(this, 2.5)"
               class="input-button">
      </td>
    </tr>
    <tr>
      <td class="radio-button-block">
        <label for="radio8">1.5
          <input type="radio" id="radio8" name="radio" value="1.5" class="radio-button">
          <span class="custom-radio"></span>
        </label>
      </td>
    </tr>
    <tr>
      <td class="radio-button-block">
        <label for="radio9">2
          <input type="radio" id="radio9" name="radio" value="2" class="radio-button">
          <span class="custom-radio"></span>
        </label>
      </td>
      <td class="input-button-block">
        <input type="button" id="button5" name="button" value="3" onclick="send.call(this, 3)"
               class="input-button">
      </td>
    </tr>
  </form>
  <tr>
    <td colspan="4" class="gradient-blue">
      <h2>ТЗ</h2>
      <img src="img/areas.png" width=420 alt="areas" class="img-areas">
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
            <th class="data-header">Время запроса</th>
            <th class="data-header">Время обработки запроса(мкс)</th>
          </tr>
          <tbody id="data-body">

          </tbody>
        </table>

      </div>
    </td>
  </tr>
</table>

<%--<script src="script/send-form.js"></script>--%>

<!--<script src="script/validate-form.js"></script>-->

<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
<%--<script src="script/send-ajax-request.js"></script>--%>

<%--<script>--%>
<%--  class Query {--%>
<%--    constructor(id, x, y, R, result, startTime, workTime) {--%>
<%--      this._id = id;--%>
<%--      this._x = x;--%>
<%--      this._y = y;--%>
<%--      this._R = R;--%>
<%--      this._result = result;--%>
<%--      this._startTime = startTime;--%>
<%--      this._workTime = workTime;--%>
<%--    }--%>

<%--    get id() {--%>
<%--      return this._id;--%>
<%--    }--%>

<%--    set id(value) {--%>
<%--      this._id = value;--%>
<%--    }--%>

<%--    get startTime() {--%>
<%--      return this._startTime;--%>
<%--    }--%>

<%--    set startTime(value) {--%>
<%--      this._startTime = value;--%>
<%--    }--%>

<%--    get x() {--%>
<%--      return this._x;--%>
<%--    }--%>

<%--    set x(value) {--%>
<%--      this._x = value;--%>
<%--    }--%>

<%--    get y() {--%>
<%--      return this._y;--%>
<%--    }--%>

<%--    set y(value) {--%>
<%--      this._y = value;--%>
<%--    }--%>

<%--    get R() {--%>
<%--      return this._R;--%>
<%--    }--%>

<%--    set R(value) {--%>
<%--      this._R = value;--%>
<%--    }--%>

<%--    get result() {--%>
<%--      return this._result;--%>
<%--    }--%>

<%--    set result(value) {--%>
<%--      this._result = value;--%>
<%--    }--%>

<%--    get workTime() {--%>
<%--      return this._workTime;--%>
<%--    }--%>

<%--    set workTime(value) {--%>
<%--      this._workTime = value;--%>
<%--    }--%>
<%--  }--%>

<%--  class TablePrinter {--%>
<%--    constructor() {--%>
<%--    }--%>

<%--    run(x, y, R, res, workTime) {--%>
<%--      var array;--%>
<%--      try {--%>
<%--        var stringArray = localStorage.getItem("array");--%>
<%--        array = JSON.parse(stringArray);--%>
<%--      } catch--%>
<%--              (error) {--%>
<%--        console.log(error);--%>
<%--      } finally {--%>
<%--        array = array || [];--%>
<%--        // let res = <?php echo $res; ?>;--%>
<%--        // let workTime = <?php echo $workTime; ?>;--%>
<%--        let id = array.length || 0;--%>
<%--        id += 1;--%>
<%--        let startTime = new Date().toLocaleString();--%>
<%--        let query = new Query(id, x, y, R, res, startTime, workTime);--%>

<%--        array.push(query);--%>
<%--        stringArray = JSON.stringify(array);--%>
<%--        localStorage.setItem("array", stringArray);--%>
<%--      }--%>

<%--      let stringObject = localStorage.getItem("array");--%>
<%--      var object = JSON.parse(stringObject);--%>

<%--      let size = object.length;--%>

<%--      var tbody = document.getElementById("data-body");--%>
<%--      tbody.innerHTML = "";--%>

<%--      for (let i = 0; i < size; i++) {--%>
<%--        var row = tbody.insertRow(-1);--%>

<%--        var cell = row.insertCell(0);--%>
<%--        let data = object[i]._id;--%>
<%--        let newData = document.createTextNode(data);--%>
<%--        cell.classList.add('id-color');--%>
<%--        cell.appendChild(newData);--%>
<%--        cell = row.insertCell(1);--%>
<%--        data = object[i]._x;--%>
<%--        newData = document.createTextNode(data);--%>
<%--        cell.appendChild(newData);--%>
<%--        cell = row.insertCell(2);--%>
<%--        data = object[i]._y;--%>
<%--        newData = document.createTextNode(data);--%>
<%--        cell.appendChild(newData);--%>
<%--        cell = row.insertCell(3);--%>
<%--        data = object[i]._R;--%>
<%--        newData = document.createTextNode(data);--%>
<%--        cell.appendChild(newData);--%>
<%--        cell = row.insertCell(4);--%>
<%--        data = object[i]._result;--%>
<%--        if (data) {--%>
<%--          data = "Да";--%>
<%--          cell.classList.add('green-response');--%>
<%--        } else {--%>
<%--          data = "Нет";--%>
<%--          cell.classList.add('red-response');--%>
<%--        }--%>
<%--        newData = document.createTextNode(data);--%>
<%--        cell.appendChild(newData);--%>
<%--        cell = row.insertCell(5);--%>
<%--        // data = new Date().toLocaleString();--%>
<%--        data = object[i]._startTime;--%>
<%--        newData = document.createTextNode(data);--%>
<%--        cell.appendChild(newData);--%>
<%--        cell = row.insertCell(6);--%>
<%--        data = object[i]._workTime.toFixed(6);--%>
<%--        newData = document.createTextNode(data);--%>
<%--        cell.appendChild(newData);--%>
<%--      }--%>
<%--    }--%>
<%--  }--%>

<%--</script>--%>

</body>
</html>