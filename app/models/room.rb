class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  mount_uploader :room_image, RoomImageUploader

  def self.ransackable_attributes(auth_object = nil)
    ["name", "address", "explanation"]
  end
  def self.ransackable_associations(auth_object = nil)
    []
  end

  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :address, presence: true
end
