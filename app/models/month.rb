class Month < ApplicationRecord
  belongs_to :calendar
  has_many :tasks

  def first_week_days
    week_days = []
    day_of_week  = DateTime.new(year, order).wday
    n = 7 - day_of_week
    (1..m).each { |e| week_days << e }
    week_days
  end

  def last_few_days
    week_days = []
    day_of_week = DateTime.new(year, order).end_of_month.wday
    n = days - day_of_week
    (n..days).each { |e| week_days << e }
    week_days
  end
end
