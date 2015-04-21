class SearchController < ApplicationController
  def index

    if params[:stype] == 'group'

      #if there is a search comming in
      if params[:search]
          @groups = Group.search(params[:search]).order("created_at DESC")
        else
           @groups = Group.all
      end

        render "groups/index"


    elsif params[:stype] == 'player'

      # if there is a search comming in
      if params[:search]
          @users = User.search(params[:search]).order("created_at DESC")

        else
           @users = User.all
      end

            render "users/index"


    end

  end

end
