function toggleMatches() {
  $("#app-matches").load("/matches", function() {
    $("body").toggleClass("open-matches");
  });
}
