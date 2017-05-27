module TasksHelper

  def task_display(tasks)
    task = tasks[0]
    link_to(month_task_path(task.month, task)) do
      content_tag :div, class: 'event' do
        content_tag(:div, "#{task.content}", class:'event-desc') +
        content_tag(:div, "#{task.start_time.strftime("%I:%M %p")}" ,class: 'event-time')
      end
    end
  end

  def task_for_day(month, day)
    tasks =  task_filter(Task.for_today(month, day))
    task_display(tasks) unless tasks.empty?
  end

  def more_tasks(month, day)
    tasks =  task_filter(Task.for_today(month, day))
    if tasks.count > 1
      link_to "#{tasks.count - 1} more", month_task_path(month, tasks[0]), class: 'more-tasks'
    end
  end

  def task_filter(tasks)
    tasks.select {|task| current_user.tasks.include?(task)}
  end

  def new_task_form(month, day)
    link_to 'New', new_month_task_path(prev_month(month), day), class: 'new-task'
  end

end
