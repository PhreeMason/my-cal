module MonthsHelper

  def my_cal
    current_user.calendar
  end



  def month_header(month)
    "#{month.name} #{month.year}"
  end

  def all_days(month)
    days = month.first_week_days
    days << month.middle_week_days
    days << month.last_week_days
    days.flatten
  end

end
