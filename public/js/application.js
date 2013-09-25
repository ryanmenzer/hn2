$(document).ready(function() {

    $('form#vote').on('submit', function(event) {
      event.preventDefault();
      var url = $(this).attr('action');
      var data = $(this).serialize();
      var that = this
      // console.log(this);
      $.post(url, data, function(response) {
        $(that).parent().replaceWith(response);
        console.log(response);
      });
    });

});
