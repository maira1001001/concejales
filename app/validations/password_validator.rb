class PasswordValidator < ActiveModel::Validator

  def validate(record)
    return record.errors.add(:password, :blank) if record.password.blank?
    return record.errors.add(:password_confirmation, :confirmation) unless record.password == record.password_confirmation
  end
end
