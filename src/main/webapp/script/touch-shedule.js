touchSchedule();

function touchSchedule() {
    const canvas = document.getElementById("shedule");

    canvas.addEventListener('click', function (event) {
        let R = "R";
        const RData = document.getElementById("R-data").innerText;

        if (RData !== "") R = RData;
        if (R === "R") {
            alert("Impossible to define coordinate! Try choosing a radius")
        } else {
            R = Number(R) / 2;
            const x = (((event.offsetX - 240) / 80) * R).toFixed(4);
            const y = ((-(event.offsetY - 250) / 80) * R).toFixed(4);
            sendRequest(x, y, R * 2);
        }
    });
}

function sendRequest(x, y, R) {
    let xhr = new XMLHttpRequest();
    xhr.open("POST", "controller", false);
    xhr.setRequestHeader("Content-type", "application/json");

    const data = {
        radio: x,
        text: y,
        press_button: R
    };
    const json = JSON.stringify(data);

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // Здесь можно выполнить перенаправление после успешного выполнения запроса
            window.location.href = "result.jsp";
        }
    };

    xhr.send(json);
}