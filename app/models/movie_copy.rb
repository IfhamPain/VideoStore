class MovieCopy < ApplicationRecord
  belongs_to :movie
  belongs_to :movie_copy_type, optional: true
  accepts_nested_attributes_for :movie_copy_type

  validates :barcode, presence: true,length: {maximum:50}
  validates :movie_id, presence: true
  validates :copy_price, presence: true,numericality: { greater_than_or_equal_to: 0}
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0,  only_integer: true }

end
