class Api::TasksController < Api::BaseController
  authorize_resource
  before_filter :load_list
  respond_to :json

  # GET /api/tasks
  # GET /api/tasks.json
  def index
    @tasks = @list.tasks
    render_object @tasks
  end

  # GET /api/tasks/1
  # GET /api/tasks/1.json
  def show
    if params[:id] == "sort"
      sort
      return
    end
    @task = @list.tasks.find(params[:id])
    render_object(@task)
  end

  # POST /api/tasks
  # POST /api/tasks.json
  def create
    @task = @list.tasks.build(params[:task])

    if @task.save
      render_object(@task)
    else
      render_error @task.errors.full_messages.to_sentence
    end
  end

  # PUT /api/tasks/1
  # PUT /api/tasks/1.json
  def update
    @task = @list.tasks.find(params[:id])

    if @task.update_attributes(params[:task])
      render_object(@task)
    else
      render_error(@task.errors.full_messages.to_json)
    end
  end

  # DELETE /api/tasks/1
  # DELETE /api/tasks/1.json
  def destroy
    @task = @list.tasks.find(params[:id])
    if @task.destroy
      render_object({:msg => "Task deleted."})
    else
      render_error("Task can not deleted.")
    end
  end


  def sort
    sort_by = params[:sort_by]
    sort_order = params[:sort_order]
    @tasks = @list.tasks.order("#{sort_by} #{sort_order}")
    render_object(@tasks)
  end

  private
  def load_list
    @list = current_user.lists.find(params[:list_id])
    render_error("Please provide the list in the url") unless @list
  end
end
