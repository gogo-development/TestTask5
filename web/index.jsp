<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>TestTask5</title>
    <%@ page import="app.ModelTMP" %>
    <%@ page contentType="text/html;charset=UTF-8" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>
    <script src="/scripts/calendar/tcal.js"></script>
    <%--    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.js"></script>--%>
    <link rel="stylesheet" type="text/css" href="/scripts/calendar/tcal.css"/>
</head>

<body>
<div>
    <h1>Список товаров</h1>
</div>

<button onclick="openForm()">Добавить продукт</button>

<div id="mainTable">
</div>
<%--<table id="mainTable" border="1">--%>
<%--    <tr>--%>
<%--        <th>Идентификатор</th>--%>
<%--        <th>Название</th>--%>
<%--        <th>Описание</th>--%>
<%--        <th>Добавлен в базу</th>--%>
<%--        <th>Ячейка хранения</th>--%>
<%--        <th>Зарезервирован</th>--%>
<%--        <th>Изменить запись</th>--%>
<%--    </tr>--%>
<%--</table>--%>
<p id="test">
test
</p>

<%--<p><input type="button" value="Удалить" onclick="return Delete(this);"></p>--%>

<div id="CreateForm">
    <form action="/create" onsubmit="return validateForm()">
        <h1>Создание продукта</h1>
        <label for="name"><b>Название</b></label>
        <input type="text" id="name" maxlength="512" required>
        <br>
        <label for="description"><b>Описание</b></label>
        <textarea type="text" id="description" maxlength="1024" rows="3" cols="22" required></textarea>
        <br>
        <label for="create_date"><b>Добавлен в базу</b></label>
        <input type="text" id="create_date" class="tcal" required>
        <br>
        <label for="place_storage"><b>Ячейка хранения</b></label>
        <input type="text" id="place_storage" required>
        <br>
        <label for="reserved"><b>Зарезервирован</b></label>
        <input type="checkbox" id="reserved">
        <br>
        <button type="submit">Создать</button>
        <br>
        <button type="button" onclick="closeForm()">Отмена</button>
    </form>
</div>
<script>

    // function validateForm() {
    // var result;
    // var date = document.forms["CreateForm"]["create_date"].value;
    // var arrD = date.split(".");
    // arrD[1] -= 1;
    // var d = new Date(arrD[2], arrD[1], arrD[0]);
    // if ((d.getFullYear() == arrD[2]) && (d.getMonth() == arrD[1]) && (d.getDate() == arrD[0])) {
    //     result = true;
    // } else {
    //     alert("Введена некорректная дата");
    //     result = false;
    // }
    //
    //     var i = document.forms["CreateForm"]['place_storage'].value;
    //     if (isFinite(i) && +i >=0) {
    //         // if (!isNaN(+i) && isFinite(i) && +i >=0) {
    //         result = true;
    //     } else {
    //         alert("Введен некорректный номер ячейки хранения");
    //         result = false;
    //     }
    //     return result;
    // }
</script>
<script>
    var xmlHttp = new XMLHttpRequest();

    //TODO: Создание объекта XMLHttpRequest для всех браузеров

    function Refresh() {
        xmlHttp.open("GET", "/refresh", true);
        xmlHttp.send();
        xmlHttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var myObj = JSON.parse(this.responseText);
                var tableContent = "<table border=\"1\"><tr><th>Идентификатор</th><th>Название</th><th>Описание</th><th>Добавлен в базу</th><th>Ячейка хранения</th><th>Зарезервирован</th><th>Изменить запись</th></tr>"
                // var tableContent = "";
                for (var x in myObj) {
                    var date = new Date(+(myObj[x].create_date));
                    tableContent += "<tr><td>" +
                        myObj[x].id + "</td><td>" +
                        myObj[x].name + "</td><td>" +
                        myObj[x].description + "</td><td>" +
                        date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDay() + "</td><td>" +
                        //TODO: day and month to MM-dd
                        myObj[x].place_storage + "</td><td>" +
                        myObj[x].reserved + "</td><td><button name=" +
                        myObj[x].id + " onclick='return Update(this);'>Редактировать</button>&nbsp<button name=" +
                        myObj[x].id + " onclick='return Delete(this);'>Удалить</button></td></tr>";
                }
                tableContent += "</table>"
                document.getElementById("mainTable").innerHTML = tableContent;
            }
        };
    };

    function Delete(Element) {
        xmlHttp.open("GET", "/delete", true);
        xmlHttp.send("id=" + Element.name);

        xmlHttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                // if ((this.responseText) == "true"
                //     app
                document.getElementById("test").innerHTML = this.responseText;
                Refresh();
            }
        };
    }

    //Управление формой товара
    function openForm() {
        document.getElementById("CreateForm").style.display = "block";
    }

    function closeForm() {
        document.getElementById("CreateForm").style.display = "none";
    }

    // Маска даты
    $(function () {
        $('input#create_date').mask('99.99.9999');
    });

    Refresh();
</script>
</body>
</html>