class Users::ConfirmationsController < Devise::ConfirmationsController

  respond_to :html

  def create
    @user = User.find_by(user_email_params)
    if @user.nil?
      notice = 'Si ingresó un email que se encontraba en el sistema, entonces recibirá en su casilla de email las instrucciones para confirmar su cuenta'
    end
    redirect_to new_user_session_path, notice: notice
  end

  def show
    @original_token = params[:confirmation_token]
    @user = find_user_by_token(@original_token)
    if @user.nil?
      redirect_to new_user_confirmation_path, notice: 'Link inválido. Solicite nuevamente invitación al sistema.'
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
          @user.update(status: :enable)
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

end

