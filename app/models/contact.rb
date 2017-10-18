class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :position, presence: true

  belongs_to :company



  def normalize_case(user_input)
    user_input.downcase.capitalize
  end

end
