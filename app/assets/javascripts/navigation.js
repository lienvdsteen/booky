function toggleMatches() {
  $("body").toggleClass("open-matches");
  $("#app-matches .matches-content").load("/matches");
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

  //$("#app-matches .matches-content").load("/matches");
});

function openSynopsis(isbn) {
  $.get("https://www.googleapis.com/books/v1/volumes?q=isbn"+isbn,
    function(data) {
      var book = data.items[0].volumeInfo;
      $('#app-synopsis .synopsis-content').html(book.description);
      $("body").addClass("open-synopsis");
    }
  );
}

function closeSynopsis(isbn) {
  $("body").removeClass("open-synopsis");
}
