class Tweet < ActiveRecord::Base
  attr_reader :attribute_name

  # Get list of followers
  #
  # @return [Array] list of followers
  def self.followers
    self.connect_twitter
    @client.followers
  end

  # Get numbers of followers
  #
  # @return [Integer] the number of followers
  def self.count_followers
    self.connect_twitter
    @client.followers.count
  end

  # Get last tweets
  #
  # @param [String, Integer] user and numbers of tweet
  # @return [Array] lasts tweets
  def self.last_tweets(user, numbers)
    self.connect_twitter

    users = ["@#{user}", "#{user}"]
    ary = []

    users.each do |user|
      @client.search("#{user}").collect { |tweet| ary << tweet }
    end

    tweets = ary.sort_by { |tweet| tweet.created_at }
    tweets.reverse.take(numbers)
  end

  private
  def self.connect_twitter
    @client ||= self.client
  end

  def self.client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
    end
  end
end
