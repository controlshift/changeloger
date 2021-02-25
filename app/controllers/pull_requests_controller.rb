class PullRequestsController < ApplicationController
  before_action :load_changelog, only: [:edit, :update, :destroy]

  def index
    @pull_requests = github_client.pull_requests('controlshift/agra', state: 'all', page: params[:page])
  end
end
