class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :people_num, presence: true
end
