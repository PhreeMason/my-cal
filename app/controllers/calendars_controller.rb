class CalendarsController < ApplicationController
  def show
    @calendar = current_user.calendar
  end

end
# start_date = (Date.now - 1.month).strftime("%Y-%m-%d")
