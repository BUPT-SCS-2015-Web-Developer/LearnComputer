var lastMediaID = 0;
var lastWordID;
var lastExcelID;
var lastPowerpointID;
var lastPhotoshopID;
var userID = $.cookie('userID');
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
                $("#media-title").html('<span id="media-id"></span>' + data.media[0].title);
                $("#media-file").attr("src", "media/" + data.media[0].file);
                $("#media-id").attr("media-id", data.media[0].MediaID);
                learnTime = parseInt(data.media[0].time);
                if (isNaN(learnTime)) {
                    learnTime = 0;
                }
                $("#learn-time").html("您已学习" + learnTime + "分钟");
                $("#last").click(function () {
                    saveTime();
                    loadMedia(parseInt($("#media-id").attr("media-id"))-1);
                })
                $("#next").click(function () {
                    saveTime();
                    loadMedia(parseInt($("#media-id").attr("media-id"))+1);
                })
                $("#save").click(function() {
                    saveTime();
                })
                learnTime = data.media[0].time;
                if (learnTime < 5) {
                    $("#next").addClass("disabled");
                }
                learnTime_t = setTimeout("timeCount()", 60000);
            });
        }
    });
}

function saveTime() {
    $.ajax({
        url: "API/getTime.php",
        type: "POST",
        data: {
            "UserID": $.cookie("userID"),
            "MediaID": $("#media-id").attr("media-id"),
            "time": learnTime
        },
        success: function (data) {
            if (data.result == "succeeded") {
            } else {
                alert("保存进度失败");
            }
        },
        dataType: "json"
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
            for (index in data.media) {
                $("#catalogue").append('<div class="col m4"><a class="btn-flat" id="media' + data.media[index].MediaID + '" media-id="' + data.media[index].MediaID + '">' + data.media[index].title + ' <span class="chip">' + data.media[index].time + '</span></a></div>');
                $('#media' + data.media[index].MediaID).click(function() {
                    loadMedia($(this).attr("media-id"));
                });
                if (lastLearned == 0) {
                    $('#media' + data.media[index].MediaID).addClass("disabled");
                }
                learnTime = parseInt(data.media[index].time);
                if (isNaN(learnTime)){
                    learnTime = 0;
                }
                if (learnTime < 5) {
                    lastLearn = 0;
                } else {
                    lastLearn = 1;
                }
            }
        }
    });
}