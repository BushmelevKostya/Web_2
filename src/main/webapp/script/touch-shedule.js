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
            const y = ((-(event.offsetY - 250) / 80) * R, 4).toFixed(4);
            sendRequest(x, y, R * 2);
        }
    });
}

function sendRequest(x, y, R) {
    return new Promise(function (resolve, reject) {
        let xhr = new XMLHttpRequest();
        xhr.open("POST", "controller", true);
        xhr.setRequestHeader("Content-type", "application/json");

        const data = {
            radio: x,
            text: y,
            press_button: R
        };
        const json = JSON.stringify(data);

        xhr.onreadystatechange = function () {
            window.location.href = "result.jsp";
        }

        xhr.send(json);
    })
}