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
  end

end
