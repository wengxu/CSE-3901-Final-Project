class GroupsController < ApplicationController
  def show
	@group = Group.find(params[:id])
  end

  def new
	@group = Group.new
  end

  def edit
	@category = Group.find(params[:id])
  end

  def delete
  end

  private
  def group_params
  	params.require(:group).permit(:name, :thumburl)
  end
end
