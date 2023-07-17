class Reservation < ApplicationRecord
  validates :people_num, presence: true
end
