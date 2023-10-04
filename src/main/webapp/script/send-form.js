function send(press_value) {
    this.form['press_button'].value = press_value;

    import {drawCanvas} from "./draw-canvas";
    drawCanvas(press_value);

    document.getElementById("R-data").innerText = press_value;
}