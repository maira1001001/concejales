class Person < ActiveRecord::Base
  has_one :user
  has_one :participation, autosave: true

  def to_s
    "#{last_name}, #{name}"
  end

end
