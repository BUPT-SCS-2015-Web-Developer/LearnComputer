$(document).ready(function(e) {
    $('nav').load('lib/nav.html');
    $('footer').load('lib/footer.html');
    
    $('.button-collapse').sideNav();
    $('.parallax').parallax();
});

function loadMedia(mediaID) {
    $('main').load('lib/view.html');
    
}