class ReservationDateValidator < ActiveModel::Validator
  def valide(record)
    if record.end_time < record.start_time
      record.errors.add(:end_time, 'cannot be early to start time')
    end
  end
ende
