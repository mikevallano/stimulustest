class ListsController < ApplicationController
  def index
    @lists = current_user.lists
  end

  def show
    @list = current_user.lists.find_by!(id: params[:id])
  end
end
