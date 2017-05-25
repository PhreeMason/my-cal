class CalendarsController < ApplicationController
  def show
    @calendar = my_cal
  end

end
# start_date = (Date.now - 1.month).strftime("%Y-%m-%d")
