class Users::ConfirmationsController < Devise::ConfirmationsController

  respond_to :html

  def invite_collaborator
    @user = User.new(user_collaborator_params.merge!(roles: 'simple'))
    councilor_participation = current_user.person.current_participation
    charge = councilor_participation.charge
    if @user.send_confirmation_instructions
      collaborator_participation = Participation.new(role: 'collaborator', person: @user.person, charge: charge)
      charge.collaborators << collaborator_participation
      @user.person.update_attribute(:current_district, current_user.person.current_district)
      @user.save
      redirect_to charge_path, notice: 'Usted ha enviado una invitación al asesor'
    else
      redirect_to charge_path, notice: 'Algo ha salido mal. No se ha podido invitar al asesor al sistema. Reintente la operación'
    end
  end

  def resend_invitation
    @user = User.find_by(id: params[:id])
    if @user.present?
      @user.update_attribute(:confirmation_token, params[:authenticity_token])
      @user.send_confirmation_instructions
      notice = t('devise.confirmation.resend_invitation.notice', email: @user.email)
    else
      notice = t('devise.confimation.resend_invitation.email_not_found')
    end
    redirect_to users_path, notice: notice
  end

  def show
    @original_token = params[:confirmation_token]
    sign_out(@user) if current_user
    @user = find_user_by_token(@original_token)
    if @user.nil?
      redirect_to new_user_confirmation_path, notice: 'Link inválido. Solicite nuevamente invitación al sistema.' ##TODO hacer nueva vista para esto
    elsif @user.confirmed?
      sign_out(@user)
      redirect_to new_user_session_path, notice: 'Su cuenta ya fue confirmada.'
    else
      unless @original_token == @user.confirmation_token
        redirect_to new_user_confirmation, notice: 'Link inválido. Solicite nuevamente invitación al sistema.token inválido.'
      end
    end
  end

  def confirm
    @original_token = user_confirmation_params[:confirmation_token]
    digested_token = Devise.token_generator.digest(self, :confirmation_token, @original_token)
    @user = find_user_by_token(@original_token)
    if @user.nil?
      redirect_to new_user_session_path, notice: 'Inicie sesión para continuar.'
    else
      if @user.confirmed?
        redirect_to new_user_session_path, notice: 'Su cuenta ya ha sido confirmada.'
      else
        if @user.update(user_confirmation_params)
          @user.confirm!
          @user.update(status: 'enabled')
          redirect_to new_user_session_path, notice: 'Su cuenta fue activada.'
        else
          respond_with @user,
            location: -> { user_confirmation_path(confirmation_token: @original_token) },
            action: :show
        end
      end
    end

  end

  private


  def user_confirmation_params
    params.require(:user).permit(:confirmation_token, :password, :password_confirmation)
  end

  def user_email_params
    params.require(:user).permit(:email)
  end

  def find_user_by_token(token)
    User.find_by(confirmation_token: token)
  end

  def user_collaborator_params
    params.require(:user).permit(:email, person_attributes: [ :name, :last_name])
  end

end

