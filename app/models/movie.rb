class Movie < ApplicationRecord
  belongs_to :category

  validates :title, presence: true

  paginates_per 15
end
