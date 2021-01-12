class Review < ApplicationRecord
  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, inclusion: { in: (0..5).to_a, allow_nil: false }
  validates :rating, numericality: true

  belongs_to :restaurant
end
