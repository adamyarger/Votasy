$(document).ready(function(){
	$('.hover-tile-outer').on('mouseenter', function(event){
		event.stopPropagation();
		event.preventDefault();
		$(this).closest('.posts-container').find('.hover-tile-hidden').toggleClass('is-visible');
	});

	$('.hover-tile-outer').on('mouseleave', function(event){
		event.stopPropagation();
		event.preventDefault();
		$(this).closest('.posts-container').find('.hover-tile-hidden').toggleClass('is-visible');
	});
});