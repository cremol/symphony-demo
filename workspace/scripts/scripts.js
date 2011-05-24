	// JavaScript Document
	
$.fn.cycle.defaults.timeout = 6000;
$(function() {
    // run the code in the markup!
    $('.slideshow').cycle({
    fx:     'fade',
    speed:  'fast',
    timeout: 0,
    next:   '#next',
    prev:   '#prev'
});
});

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

$(document).ready(function(){
				$("#content").slideDown(500);
				$(".slideshowcontainer").animate({opacity: '1'}, 1500);
});