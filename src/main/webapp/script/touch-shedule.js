touchSchedule();

function touchSchedule() {
    const canvas = document.getElementById("shedule");

    canvas.addEventListener('click',function (event) {
        let R = "R";
        const RData = document.getElementById("R-data").innerText;

        if (RData !== "") R = RData;
        if (R === "R") {
            alert("Impossible to define coordinate! Try choosing a radius")
        } else {
            R = Number(R) / 2;
            const x = ((event.offsetX - 240) / 80) * R;
            const y = (-(event.offsetY - 250) / 80) * R;
            alert(x + " " + y);
        }
    });
}