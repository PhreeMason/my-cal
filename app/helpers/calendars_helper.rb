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

end
