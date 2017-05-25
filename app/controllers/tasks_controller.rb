class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def edit
  end

  def show
  end

  def create
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
