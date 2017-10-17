class Category < ApplicationRecord
  validates :description, presence: true, uniqueness: true
  has_many :jobs
end
