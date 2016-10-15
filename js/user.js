$(document).ready(function(e) {
    $('#login').click(function () {
        $.ajax({
            url: "API/signin.php", 
            type: "POST",
            data: {
                "displayname": $("#displayname").val()
            }, 
            success: function (data) {
                if (data.result == "failed") {
                    $("#login-fail").openModal();
                } else {
                    $.cookie("displayname", data.displayname, {path: '/'});
                    $.cookie("userID", data.UserID, {path: '/'});
                    location.href = "content.html";
                }
            },
            dataType: "json"
        });
    });
    $("#signup").click(function () {
        $.ajax({
            url: "API/signup.php",
            type: "POST",
            data: {
                "displayname": $("#displayname").val()
            },
            success: function (data) {
                if (data.result == "available") {
                    $("#signup-succeed").openModal();
                } else {
                    $("#signup-fail").openModal();
                }
            },
            dataType: "json"
        });
    });
});