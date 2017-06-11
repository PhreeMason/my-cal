class MonthsController < ApplicationController

  def show
    @month = my_cal.months.find_by(id: params[:id])
    redirect_to '/', alert: "Month not found."  if @month.nil?
    @task = Task.new(month_id: @month.id)
    respond_to do |format|
      format.html { render :show}
      format.json { render json: @month}
    end
  end

  def home
    redirect_to my_cal.find_month_by_time(Time.now)
  end

end
