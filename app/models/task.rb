class Task < ApplicationRecord
  has_one :mytask
  belongs_to :month
  accepts_nested_attributes_for :month

  def date=(date)
    t = date.values.map(&:to_i)
    time = Time.new(t[0],t[1],t[2],t[3],t[4])
    self.day = time
    self.start_time = time
  end

end
