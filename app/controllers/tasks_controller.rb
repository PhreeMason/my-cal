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
    binding.pry
  end

  private

    def task_params
      params.require(:task).permit(:content)
      params.require(:date).permit([:year, :month, :day, :hour, :minute])
    end
end
