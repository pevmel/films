class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :mark, inclusion: 0..10
end
