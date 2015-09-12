class Tweet < ActiveRecord::Base
  attr_reader :attribute_name

  def self.followers
    self.connect_twitter
    @client.followers
  end

  def self.count_followers
    self.connect_twitter
    @client.followers.count
  end

  def self.last_tweets(from, numbers)
    self.connect_twitter

    ary = []
    @client.search("#{from}").take(numbers).collect { |tweet| ary << tweet }

    ary
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
