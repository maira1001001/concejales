// Initialize Users

(function($) {

  function condition(){
    return $('.selector-user-type').length > 0;
  }

  function updateUserType(){
    var $selector = $(this),
      $holder = $selector.closest('.invite-user-block'),
      $holderCollaboratorBlock = $holder.find('.collaborator-block'),
      $holderUserType   = $holder.find('.selector-user-type'),
      $collaboratorType = $holderUserType.data('collaborator'),
      $councilorType    = $holderUserType.data('councilor'),
      $inputCouncilorName = $holder.find('.input-councilor-name');

    if ($collaboratorType == $holderUserType.val()) {
      $holderCollaboratorBlock.removeClass('hidden');
      $inputCouncilorName.prop("disabled", false);
    }
    else if ($councilorType == $holderUserType.val()) {
      $holderCollaboratorBlock.addClass('hidden');
      $inputCouncilorName.prop("disabled", true);
    }
  }

  function initialize(){
    $('form').on('change', '.selector-user-type', updateUserType);

  }

  Initializers.register('users', initialize, condition);


}(jQuery));
