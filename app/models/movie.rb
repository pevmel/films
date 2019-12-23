class Movie < ApplicationRecord
  belongs_to :category
  has_many :ratings, dependent: :destroy

  validates :title, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  paginates_per 15
end
