module TasksHelper
  def task_display(tasks)
    task = tasks[0]
    content_tag :div, class: 'event' do
      content_tag(:div, "#{task.content}", class:'event-desc') +
      content_tag(:div, "#{task.start_time.strftime("%I:%M %p")}" ,class: 'event-time')
    end
  end

  def task_for_day(month, day)
    tasks = month.tasks.select{|task| task.start_time.day == day}
    task_display(tasks) unless tasks.empty?
  end

end
