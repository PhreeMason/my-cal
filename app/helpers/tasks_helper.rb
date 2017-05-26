module TasksHelper

  def task_display(tasks)
    task = tasks[0]
    content_tag :div, class: 'event' do
      content_tag(:div, "#{task.content}", class:'event-desc') +
      content_tag(:div, "#{task.start_time.strftime("%I:%M %p")}" ,class: 'event-time')
    end
  end

  def task_for_day(month, day)
    tasks = Task.for_today(month, day)
    task_display(tasks) unless tasks.empty?
  end

  def task_form_display(task)
     if task.errors.any?
       content_tag :div, class: 'error_explanation' do
         tag.h2 content_tag(:p, "#{pluralize(task.errors.count, 'error')} prohibited this task from being saved:")
        tag.ul do
          task.errors.full_messages.each do |message|
           tag.li message
          end
        end
       end
     end
  end

end
