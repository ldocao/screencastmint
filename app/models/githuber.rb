class Githuber < ActiveRecord::Base

  #
  # Get all commits from screencastmint website project
  def self.commits
    self.client.repos.commits.all("screencastmint", "screencastmint")
  end

  private
  def self.client
    client ||= Github.new(oauth_token: ENV["GITHUB_ACCESS_TOKEN"])
  end
end
