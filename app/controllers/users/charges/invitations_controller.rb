class Charges::ConfirmationsController < Devise::ConfirmationsController

  respond_to :html

  def invite_collaborator
    @user = User.new(invite_collaborator_params)
    councilor_participation = current_user.person.current_participation
    charge = Charge.find_by(councilor: councilor_participation)
    if @user.send_confirmation_instructions
      charge.add_collaborator(@user)
      redirect_to charge_path, notice: 'Usted ha enviado una invitación al asesor'
    else
      redirect_to charge_path, notice: 'Algo ha salido mal. No se ha podido invitar al asesor al sistema. Reintente la operación'
    end
  end

  private

  def invite_collaborator_params
    params.require(:user).permit(:email, person_attributes: [ :name, :last_name])
  end

end
