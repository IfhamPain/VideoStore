class Order < ApplicationRecord
  has_many :movie_copy_orders
  has_many :movie_copies, through: :movie_copy_orders
  accepts_nested_attributes_for :movie_copy_orders, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :movie_copies, allow_destroy: true, reject_if: :all_blank

  validates_presence_of :user_id, :if => lambda {self.superuser_id == nil}
  validates_presence_of :superuser_id, :if => lambda {self.user_id == nil}, optional:true
  validates_presence_of :order_date
  validate :date_validation
  validates :movie_copies, :presence => true

  def date_validation
    if !(return_date.nil? || expiration_date.nil?)
      errors.add(:order_date, "must be before expiry date") unless order_date < expiration_date
      errors.add(:order_date, "must be before expiry date") unless order_date < return_date
    end
  end
end
