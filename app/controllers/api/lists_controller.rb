class Api::ListsController < Api::BaseController
  authorize_resource

  def index
    @lists = current_user.lists
    respond_with @lists
  end

  def show
    @list = current_user.lists.find(params[:id])
    respond_with @list
  end

  def create
    @list = List.new(params[:list])
    @list.user = current_user

    if @list.save
      respond_with @list
    else
      render_error(@list.errors.full_messages.to_sentence)
    end
  end

  def update
    @list = current_user.lists.find(params[:id])

    if @list.update_attributes(params[:list])
      render_object(@list)
    else
      render_error(@list.errors.full_messages.to_sentence)
    end
  end

  def destroy
    @list = current_user.lists.find(params[:id])
    if @list.destroy
      render_object({:msg => "List deleted."})
    else
      render_error("Can not delete the list")
    end
  end
end
