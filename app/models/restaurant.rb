class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  # validations:
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: %w[chinese italian japanese french belgian] }

  # after_find :average_rating
  def average_rating
    self.average_rating = (reviews.sum(&:rating).to_f / reviews.count)
  end
end
