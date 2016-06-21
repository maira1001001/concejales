class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable,
  # :rememberable, :registerable
  devise :database_authenticatable, :lockable, :timeoutable,
    :recoverable, :trackable, :validatable, :confirmable, :registerable

  enum roles: { councilor: 0, collaborator: 1 }

  attr_accessor :password_confirmation

  belongs_to :person

  validates :email, uniqueness: true, presence: true, on: :create



  def password_required?
    super if confirmed?
  end

  def password_match?
    errors.add(:password, :blank) if password.blank?
    errors.add(:password_confirmation, :blank) if password_confirmation.blank?
    errors.add(:password_confirmation, :confirmation) if password != password_confirmation
    password == password_confirmation && !password.blank?
  end
end

