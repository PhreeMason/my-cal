module MonthsHelper

  def my_cal
    current_user.calendar
  end

  def prev_month_days(month)
    now = DateTime.new(month.year, month.order) - 1.month
    month = my_cal.find_month_by_time(now)
    month.last_week_days
  end

  def next_month_days(month)
    now = DateTime.new(month.year, month.order) + 1.month
    month = my_cal.find_month_by_time(now)
    month.first_week_days
  end

  def month_header(month)
    "#{month.name} #{month.year}"
  end

end
