class MonthsController < ApplicationController
  include MonthsHelper

  def show
    @month = Month.find_by(id: params[:id])
  end

  def home
    redirect_to my_cal.find_month_by_time(Time.now)
  end
end
