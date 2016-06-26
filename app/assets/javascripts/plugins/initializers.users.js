// Initialize Users

(function($) {

  function condition(){
    return $('.selector-roles').length > 0;
  }

  function updateUserRoles(){
    var $selector = $(this),
      $holder = $selector.closest('.invite-user-block'),
      $holderCollaboratorBlock = $holder.find('.collaborator-block'),
      $holderUserRoles   = $holder.find('.selector-roles'),
      $collaboratorRole = $holderUserRoles.data('collaborator'),
      $councilorRole    = $holderUserRoles.data('councilor'),
      $inputCouncilorName = $holder.find('.input-councilor-name');

    if ($collaboratorRole == $holderUserRoles.val()) {
      $holderCollaboratorBlock.removeClass('hidden');
      $inputCouncilorName.prop("disabled", false);
    }
    else if ($councilorRole == $holderUserRoles.val()) {
      $holderCollaboratorBlock.addClass('hidden');
      $inputCouncilorName.prop("disabled", true);
    }
  }

  function initialize(){
    $('form').on('change', '.selector-roles', updateUserRoles);

  }

  Initializers.register('users', initialize, condition);


}(jQuery));
