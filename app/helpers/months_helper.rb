module MonthsHelper

  def my_cal
    current_user.calendar
  end

  def month_header(month)
    "#{month.name} #{month.year}"
  end

  def month_jump
      form_tag(jump_path) do
        select_month Time.now
        select_year Time.now
      submit_tag("Jump to Month")
    end
  end

end
