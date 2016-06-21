// Initialize Users

(function($) {

  function condition(){
    return $('.selector-roles').length > 0;
  }

  function updateUserType(){
    var $selector = $(this),
      $holder = $selector.closest('.invite-user-block'),
      $holderCollaboratorBlock = $holder.find('.collaborator-block'),
      $holderUserType   = $holder.find('.selector-roles'),
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
    $('form').on('change', '.selector-roles', updateUserType);

  }

  Initializers.register('users', initialize, condition);


}(jQuery));
