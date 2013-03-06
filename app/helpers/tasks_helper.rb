module TasksHelper
  def priority_class(task)
    case task.priority
      when Task::PRIORITY_LOW
        'label'
      when Task::PRIORITY_NORMAL
        'label-success'
      when Task::PRIORITY_MEDIUM
        'label-info'
      when Task::PRIORITY_HIGH
        'label-important'
    end
  end
end
