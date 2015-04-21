class SearchController < ApplicationController
  def index

    if params[:stype] == 'group'


          redirect_to groups_path


    elsif params[:stype] == 'player'

            redirect_to users_path


    end

  end

end
