function toggleMatches() {
  $("#app-matches").load("/matches", function() {
    $("body").toggleClass("open-matches");
  });
}

$(function() {
  $(".swipe-content img").swipe( {
    //Generic swipe handler for all directions
    swipe: function(event, direction, distance, duration, fingerCount, fingerData) {
      if (direction === 'left') {
        $('.btn-not').click();
      } else if (direction === 'right') {
        $('.btn-yes').click();
      }
    }
  });
});

function toggleSynopsis(isbn) {
  $("#app-matches").load("http://books.google.be/books?vid=ISBN"+isbn).select('#synopsistext');
}
