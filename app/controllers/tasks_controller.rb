class TasksController < ApplicationController
  def new
    if !Month.exists?(params[:month_id])
      redirect_to months_path, alert: "Month not found."
    else
      @month = Month.find_by(id: params[:month_id])
      if params[:day]
        @task = Task.new(month_id: params[:month_id], day: @month.to_time(params[:day]))
      end
        @task = Task.new(month_id: params[:month_id], day: @month.to_time(1))
    end
  end

  def edit
    @month = Month.find_by(id: params[:month_id])
    if @month.nil?
      redirect_to months_path, alert: "Month not found."
    else
      @task = @month.tasks.find_by(id: params[:id])
      redirect_to months_path(month), alert: "Task not found." if @task.nil?
    end
  end

  def create
    binding.pry
    @task = Task.new(task_params)
    my_cal.months << @task.month unless my_cal.months.include?(@task.month)
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
