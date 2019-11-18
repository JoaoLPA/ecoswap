class Material < ApplicationRecord
  belongs_to :user

  validates :description, inclusion: { in: %w[cardboard newspaper glass aluminium plastic] }
  validates :amount, presence: true
end
