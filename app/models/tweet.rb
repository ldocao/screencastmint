class Tweet < ActiveRecord::Base

  # Get list of followers
  #
  # @return [Array] list of followers
  def self.followers
    self.client.followers
  end

  # Get numbers of followers
  #
  # @return [Integer] the number of followers
  def self.count_followers
    self.client.followers.count
  end

  # Get last tweets
  #
  # @param [String, Integer] user and numbers of tweet
  # @return [Array] lasts tweets
  def self.last_tweets(user, numbers)
    users = ["@#{user}", "#{user}"]
    ary   = []

    users.each do |user|
      self.client.search("#{user}").collect { |tweet| ary << tweet }
    end

    tweets = ary.sort_by { |tweet| tweet.created_at }
    tweets.reverse.take(numbers)
  end

  private

  def self.client
    client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
    end
  end
end
