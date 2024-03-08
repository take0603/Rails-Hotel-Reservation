class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :checkin_date, presence: true
  validates :checkout_date, presence: true
  validates :people_num, presence: true
  validate :checkout_date_not_backdate
end

def checkout_date_not_backdate
  if self.checkout_date.nil? || self.checkout_date <= self.checkin_date
    errors.add(:checkout_date,"はチェックイン日より後の日付を選択してください。") 
  end
end