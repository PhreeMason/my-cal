class Month < ApplicationRecord
  belongs_to :calendar
  has_many :tasks

  def first_week_day
    DateTime.new(year, order).wday
  end

  def last_few_days
    week_days = []
    week_day = DateTime.new(year, order).end_of_month.wday
    n = days - week_day 
    (n..days).each { |e| week_days << e }
    week_days
  end
end
