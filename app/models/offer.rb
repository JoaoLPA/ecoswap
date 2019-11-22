class Offer < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  belongs_to :material

  validates :amount, presence: true

  mount_uploader :photo, PhotoUploader

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  pg_search_scope :offers_search,
    against: [ :description, :location ],
    associated_against: {
      material: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }

end
