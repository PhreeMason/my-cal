class Calendar < ApplicationRecord
  belongs_to :user
  has_many :months
  has_many :tasks, through: :months
  
  before_save :give_me_months
  def give_me_months
    12.times { self.months.create }
  end
end
