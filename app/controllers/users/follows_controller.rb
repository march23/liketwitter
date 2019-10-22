class Users::FollowsController < ApplicationController
  before_action :authenticate_user!

  def follow
    current_user.followees.push(user)
    redirect_to root_path
  end

  def unfollow
    current_user.followees.delete(user)
    redirect_to root_path
  end

  private

  def user
    User.find(params[:id])
  end
end
