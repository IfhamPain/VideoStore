class MovieCopyOrder < ApplicationRecord
  belongs_to :movie_copy
  belongs_to :order
end
