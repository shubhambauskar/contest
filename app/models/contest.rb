class Contest < ActiveRecord::Base
    validates :title, presence: true, length: {minimum: 3, maximum: 50}
    validates :description, presence: true, length:{ minimum: 10, maximum: 300}
    validates :categories, presence: true, length:{ minimum: 1, maximum: 300}
    validates :locations, presence: true, length:{ minimum: 1, maximum: 300}
    validate :end_date_greater_than_start_date

    def end_date_greater_than_start_date
      if !end_date.blank? and end_date.to_date < start_date.to_date
        errors.add(:end_date, "should be greater than start date")
      end
    end
end       