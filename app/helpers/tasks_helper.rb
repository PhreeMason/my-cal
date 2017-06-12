module TasksHelper

  def task_display(tasks)
    task = tasks[0]
    link_to(month_task_path(task.month, task)) do
      content_tag :div, class: 'event' do
        content_tag(:div, "#{task.content}", class:'event-desc') +
        content_tag(:div, "#{task.time}" ,class: 'event-time')
      end
    end
  end

  # def task_for_day(month, day)
  #   tasks =  task_filter(month, day)
  #   task_display(tasks) unless tasks.empty?
  # end

  # def more_tasks(month, day)
  #   tasks =  task_filter(month, day)
  #   if tasks.count > 1
  #     link_to "#{tasks.count - 1} more", more_task_day_path(month, day), class: 'more-tasks'
  #   end
  # end

  def task_filter(month, day)
    tasks = month.tasks.select{|e| e.start_time.day == day }
    tasks.select {|task| current_user.tasks.include?(task)}
  end

  def new_task_form(month, day)
    link_to 'New', new_month_task_path(month, day), class: 'new-task'
  end

  def task_index_header(tasks)
    task= tasks[0]
    content_tag(:b, "#{task.month.name} #{task.month.year}")
  end

end
