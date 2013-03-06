class WorkspaceController < ApplicationController
  def index
    authorize! :manage, :workspace
  end
end
