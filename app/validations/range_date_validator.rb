class RangeDateValidator < ActiveModel::Validator

  def validate(record)
    return if record.start_date.blank?
    valid_range(record)
  end

  def valid_range(record)
#    start_date = Date.parse(record.start_date)
#    end_date = record.end_date.blank? ? nil : Date.parse(record.end_date)
    start_date = record.start_date
    end_date = record.end_date
    return record.errors.add(:start_date, :start_date_before_today) if start_date > Date.today
    return record.errors.add(:end_date, :end_date_before_start_date) if end_date.present? && start_date > end_date
  end

end
