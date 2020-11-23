class User < ApplicationRecord
  require 'csv'

  paginates_per 5

  has_many :orders, dependent: :destroy
  has_many :movie_copies
  accepts_nested_attributes_for :orders


  include Filterable #filtering
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: [:male, :female, :other]
  enum role: [:member, :admin]

  #Scopes for User filter
  scope :filter_by_fname, ->(fname_search) {where("lower(first_name) LIKE ?", fname_search.downcase)}
  scope :filter_by_lname, ->(lname_search) {where("lower(last_name) LIKE ?", lname_search.downcase)}
  scope :filter_by_email, ->(email_search) {where("lower(email) LIKE ?", email_search.downcase)}
  scope :filter_by_role, ->(role_search) {where("role = ?", role_search)}
  scope :filter_by_gender, ->(gender_search) {where("gender = ?", gender_search.to_i)}

  #User fields validation
  validates :first_name, presence: true, length: {maximum: 50}
  validates :last_name, presence: true, length: {maximum: 50}
  validates :address, presence: true, length: {maximum: 300}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX}, uniqueness: true

  #Combine first_name and last_name
  def fullname
    "#{first_name} #{last_name}"
  end

  # Save as csv
  def self.to_csv(options = {})
    desired_columns = ["Id", "First Name", "LastName", "Address", "Gender", "Role"]
    CSV.generate(options) do |csv|
      csv << desired_columns
      all.each do |user|
        csv << [user.id, user.first_name, user.last_name, user.address, user.gender, user.role]
      end
    end
  end

end
