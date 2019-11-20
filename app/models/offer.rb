class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :material

  validates :amount, presence: true

  mount_uploader :photo, PhotoUploader

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

end
