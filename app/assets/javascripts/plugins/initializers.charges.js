// Initialize charge module
(function($) {

  function condition() {
    return $("form.charge-form").length > 0;
  }

  function changeEndDateInput(){
    var $targetSelector = $(this),
      $holder = $targetSelector.closest('.row'),
      $checkInFunction = $holder.find('input.check-end-date'),
      $inputEndDate = $holder.find('input.input-end-date') ;
    if($checkInFunction.is(':checked')){
      $inputEndDate.prop('disabled', true);
      $inputEndDate.prop('value', '');

    }else{
      $inputEndDate.prop('disabled', false);
      $inputEndDate.prop('value', '');
    }
  }

  function initialize() {
    $('form').on('click', 'input.check-end-date', changeEndDateInput);
  }

  Initializers.register('charges', initialize, condition);

}(jQuery));
