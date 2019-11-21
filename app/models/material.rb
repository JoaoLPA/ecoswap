class Material < ApplicationRecord
  include PgSearch::Model
  has_many :offers
end
