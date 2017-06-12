class Month < ApplicationRecord
  belongs_to :calendar
  has_many :tasks
  
  def prev_month
    now = DateTime.new(year, order) - 1.month
    month = calendar.find_month_by_time(now)
  end
  
  def next_month 
    now = DateTime.new(year, order) + 1.month
    month = calendar.find_month_by_time(now)
  end
  
  def prev_month_last_days
    prev_month.last_week_days.length == 7 ? [] : prev_month.last_week_days 
  end
  
  def next_month_first_days
    next_month.first_week_days.length == 7 ? [] : next_month.first_week_days
  end

  def first_week_days
    week_days = []
    day_of_week  = DateTime.new(year, order).wday
    n = 7 - day_of_week
    (1..n).each { |e| week_days << e }
    week_days
  end

  def middle_week_days
    start = first_week_days.last + 1
    finish = last_week_days.first - 1
    all_days = (start..finish).map { |e| e }
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

  def tasks_today(day)
    array = tasks.select { |e| e.start_time.day == day.to_i }
  end
  
  def all_days
    week_days = first_week_days
    week_days << middle_week_days
    week_days << last_week_days
    week_days.flatten
  end
end
