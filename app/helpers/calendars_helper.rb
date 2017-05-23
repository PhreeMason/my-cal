module CalendarsHelper

  def current_month
    now = Date.today
    my_cal.months.find_by(order: now.month, year: now.strftime("%Y"))
  end
  
  def calendar_header
    "#{current_month.name} #{current_month.year}"
  end

  def my_cal
    current_user.calendar
  end

  def prev_month_days
    now = DateTime.now - 1.month
    month = my_cal.months.find_by(order: now.month, year: now.strftime("%Y"))
    if month
      month.last_week_days
    else
      my_cal.add_month(now).last_week_days
    end
  end

  def next_month_days
    now = DateTime.now + 1.month
    month = my_cal.months.find_by(order: now.month, year: now.strftime("%Y"))
    if month
      month.first_week_days
    else
      my_cal.add_month(now).first_week_days
    end  
  end
  
end
