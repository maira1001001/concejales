class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :lockable,
    :timeoutable, :confirmable, :omniauthable, omniauth_providers: [ :google_oauth2 ]

  belongs_to :person, dependent: :destroy

  accepts_nested_attributes_for :person

  enum status: %i(pending_invitation enabled disabled)
  enum roles: %i(admin manager simple guest)

  after_initialize :set_person

  validates :email, :roles, presence: true
  validates :email, uniqueness: true
  validates_associated :person, on: :create

  scope :all_without_current, -> (current_user) { where.not(id: current_user ) }

  validates_with PasswordValidator, on: :update #, unless: Proc.new { current_user.admin? }

  def full_name
    person
  end

  def active_for_authentication?
    super && enabled?
  end

  def password_required?
    super if confirmed?
  end

  # Omniauth facebook provider
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      User.find_by(email: auth.info.email)
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  # Omniauth google provider
  def self.from_omniauth(access_token)
    data = access_token.info
    User.find_by(email: data["email"])
  end

  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end

  def personal_data_completed?
    person.principal_data_completed?
  end

  def enable
    update_attribute(:status, 'enabled')
  end

  def disable
    update_attribute(:status, 'disabled')
  end

  private

  def set_person
    self.person ||= self.build_person
  end

  def set_password
    self.password = Devise.friendly_token.first(8) unless self.encrypted_password.present?
  end

end


