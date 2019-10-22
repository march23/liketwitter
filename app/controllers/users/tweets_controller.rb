class Users::TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = current_user.tweets
  end

  def new
    @tweet = current_user.tweets.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)

    if @tweet.save
      redirect_to users_tweets_path
    else
      render :new
    end
  end

  def destroy 
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy

    redirect_to users_tweets_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:description)
  end
end
