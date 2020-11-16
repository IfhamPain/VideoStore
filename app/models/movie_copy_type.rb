class MovieCopyType < ApplicationRecord
  has_many :movies, through: :movie_copies
  has_many :movie_copies
  accepts_nested_attributes_for :movie_copies
  accepts_nested_attributes_for :movies

  validates :copy_type, presence: true,length: {maximum:20}

end
