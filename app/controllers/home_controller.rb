class HomeController < ApplicationController
  def index
    @crew = User.all_users_except(current_user)
    @crew = @crew.where(:account_type => 'Crew', :available => 'Available')
    @captains = User.all_users_except(current_user)
    @captains = @captains.where(:account_type => 'Captain', :available => 'Available')
  end
end
