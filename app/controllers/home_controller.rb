class HomeController < ApplicationController
  def index
    @crew = User.all_users_except(current_user).where(:account_type => 'Crew', :available => 'Available')
    @captains = User.all_users_except(current_user).where(:account_type => 'Captain', :available => 'Available')

    if params[:search] != nil
      @crew = User.all_users_except(current_user).where(:account_type => 'Crew', :available => 'Available').search(params[:search])
      @captains = User.all_users_except(current_user).where(:account_type => 'Captain', :available => 'Available').search(params[:search])
    end
  end

  def user
    @user = User.find(params[:id])
  end
end
