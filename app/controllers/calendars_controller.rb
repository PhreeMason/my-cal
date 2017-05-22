class CalendarsController < ApplicationController
  def show
    @calendar = current_user.calendar
  end
end
