module CalendarsHelper

  def current_month
    now = Date.today
    current_user.calendar.months.find_by(name: now.strftime("%B"), year: now.strftime("%Y"))
  end
  
  def calendar_header
    "#{current_month.name} #{current_month.year}"
  end
end
