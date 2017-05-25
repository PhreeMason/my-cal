class TasksController < ApplicationController

  def new
    if !Month.exists?(params[:month_id])
      redirect_to '/', alert: "Month not found."
    else
      @month = Month.find_by(id: params[:month_id])
      if params[:day]
        @task = Task.new(month_id: params[:month_id], start_time: @month.to_time(params[:day]))
      else
        @task = Task.new(month_id: params[:month_id], start_time: @month.to_time(1))
      end
    end
  end

  def edit
    @month = Month.find_by(id: params[:month_id])
    if @month.nil?
      redirect_to '/', alert: "Month not found."
    else
      @task = @month.tasks.find_by(id: params[:id])
      redirect_to '/', alert: "Task not found." if @task.nil?
    end
  end

  def create
    @task = Task.new(task_params)
    @month = @task.month
    my_cal.months << @month unless my_cal.months.include?(@month)
    my_cal.save
    if @task.save
      current_user.tasks << @task
      redirect_to @task.month
    else
      render :new
    end
  end

  private
    def task_params
      a = params.require(:task).permit(:content).to_hash
      b = {date: params.require(:date).permit([:year, :month, :day, :hour, :minute]).to_hash}
      return a.merge(b)
    end
end
