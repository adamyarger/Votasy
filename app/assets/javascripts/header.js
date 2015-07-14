$(document).ready(function($){
	/********************************
		open/close submenu on mobile
	********************************/
	$('.main-nav').on('click', function(event){
		if($(event.target).is('.main-nav')) $(this).children('ul').toggleClass('is-visible');
	});
});