class TasksController < ApplicationController
  authorize_resource

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = current_user.lists.find(params[:list_id]).tasks

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = current_user.lists.find(params[:list_id]).tasks.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = current_user.lists.find(params[:list_id]).tasks.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = current_user.lists.find(params[:list_id]).tasks.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.lists.find(params[:list_id]).tasks.build(params[:task])

    respond_to do |format|
      if @task.save
        format.js
      else
        render :js => "TODO_IT.UI.show_alert('Something went wrong.')"
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = current_user.lists.find(params[:list_id]).tasks.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.js
      else
        render :js => "TODO_IT.UI.show_alert('Something went wrong.')"
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = current_user.lists.find(params[:list_id]).tasks.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.js
    end
  end
end
