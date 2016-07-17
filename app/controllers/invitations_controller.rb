class InvitationsController< ApplicationController

  respond_to :html

  def new_collaborator
    @collaborator = User.new
  end


  private

  def collaborator_params
    params.require(:user).permit(:email, person_attributtes: [ :name, :last_name ])
  end

end
