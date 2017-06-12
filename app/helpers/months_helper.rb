module MonthsHelper

  def my_cal
    current_user.calendar
  end

  def month_header(month)
    "#{month.name} #{month.year}"
  end

end
