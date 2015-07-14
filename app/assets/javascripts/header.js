
// Smal MQ drop down menu
$(document).ready(function($){
	$('div.nav-bell').on('click', function(event){
		if($(event.target).is('.nav-bell')) $('.main-nav').children('ul').toggleClass('is-visible');
	});
});

//flash message fade out
$(document).ready(function(){
  $(function() {
   $('#flash').delay(500).slideDown('normal', function() {
      $(this).delay(2500).slideUp();
   });
  });
});