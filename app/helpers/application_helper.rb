module ApplicationHelper
  def filter_params(filter)
    tasks_return = {
      completed: params[:completed]
    }
    tasks_return.merge(filter)
  end
end
