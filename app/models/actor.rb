class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  validates :name, presence: true, length: {maximum: 50}
  validates :date_of_birth, presence: true
end
