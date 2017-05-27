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
    all_days.each_slice(7) {|e| week_days << e }
    week_days
  end


  def last_week_days
    week_days = []
    day_of_week = DateTime.new(year, order).end_of_month.wday
    n = days - day_of_week
    (n..days).each { |e| week_days << e }
    week_days
  end

  def self.create_from_time(time)
    self.create(order: time.month, name: time.strftime("%B"), days: time.end_of_month.day, year: time.strftime("%Y"))
  end

  def to_time(day=1)
    Time.new(year, order, day)
  end

end
