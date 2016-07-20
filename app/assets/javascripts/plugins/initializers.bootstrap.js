// Bootstrap JS initializer
(function($) {
  Initializers.register	 ('bootstrap', function() {
    $('[data-toggle="tooltip"]').tooltip();
    $('[data-toggle="dropdown"]').dropdown();
    $('[data-toggle="popover"]').popover();
  });
}(jQuery));
