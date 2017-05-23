class Month < ApplicationRecord
  belongs_to :calendar
  has_many :tasks

  def first_week_days
    week_days = []
    day_of_week  = DateTime.new(year, order).wday
    n = 7 - day_of_week
    (1..n).each { |e| week_days << e }
    week_days
  end

  def middle_week_days
    week_days = []
    start = first_week_days.last + 1
    finish = last_week_days.first - 1
    all_days = (start..finish).map { |e| e }
    until all_days.empty?
      week_days << all_days.slice!(0..6)
    end
    week_days
  end

  def last_week_days
    week_days = []
    day_of_week = DateTime.new(year, order).end_of_month.wday
    n = days - day_of_week
    (n..days).each { |e| week_days << e }
    week_days
  end
end
