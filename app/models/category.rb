class Category < ApplicationRecord
  validates :description, presence: true, uniqueness: true
  belongs_to :job
end
