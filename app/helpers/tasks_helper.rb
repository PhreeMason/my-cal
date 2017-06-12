module TasksHelper

  def task_index_header(tasks)
    task= tasks[0]
    content_tag(:b, "#{task.month.name} #{task.month.year}")
  end

end
