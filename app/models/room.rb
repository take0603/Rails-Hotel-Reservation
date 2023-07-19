class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations

  def self.ransackable_attributes(auth_object = nil)
    ["name", "address", "explanation"]
  end
  def self.ransackable_associations(auth_object = nil)
    []
  end
end
