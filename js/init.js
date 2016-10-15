$(document).ready(function(e) {
    $('nav').load('lib/nav.html', function() {
        if ($.cookie("userID") != undefined) {
            $("#displayname").html($.cookie("displayname"));
            $("#login-button").html('<a href="#">注销</a>');
            $("#login-button").children("a").click(function() {
                $.get("API/logout.php");
                $.removeCookie("displayname");
                $.removeCookie("userID");
                location.href = "index.html";
            });
        }
        
    });
    $('footer').load('lib/footer.html');
    
    $('.button-collapse').sideNav();
    $('.parallax').parallax();
    
    
});