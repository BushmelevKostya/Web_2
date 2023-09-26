document.getElementById("submit-button").addEventListener("click", function () {
    sendAjaxRequest();
})

function sendAjaxRequest() {
    const form = $("form");
    $.ajax({
        type: "POST",
        url: "/hit",
        data: form.serialize(),
        contentType: 'application/json',
        success: function (response) {
            const json = JSON.parse(response);
            if (json.error !== "") {
                console.log(json.error);
                form[0].reset();
            }
            else {
                // let tablePrinter = new TablePrinter();
                // tablePrinter.run(json.x, json.y, json.R, json.res, json.workTime);
                // form[0].reset();
            }
        }
    });
}