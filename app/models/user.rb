class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :lockable,
    :timeoutable, :confirmable, :omniauthable, omniauth_providers: [ :google_oauth2 ]

  belongs_to :collaborator, class_name: 'Participation', foreign_key: 'collaborator_id'

  enum status: %i(pending_invitation enabled disabled)
  enum role: %i(admin councilor collaborator guest)

  validates :email, :role, :name, :last_name, presence: true
  validates :email, uniqueness: true

  scope :all_without_current, -> (current_user) { where.not(id: current_user ) }

  validates_with PasswordValidator, on: :update #, unless: Proc.new { current_user.admin? }

  def full_name
    "#{last_name}, #{name}"
  end

  def active_for_authentication?
    super && enabled?
  end

  def password_required?
    super if confirmed?
  end

  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end

  def enable
    update_attribute(:status, 'enabled')
  end

  def disable
    update_attribute(:status, 'disabled')
  end

  def has_participation?
    Participation.find_by(councilor: self)
  end

  private

  def set_password
    self.password = Devise.friendly_token.first(8) unless self.encrypted_password.present?
  end

end


