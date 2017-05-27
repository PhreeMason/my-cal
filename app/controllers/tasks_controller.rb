class TasksController < ApplicationController

  def new
    if !Month.exists?(params[:month_id])
      redirect_to '/', alert: "Month not found."
    else
      @month = Month.find_by(id: params[:month_id])
      @task = Task.new(month_id: params[:month_id], start_time: @month.to_time(params[:day]))
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
    if @task.save
      my_cal.save
      @month = @task.month
      redirect_to @month
    else
      @month =  Month.find_by(id: params[:month_id])
      render :new
    end
  end

  def show
    if !Month.exists?(params[:month_id])
      redirect_to '/', alert: "Month not found."
    else
      @month = Month.find_by(id: params[:month_id])
      @task =  @month.tasks.find_by(id: params[:id])
      redirect_to '/', alert: "Task not found." if @task.nil?
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      @month = @task.month
      redirect_to @month
    else
      @month =  Month.find_by(id: params[:month_id])
      render :edit
    end
  end

  private
    def task_params
      a = params.require(:task).permit(:content, :calendar_id).to_hash
      b = {date: params.require(:date).permit([:year, :month, :day, :hour, :minute]).to_hash}
      return a.merge(b)
    end
end
