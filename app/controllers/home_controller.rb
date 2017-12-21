class HomeController < ApplicationController
  def index
    @crew = User.all_users_except(current_user).all_available_crew
    @captains = User.all_users_except(current_user).all_available_captains

    if params[:search] != nil
      @crew = User.all_users_except(current_user).all_available_crew.search(params[:search])
      @captains = User.all_users_except(current_user).all_available_captains.search(params[:search])
    end
  end

  def user
    @user = User.find(params[:id])
  end
end
