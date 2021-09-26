$(document).on('turbolinks:load', function(){
  $(document).trigger('refresh_autonumeric');
  $('#deposit').on('keyup', function () { 
    $("#deposit").autoNumeric('init');
    var total = $("#total").autoNumeric('get');
    var deposit = $('#deposit').autoNumeric('get');
    reminder = total - deposit;
    $("#remainder").val(reminder);
  })
});