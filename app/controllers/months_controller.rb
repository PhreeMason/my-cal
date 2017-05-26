class MonthsController < ApplicationController

  def show
    @month = my_cal.month.find_by(id: params[:id])
  end

  def home
    redirect_to my_cal.find_month_by_time(Time.now)
  end

  def jump

  end
end
