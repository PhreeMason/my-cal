class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def edit
  end

  def show
  end

  def create
    binding.pry
    @task = Task.new(task_params)
    my_cal.months << @task.month unless my_cal.month.include?(@task.month)
    m_cal.save
    binding.pry
    if @task.save
      binding.pry
      current_user.tasks < @task
      redirect_to @task.month
    else
      binding.pry
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
