$(document).ready(function($){
	$('div.nav-bell').on('click', function(event){
		if($(event.target).is('.nav-bell')) $('.main-nav').children('ul').toggleClass('is-visible');
	});
});