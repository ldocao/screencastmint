class Githuber < ActiveRecord::Base
  def self.commits
    self.client
    @client.repos.commits.all("screencastmint", "screencastmint")
  end

  private
  def self.client
    @client ||= Github.new(oauth_token: ENV["GITHUB_ACCESS_TOKEN"])
  end
end
