class TasksController < ApplicationController

  def new
    if !Month.exists?(params[:month_id])
      redirect_to '/', alert: "Month not found."
    else
      @month = my_cal.months.find_by(id: params[:month_id])
      @task = Task.new(month_id: params[:month_id], start_time: @month.to_time(params[:day]))
    end
  end

  def edit
    @month = my_cal.months.find_by(id: params[:month_id])
    if @month.nil?
      redirect_to '/', alert: "Month not found."
    else
      @task = @month.tasks.find_by(id: params[:id])
      redirect_to '/', alert: "Task not found." if @task.nil?
    end
  end

  def create
    binding.pry
    @task = Task.new(task_params)
    binding.pry
    if @task.save
      my_cal.save
      @month = @task.month
      redirect_to @month
    else
      @month =  my_cal.months.find_by(id: params[:month_id])
      render :new
    end
  end
  
  def more 
    if !Month.exists?(params[:month_id])
      redirect_to '/', alert: "Month not found."
    else
      @month = my_cal.months.find_by(id: params[:month_id])
      @tasks = @month.tasks_today(params[:day])
      redirect_to @month, alert: "Task not found." if @tasks.empty?
    end
    render :show
    # respond_to do |format|
    #   format.html { render :index}
    #   format.json { render json: @tasks}
    # end
  end

  def show
    if !Month.exists?(params[:month_id])
      redirect_to '/', alert: "Month not found."
    else
      @month = my_cal.months.find_by(id: params[:month_id])
      @task =  @month.tasks.find_by(id: params[:id])
      redirect_to '/', alert: "Task not found." if @task.nil?
    end
    respond_to do |format|
      format.html { render :show}
      format.json { render json: @task}
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      @month = @task.month
      redirect_to @month
    else
      @month =  my_cal.months.find_by(id: params[:month_id])
      render :edit
    end
  end

  def destroy
    task = current_user.tasks.find_by(id: params[:id])
    if task
      month = task.month
      task.destroy
      redirect_to month, alert: "Task deleted."
    else
      redirect_to '/', alert: "Task not found."
    end
  end

  def index
    @month = my_cal.months.find_by(id: params[:month_id])
    months = my_cal.months.select { |e| !e.tasks.empty?  }
    @tasks = months.map(&:tasks)
  end

  def upcoming
    @tasks = my_cal.upcoming_tasks
    @month = my_cal.find_month_by_time(Time.now)
    render :index
  end
  
  def old_news
    @tasks = my_cal.old_news
    @month = my_cal.find_month_by_time(Time.now)
    render :index
  end

  private
    def task_params
      a = params.require(:task).permit(:content, :calendar_id).to_hash
      b = {date: params.require(:date).permit([:year, :month, :day, :hour, :minute]).to_hash}
      return a.merge(b)
    end
end
