document.getElementById("submit-button").addEventListener("click", function () {
    sendAjaxRequest(event);
})

function sendAjaxRequest(event) {
    const form = $("form");
    event.preventDefault();
    $.ajax({
        type: "POST",
        cache: false,
        url: "controller",
        data: form.serialize(),
        contentType: 'application/json',
        success: function (response) {
            const json = JSON.parse(response);
            if (json.error !== "") {
                console.log(json.error);
                form[0].reset();
            }
        }
    });
}