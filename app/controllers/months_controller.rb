class MonthsController < ApplicationController

  def show
    @month = Month.find_by(id: params[:id])
    if my_cal.months.include?(@month)
      @month
    else
      redirect_to '/', alert: "Month not found."
    end
  end

  def home
    redirect_to my_cal.find_month_by_time(Time.now)
  end

  def jump

  end
end
