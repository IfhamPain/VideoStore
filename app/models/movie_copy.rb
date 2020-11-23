class MovieCopy < ApplicationRecord
  belongs_to :movie
  belongs_to :movie_copy_type, optional: true
  has_many :movie_copy_orders, inverse_of: :movie_copy
  has_many :orders, through: :movie_copy_orders
  accepts_nested_attributes_for :movie_copy_type
  accepts_nested_attributes_for :orders

  validates :barcode, presence: true,length: {maximum:50}
  validates :movie_id, uniqueness: { scope: :movie_copy_type_id }
  validates :movie_copy_type_id, presence: true
  validates :copy_price, presence: true,numericality: { greater_than_or_equal_to: 0}
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0,  only_integer: true }

end
