export function drawDots() {
    $.ajax({
        type: "GET",
        url: "getDotData",
        success: function (data) {
            if (data !== "-1") {
                let collectionX = JSON.parse(data["x"]);
                var size = collectionX.length;

                let collectionY = JSON.parse(data["y"]);
                let collectionR = JSON.parse(data["R"]);
                let collectionAnswer = JSON.parse(data["answer"]);
                const canvas = document.getElementById("shedule");
                let context = canvas.getContext("2d");

                for (let i = 0; i < size; i++) {
                    let x = collectionX[i];
                    let y = collectionY[i];
                    let R = collectionR[i];
                    let answer = collectionAnswer[i];
                    if (answer === "yes") context.fillStyle = 'green';
                    else context.fillStyle = 'red';
                    context.beginPath();
                    x = 240 + x * 80 / R * 2;
                    y = 250 - y * 80 / R * 2;
                    console.log(x);
                    console.log(y);
                    context.arc(x, y, 3, 0, 2 * Math.PI);
                    context.fill();
                }
            }
        }
    });
}
