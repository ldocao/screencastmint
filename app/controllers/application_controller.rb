class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :followers, :count_followers, :last_tweets


  def followers
    Tweet.followers
  end

  def count_followers
    Tweet.count_followers
  end

  def last_tweets(from, numbers)
    Tweet.last_tweets(from, numbers)
  end
end
