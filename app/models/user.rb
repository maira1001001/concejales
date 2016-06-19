class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable,
  # :rememberable, :registerable
  devise :database_authenticatable, :lockable, :timeoutable,
    :recoverable, :trackable, :validatable, :confirmable

  attr_accessor :password_confirmation

  belongs_to :person

#  validates :username, :email, uniqueness: true, presence: true, on: :create

  validates_confirmation_of :password

end
