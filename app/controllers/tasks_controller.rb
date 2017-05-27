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
    binding.pry
    @task =  my_cal.tasks.build((task_params))
    binding.pry
    @month = my_cal.find_month_by_time(@task.start_time)
    binding.pry
    if @task.save
      my_cal.save
      redirect_to @task.month
    else
      render :new
    end
  end

  def show
    if !Month.exists?(params[:month_id])
      redirect_to '/', alert: "Month not found."
    else
      binding.pry
      @month = Month.find_by(id: params[:month_id])
      @task =  @month.tasks.find_by(id: params[:id])
      redirect_to '/', alert: "Task not found." if @task.nil?
    end
  end

  def update
    @task = Task.find(params[:id])
    @month = Month.find_by(id: params[:month_id])
    if @task.update(task_params)
     redirect_to @month
    else
     render :edit
    end
  end

  private
    def task_params
      a = params.require(:task).permit(:content).to_hash
      b = {date: params.require(:date).permit([:year, :month, :day, :hour, :minute]).to_hash}
      return a.merge(b)
    end
end
