class MonthsController < ApplicationController

  def show
    @month = my_cal.months.find_by(id: params[:id])
    redirect_to '/', alert: "Month not found."  if @month.nil?
  end

  def home
    redirect_to my_cal.find_month_by_time(Time.now)
  end

end
