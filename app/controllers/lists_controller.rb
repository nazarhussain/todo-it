class ListsController < ApplicationController
  authorize_resource

  # GET /task_lists
  # GET /task_lists.json
  def index
    if params[:search].present?
      @lists = current_user.lists.search(params[:search])
      @trigger_click = false
    else
      @lists = current_user.lists
      @trigger_click = true
    end

    respond_to do |format|
      format.js
    end
  end

  # GET /task_lists/1
  # GET /task_lists/1.json
  def show

    @list = current_user.lists.find(params[:id])
    @search = @list.tasks.search(params[:search])
    @tasks = @search.all

    respond_to do |format|
      format.js
    end
  end

  # GET /task_lists/new
  # GET /task_lists/new.json
  def new
    @list = current_user.lists.build
    @list.title = 'Untitled List'
    @list.save

    respond_to do |format|
      format.js
    end
  end

  # GET /task_lists/1/edit
  def edit
    @list = List.find(params[:id])
  end

  # POST /task_lists
  # POST /task_lists.json
  def create
    @list = List.new(params[:list])

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'Task list was successfully created.' }
        format.json { render json: @list, status: :created, location: @list }
      else
        format.html { render action: "new" }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /task_lists/1
  # PUT /task_lists/1.json
  def update
    @list = current_user.lists.find(params[:id])
    @list.update_attributes(params[:list])
    render :nothing => true
  end

  # DELETE /task_lists/1
  # DELETE /task_lists/1.json
  def destroy
    @list = current_user.lists.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.js
    end
  end
end
