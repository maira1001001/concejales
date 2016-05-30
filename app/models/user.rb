class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable,
  # :rememberable, :registerable
  devise :database_authenticatable, :lockable, :timeoutable,
    :recoverable, :trackable, :validatable

  attr_accessor :password_confirmation

  validates :username, uniqueness: true, presence: true, on: :create
  validates :roles, :password, presence: true

  validates_confirmation_of :password

  def roles=(value)
    super(value) if User::Roles.valid?(value)
  end

  def ability
    @ability ||= Ability.new(self)
  end

  def to_s
    username
  end

  def is_admin?
    self.roles.eql? "admin"
  end
end

class User::Roles
  def self.all
    %w(admin  councilor colaborator)
  end

  def self.valid?(role)
    all.include? role
  end
end
