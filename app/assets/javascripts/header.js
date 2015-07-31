
// Smal MQ drop down menu
$(document).ready(function($){
	$('div.nav-user-group').on('click', function(event){
		if($(event.target).is('div.nav-user-group img')) $('.main-nav').children('ul').toggleClass('is-visible');
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