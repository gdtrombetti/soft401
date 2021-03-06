
$(function() {
    var setHomeBannerHeight = function(){
        var homeHeight= $(window).height();
        $('#height-fix').height(homeHeight);
    }

    setHomeBannerHeight();
});


$(document).ready(function () {
    $("#loadPortfolio").click(function(event) {
        
        $.get("php/ajax_portfolio.html", function(data){
            $('#morePortfolio').append(data);
        });
        event.preventDefault();
        $(this).hide();
    }) ;
});
$(document).ready(function () {
	$("#basic_signup_button").click(function(){
		$('html, body').animate({scrollTop: $(".basic_form").height()});
		$(".basic_form").css("visibility","visible");
		$(".admin_form").css("visibility","hidden");
	});
});
$(document).ready(function () {
	$("#admin_signup_button").click(function(){
		$('html, body').animate({scrollTop: $(".admin_form").height()});
		$(".admin_form").css("visibility","visible");
		$(".basic_form").css("visibility","hidden");
	});
});

function flip() {
    $('.card').toggleClass('flipped');
}

function getFlashCardCount (user_id, title){
	var count;
	$.ajax({
		type: "POST",
		url: "GetFlashCardCount",
		async: false,
		data: { user_id: user_id, title: title },
		success : function ( data ) {
			count = data;
		}
	});
	return count;
};
var password = document.getElementById("password");
confirm_password = document.getElementById("confirm_password");

function validatePassword(){
	if(password.value != confirm_password.value) {
		confirm_password.setCustomValidity("Passwords Don't Match");
	} else {
		confirm_password.setCustomValidity('');
	}
}
password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;

$(document).ready(function () {
    $("#loadGallery").click(function(event) {
        
        $.get("php/ajax_gallery.html", function(data){
            $('#moreGallery').append(data);
        });
        event.preventDefault();
        $(this).hide();
    }) ;
});