class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    list_id = params[:id].to_i
    @bookmarks = Bookmark.where(list_id: list_id)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_list)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def params_list
    params.require(:list).permit(:name)
  end
end
