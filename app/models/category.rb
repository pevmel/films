class Category < ApplicationRecord
  has_many :movies, dependent: :delete_all

  validates :name, presence: true, uniqueness: true

  extend FriendlyId
  friendly_id :name, use: :slugged
end
