class Genre < ApplicationRecord
  has_many :movie_genres
  has_many :movies, through: :movie_genres

  enum genre_type: [:action, :horror, :comedy, :romance, :scifi]
end
