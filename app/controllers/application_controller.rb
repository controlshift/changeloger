class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def github_client
    @client ||= Octokit::Client.new(:access_token => ENV['GITHUB_API_TOKEN'])
  end
end
