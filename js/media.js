var lastMediaID = 0;
var lastWordID;
var lastExcelID;
var lastPowerpointID;
var lastPhotoshopID;
var userID = getCookie('UserID');
var learnTime = 0;
var learnTime_t;//用于调用setTimeout

$(document).ready(function(e) {

    $.getJSON('API/recent.php', function(data) {
        lastMediaID = data.LastID;
        lastWordID = data.LastWordID;
        lastExcelID = data.LastExcelID;
        lastPowerpointID = data.LastPowerpointID;
        lastPhotoshopID = data.LastPhotoshopID;
    });
    $('#continue').click(function() {
        loadMedia(lastMediaID);
    });
    $("#continue-word").click(function () {
        loadMedia(lastWordID);
    });
    $("#continue-excel").click(function () {
        loadMedia(lastExcelID);
    });
    $("#continue-powerpoint").click(function () {
        loadMedia(lastPowerpointID);
    });
    $("#continue-photoshop").click(function () {
        loadMedia(lastPhotoshopID);
    });
});

function loadMedia(mediaID) {
    $.getJSON('API/getTime.php', {
        "UserID": userID,
        "MediaID": mediaID
    }, function(data) {
        if(data.result === "succeeded") {
            $('main').load('lib/view.html', function() {
                $("#media-title").html(data.media[0].title);
                $("#media-file").attr("src", "media/" + data.media[0].file);
                $("#learn-time").html("您已学习" + data.media[0].time + "分钟");
                learnTime = data.media[0].time;
                if (learnTime < 5) {
                    $("#next").addClass("disabled");
                }
                learnTime_t = setTimeout("timeCount()", 60000);
            });
        }
    });
}

function timeCount() {
    learnTime = learnTime + 1;
    $("#learn-time").html("您已学习" + learnTime + "分钟");
    if (learnTime >= 5) {
        $("#next").removeClass("disabled");
    }
    learnTime_t = setTimeout("timeCount()", 60000);
}

function loadCatalogue(type) {
    $.getJSON('API/getTime.php', {
        "UserID": userID,
        "ClassType": type
    }, function(data){
        if (data.result === "succeeded") {
            var lastLearned = 1;
            for (index in data.result) {
                $("#catalogue").append('<div class="col m4"><a class="btn-flat" id="media' + data.media[index].MediaID + '">' + data.media[index].title + ' <span class="chip">' + data.media[index].time + '</span></a></div>');
                $('#media' + data.media[index].MediaID).click(function() {
                    loadMedia($(this).attr("id").match("d+"));
                });
                if (lastLearned == 0) {
                    $('#media' + data.media[index].MediaID).addClass("disabled");
                }
                if (data.media[index].time < 5) {
                    lastLearn = 0;
                } else {
                    lastLearn = 1;
                }
            }
        }
    });
}