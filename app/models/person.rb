class Person < ActiveRecord::Base
  has_one :user
  has_one :participation, autosave: true

  attr_accessor :district

  def to_s
    "#{last_name}, #{name}"
  end

  def save
    participation.create(status: :pending_approval)
  end

end
