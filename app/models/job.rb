class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def self.top_3_by_interest
    order("level_of_interest DESC").limit(3)
  end

  def self.grouped_by_interest
    order("level_of_interest DESC")
  end


end
