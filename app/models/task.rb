class Task < ApplicationRecord
  has_one :mytask
  belongs_to :month
  accepts_nested_attributes_for :month
  def date=(date)
    binding.pry
    # {
    #   "task"=>{"content"=>"test test"},
    #   "date"=>{"year"=>"2017",
    #     "month"=>"5",
    #     "day"=>"24",
    #     "hour"=>"20",
    #     "minute"=>"15"}
    #   }
    t = date.values.map(&:to_i)
    time = Time.new(t[0],t[1],t[2],t[3],t[4])
  end

end
