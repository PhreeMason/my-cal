class Task < ApplicationRecord
  has_one :mytask
  belongs_to :month

  def date=(date)

  end

end
