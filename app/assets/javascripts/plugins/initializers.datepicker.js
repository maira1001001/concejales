(function($) {
  Initializers.register('datepicker', function() {
    $('input.date_picker').datetimepicker({ format: 'DD/MM/YYYY'  });
  });

}(jQuery));
