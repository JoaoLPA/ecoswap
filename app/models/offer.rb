class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :material

  validates :amount, presence: true

  mount_uploader :photo, PhotoUploader

end
