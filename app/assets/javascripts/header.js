$(document).ready(function($){
	/********************************
		open/close submenu on mobile
	********************************/
	$('.nav-bell').on('click', function(event){
		if($(event.target).is('.nav-bell')) $(this).children('ul').toggleClass('is-visible');
	});
});