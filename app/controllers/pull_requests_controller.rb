class PullRequestsController < ApplicationController
  def index
    @pull_requests = github_client.pull_requests('controlshift/agra', state: 'all', page: params[:page])
  end
end
