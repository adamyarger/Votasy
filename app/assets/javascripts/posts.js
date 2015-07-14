$(function() {
  return $('#masonry-container').imagesLoaded(function() {
    return $('#masonry-container').masonry({
      itemSelector: '.posts-container',
      isFitWidth: true
    });
  });
});