class HomeController < ApplicationController
  
  def index
    if current_user
      @timeline = current_user.timeline
      @users = User.all
    end
  end
end
